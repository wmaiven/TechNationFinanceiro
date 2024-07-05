using Microsoft.EntityFrameworkCore;
using TechNationFinanceiroApi.Models;

namespace TechNationFinanceiroApi.Services.Interface
{
    public interface INotaFiscalService
    {
        public IEnumerable<NotaFiscal> GetNotasFiscais();

        public NotaFiscal? GetNotaFiscal(int id);

        public NotaFiscal? PostNotaFiscal(NotaFiscal? notaFiscal);

        public Boolean PutNotaFiscal(int id, NotaFiscal notaFiscal);

        public Boolean DeleteNotaFiscal(int id);
      
    }
}
