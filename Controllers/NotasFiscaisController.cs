using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TechNationFinanceiroApi.Models;
using TechNationFinanceiroApi.Services;
using TechNationFinanceiroApi.Services.Interface;

namespace TechNationFinanceiroApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotasFiscaisController : ControllerBase
    {
        private readonly INotaFiscalService _service;

        public NotasFiscaisController(INotaFiscalService context)
        {
            _service = context;
        }

        // GET: api/NotasFiscais
        [HttpGet]
        public ActionResult<IEnumerable<NotaFiscal>> GetNotasFiscais()
        {
            return Ok(_service.GetNotasFiscais());
        }

        // GET: api/NotasFiscais/5
        [HttpGet("{id}")]
        public ActionResult<NotaFiscal> GetNotaFiscal(int id)
        {
            var notaFiscal = _service.GetNotaFiscal(id);

            if (notaFiscal == null)
            {
                return NotFound();
            }

            return notaFiscal;
        }

        // POST: api/NotasFiscais
        [HttpPost]
        public ActionResult<NotaFiscal> PostNotaFiscal(NotaFiscal? notaFiscal)
        {
            notaFiscal = _service.PostNotaFiscal(notaFiscal);

            return Ok(notaFiscal);
        }

        // PUT: api/NotasFiscais/5
        [HttpPut("{id}")]
        public IActionResult PutNotaFiscal(int id, NotaFiscal notaFiscal)
        {
            if (id != notaFiscal.Id)
            {
                return BadRequest("ID mismatch");
            }

            var result = _service.PutNotaFiscal(id, notaFiscal);

            if (result)
            {
                return Ok();
            }
            else
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Erro ao atualizar a Nota Fiscal");
            }
        }

        // DELETE: api/NotasFiscais/5
        [HttpDelete("{id}")]
        public IActionResult DeleteNotaFiscal(int id)
        {
            if (_service.DeleteNotaFiscal(id))
            {
                return Ok();
            }
            return NotFound();
        }
    }
}
