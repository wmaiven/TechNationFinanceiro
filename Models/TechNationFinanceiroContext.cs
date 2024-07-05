using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Reflection.Emit;

namespace TechNationFinanceiroApi.Models
{
    public class TechNationFinanceiroContext : DbContext
    {
        public TechNationFinanceiroContext(DbContextOptions<TechNationFinanceiroContext> options)
            : base(options)
        {
        }
        public DbSet<NotaFiscal> NotasFiscais { get; set; }

    }
}
