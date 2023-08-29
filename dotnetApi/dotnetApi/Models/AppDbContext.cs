using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace dotnetApi.Models
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {

        }

      
        public DbSet<Yazar> yazarlar { get; set; }
        public DbSet<Kitap> kitaplar { get; set; }

        public DbSet<Users> users { get; set; }
        public DbSet<LoginUser> LoginUser { get; set; }



    }
}