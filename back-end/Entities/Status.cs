using System.ComponentModel.DataAnnotations;

namespace TechnicalTest.Entities
{
    public class State
    {
        [Key]
        [Required]
        public int Id { get; set; }
        
        [Required]
        [StringLength(maximumLength: 100)]
        public string Name { get; set; }
    }
}
