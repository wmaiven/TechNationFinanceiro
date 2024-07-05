using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
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
            try
            {
                return Ok(_service.GetNotasFiscais());
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Erro ao recuperar as Notas Fiscais: {ex.Message}");
            }
        }

        // GET: api/NotasFiscais/5
        [HttpGet("{id}")]
        public ActionResult<NotaFiscal> GetNotaFiscal(int id)
        {
            try
            {
                var notaFiscal = _service.GetNotaFiscal(id);

                if (notaFiscal == null)
                {
                    return NotFound();
                }

                return notaFiscal;
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Erro ao recuperar a Nota Fiscal com ID {id}: {ex.Message}");
            }
        }

        // POST: api/NotasFiscais
        [HttpPost]
        public ActionResult<NotaFiscal> PostNotaFiscal(NotaFiscal notaFiscal)
        {
            try
            {
                var result = _service.PostNotaFiscal(notaFiscal);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Erro ao criar a Nota Fiscal: {ex.Message}");
            }
        }

        // PUT: api/NotasFiscais/5
        [HttpPut("{id}")]
        public IActionResult PutNotaFiscal(int id, NotaFiscal notaFiscal)
        {
            try
            {
                if (id != notaFiscal.Id)
                {
                    return BadRequest("ID mismatch");
                }

                bool result = _service.PutNotaFiscal(id, notaFiscal);

                if (result)
                {
                    return Ok();
                }
                else
                {
                    return StatusCode(StatusCodes.Status500InternalServerError, "Erro ao atualizar a Nota Fiscal");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Erro ao atualizar a Nota Fiscal com ID {id}: {ex.Message}");
            }
        }

        // DELETE: api/NotasFiscais/5
        [HttpDelete("{id}")]
        public IActionResult DeleteNotaFiscal(int id)
        {
            try
            {
                if (_service.DeleteNotaFiscal(id))
                {
                    return Ok();
                }
                return NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Erro ao excluir a Nota Fiscal com ID {id}: {ex.Message}");
            }
        }
    }
}
