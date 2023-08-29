using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace dotnetApi.Models
{
    public class Kitap
    {

        [Key]
        public int kitap_id { get; set; }
        
        public int yazar_id { get; set; }
        public string kitap_adi { get; set; }
        public string isbn { get; set; }
        public string kitap_tanimi { get; set; }
        public string kitap_tur { get; set; }
        public string yazar_adi { get; set; }
    }
}
