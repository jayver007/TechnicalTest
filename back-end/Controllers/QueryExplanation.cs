using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System;

namespace TechnicalTest.Controllers
{
    public class QueryExplanation
    {
        //public void UpdateCustomersBalanceByInvoicesTT(List<Invoice> invoices)
        //{
        //    foreach (var invoice in invoices)
        //    {
        //        var customer = dbContext.Customers.SingleOrDefault(invoice.CustomerId.Value);
        //        customer.Balance -= invoice.Total;
        //        dbContext.SaveChanges();
        //    }
        //}

        ////refactored and improved code
        //public void UpdateCustomersBalanceByInvoices(List<Invoice> invoices)
        //{
        //    //get all customers from database in one call related to invoice customers
        //    var customerIds = invoices.Select(i => i.CustomerId).Distinct().ToList();
        //    var customers = dbContext.Customers.Where(c => customerIds.Contains(c.Id)).ToList();

        //    foreach (var invoice in invoices)
        //    {
        //        var customer = customers.FirstOrDefault(c => c.Id == invoice.CustomerId);

        //        //if the customer is not created in database, it can set exception handling
        //        if (customer == null)
        //            continue;

        //        customer.Balance -= invoice.Total;
        //    }
        //    //reduce the number of calls to one bach run 
        //    dbContext.SaveChanges();
        //}

        //public async Task<OrderDTO> GetOrders(DateTime dateFrom, DateTime dateTo,
        //                                        List<int> customerIds,
        //List<int> statusIds,
        //                                        bool? isActive)
        //{
        //    IQueryable<Order> query = dbContext.Orders.AsQueryable();

        //    // building filters to search in the database for each field
        //    if (dateFrom != default(DateTime))
        //        query = query.Where(x => x.OrderDate >= dateFrom);

        //    if (dateTo != default(DateTime))
        //        query = query.Where(x => x.OrderDate <= dateTo);

        //    if (customerIds != null && customerIds.Count > 0)
        //        query = query.Where(x => customerIds.Contains(x.CustomerId));

        //    if (statusIds != null && statusIds.Count > 0)
        //        query = query.Where(x => statusIds.Contains(x.StatusId));

        //    if (isActive.HasValue)
        //    {
        //        if (isActive.Value)
        //            query = query.Where(x => x.IsActive);
        //        else
        //            query = query.Where(x => !x.IsActive);
        //    }

        //    //Run query and maps the result to the OrderDTO and return
        //    return await query.Select(o =>
        //    new OrderDTO
        //    {
        //        //map another fields of OrderDTO
        //        Id = o.Id,
        //    }).ToListAsync();
        //}
    }
}
