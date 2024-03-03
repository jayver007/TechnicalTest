using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.Eventing.Reader;

namespace TechnicalTest.Entities
{
    public class CarBuyer
    {
        [Key]
        [Required]
        [Column(Order = 1)]
        public int Id { get; set; }

        public int CarId { get; set; }
        public Car Car { get; set; }

        public int BuyerId { get; set; }
        public Buyer Buyer { get; set; }

        public bool Current { get; set; }

        [Column(TypeName = "decimal(18, 2)")]
        public decimal Quote { get; set; }

        public ICollection<CarBuyerStateHistory> CarBuyerStates { get; set; }

    }
}
