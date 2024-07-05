using Microsoft.AspNetCore.Mvc;
using TechNationFinanceiroApi.Models;
using TechNationFinanceiroApi.Services.Interface;

namespace TechNationFinanceiroApi.Services
{
    public class NotaFiscalService : INotaFiscalService
    {
        private readonly TechNationFinanceiroContext _context;

        public NotaFiscalService(TechNationFinanceiroContext context)
        {
            _context = context;
        }

        public IEnumerable<NotaFiscal> GetNotasFiscais()
        {
            return _context.NotasFiscais.ToList();
        }

        public NotaFiscal? GetNotaFiscal(int id)
        {
            var notaFiscal = _context.NotasFiscais.Find(id);
            return notaFiscal;
        }

        public NotaFiscal? PostNotaFiscal(NotaFiscal? notaFiscal)
        {
            if (notaFiscal == null) return null;
            _context.NotasFiscais.Add(notaFiscal);
            _context.SaveChanges();

            return notaFiscal;
        }

        public Boolean PutNotaFiscal(int id, NotaFiscal notaFiscal)
        {
            if (id != notaFiscal.Id)
            {
                return false;
            }

            _context.Entry(notaFiscal).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            _context.SaveChanges();

            return true;
        }

        public Boolean DeleteNotaFiscal(int id)
        {
            var notaFiscal = _context.NotasFiscais.Find(id);
            if (notaFiscal == null)
            {
                return true;
            }

            _context.NotasFiscais.Remove(notaFiscal);
            _context.SaveChanges();

            return true;
        }
    }
}
