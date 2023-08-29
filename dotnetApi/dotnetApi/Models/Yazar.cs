using System.ComponentModel.DataAnnotations;

namespace dotnetApi.Models
{
    public class Yazar
    {
        [Key]
        public int yazar_id { get; set; }
        public string yazar_adi { get; set; }
    }
}
