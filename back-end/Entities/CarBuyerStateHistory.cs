using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TechnicalTest.Entities
{
    public class CarBuyerStateHistory
    {
        //[Key]
        //[Required]
        //[Column(Order = 1)]
        //public int Id { get; set; }
        
        [Column(Order = 2)]
        public int CarBuyerId { get; set; }
        public CarBuyer CarBuyer { get; set; }

        public int StateId { get; set; }
        public State State { get; set; }

        [Column(TypeName = "date")] 
        public DateTime CreatedAt { get; set; }

    }
}
