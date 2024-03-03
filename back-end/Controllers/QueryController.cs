using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Collections;

namespace TechnicalTest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QueryController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public QueryController (ApplicationDbContext context)
        {
            this._dbContext = context;
        }
        
        [HttpGet]
        public IActionResult GetCarBuyerStateInfo()
        {
            var query = from car in _dbContext.Cars
                        join carBuyer in _dbContext.CarsBuyers on car.Id equals carBuyer.CarId
                        join buyer in _dbContext.Buyers on carBuyer.BuyerId equals buyer.Id
                        join maxStates in (
                            from carBuyerState in _dbContext.CarBuyerStateHistory
                            group carBuyerState by carBuyerState.CarBuyerId into g
                            select new { CarBuyerId = g.Key, MaxStateCreatedAt = g.Max(x => x.CreatedAt) }
                        ) on carBuyer.Id equals maxStates.CarBuyerId
                        join carBuyerState in _dbContext.CarBuyerStateHistory 
                            on new { CarBuyerId = carBuyer.Id, CreatedAt = maxStates.MaxStateCreatedAt } 
                            equals new { CarBuyerId = carBuyerState.CarBuyerId, CreatedAt = carBuyerState.CreatedAt }
                        join state in _dbContext.States on carBuyerState.StateId equals state.Id
                        where carBuyer.Current == true
                        select new
                        {
                            CarMake = car.Make,
                            CarModel = car.Model,
                            BuyerName = buyer.Name,
                            BuyerLastName = buyer.LastName,
                            Quote = carBuyer.Quote,
                            StateName = state.Name,
                            StateCreatedAt = carBuyerState.CreatedAt
                        };

            var result = query.ToList();

            return Ok(result);
        }
    }
}
