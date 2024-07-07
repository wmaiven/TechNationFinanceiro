using System.Threading.Tasks;
using TechNationFinanceiroApi.Models;

namespace TechNationFinanceiroApi.Services
{
    public interface IUserService
    {
        Task<string> AuthenticateAsync(string username, string password);
    }
}
