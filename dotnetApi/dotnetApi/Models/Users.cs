using System.ComponentModel.DataAnnotations;

namespace dotnetApi.Models
{
    public class Users
    {
        [Key]
        public int user_id { get; set; }

        [Required]
        public string username { get; set; }

        
        public string email { get; set; }

        [Required]
        public string password { get; set; }

        
        public string role { get; set; } // "admin" veya "normal"
    }
}
