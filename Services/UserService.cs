using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using TechNationFinanceiroApi.Models;

namespace TechNationFinanceiroApi.Services
{
    public class UserService : IUserService
    {
        private readonly TechNationFinanceiroContext _context;
        private readonly IConfiguration _configuration;

        public UserService(TechNationFinanceiroContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        public async Task<string> AuthenticateAsync(string username, string password)
        {
            var user = await _context.Users.SingleOrDefaultAsync(x => x.Username == username && x.Password == password);

            if (user == null)
                return null; // Retorna null se o usuário não for encontrado no banco de dados

            var token = GenerateJwtToken(user.Id.ToString(), user.Username);
            return token;
        }

        // Método para gerar o token JWT
        private string GenerateJwtToken(string userId, string username)
        {
            var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtConfig:SecretKey"]));
            var signingCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier, userId),
                new Claim(ClaimTypes.Name, username)
            };

            var tokenOptions = new JwtSecurityToken(
                issuer: _configuration["JwtConfig:Issuer"],
                audience: _configuration["JwtConfig:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddHours(1), // Tempo de expiração do token
                signingCredentials: signingCredentials
            );

            return new JwtSecurityTokenHandler().WriteToken(tokenOptions);
        }
    }
}
