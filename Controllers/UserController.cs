using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TechNationFinanceiroApi.Models;
using TechNationFinanceiroApi.Services;

namespace TechNationFinanceiroApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] User model)
        {
            var token = await _userService.AuthenticateAsync(model.Username, model.Password);

            if (token == null)
                return Unauthorized();

            return Ok(new { Token = token });
        }
    }
}
