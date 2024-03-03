
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TechnicalTest.Entities
{
    public class Car
    {
        [Key]
        [Required]
        public int Id { get; set; }
        
        [Required]
        public int CarYear { get; set; }
        
        [Required]
        [StringLength(maximumLength: 200)]
        public string Make { get; set; }

        [Required]
        [StringLength(maximumLength: 200)]
        public string Model { get; set; }

        [Required]
        [StringLength(maximumLength: 200)]
        public string SubModel { get; set; }

        [Required]
        [StringLength(maximumLength: 10)]
        public string ZipCode { get; set; }

        public ICollection<CarBuyer> CarBuyers { get; set; }

    }
}
