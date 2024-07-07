using Microsoft.EntityFrameworkCore;

namespace TechNationFinanceiroApi.Models
{
    public class TechNationFinanceiroContext : DbContext
    {
        public TechNationFinanceiroContext(DbContextOptions<TechNationFinanceiroContext> options)
            : base(options)
        {
        }

        public DbSet<NotaFiscal> NotasFiscais { get; set; }
        public DbSet<User> Users { get; set; }
    }
}
