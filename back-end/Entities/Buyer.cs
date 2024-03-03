using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TechnicalTest.Entities
{
    public class Buyer
    {
        [Key]
        [Required]
        public int Id { get; set; }
        
        [Required]
        [StringLength(maximumLength: 200)]
        public string Name { get; set; }
        
        [Required]
        [StringLength(maximumLength: 200)]
        public string LastName { get; set; }

        public ICollection<CarBuyer> CarBuyers { get; set; }


    }
}
