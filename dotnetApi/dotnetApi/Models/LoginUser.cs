using System.ComponentModel.DataAnnotations;

namespace dotnetApi.Models
{
    public class LoginUser
    {
        [Key]
        [Required]
        public string username { get; set; }

        [Required]
        public string password { get; set; }

       
    }
}
