using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
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
            try
            {
                return _context.NotasFiscais.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao recuperar as Notas Fiscais do banco de dados.", ex);
            }
        }

        public NotaFiscal? GetNotaFiscal(int id)
        {
            try
            {
                var notaFiscal = _context.NotasFiscais.Find(id);
                return notaFiscal;
            }
            catch (Exception ex)
            {
                throw new Exception($"Erro ao recuperar a Nota Fiscal com ID {id} do banco de dados.", ex);
            }
        }

        public NotaFiscal PostNotaFiscal(NotaFiscal notaFiscal)
        {
            if (notaFiscal == null)
            {
                throw new ArgumentNullException(nameof(notaFiscal));
            }

            // Validar o status da nota fiscal
            if (!IsValidStatus(notaFiscal.Status))
            {
                throw new ArgumentException("Status inválido para criação de nota fiscal.", nameof(notaFiscal.Status));
            }

            try
            {
                _context.NotasFiscais.Add(notaFiscal);
                _context.SaveChanges();
                return notaFiscal;
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao criar a Nota Fiscal no banco de dados.", ex);
            }
        }

        public Boolean PutNotaFiscal(int id, NotaFiscal notaFiscal)
        {
            if (id != notaFiscal.Id)
            {
                throw new ArgumentException("ID da Nota Fiscal não corresponde ao ID fornecido.");
            }

            try
            {
                _context.Entry(notaFiscal).State = EntityState.Modified;
                _context.SaveChanges();
                return true;
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NotaFiscalExists(id))
                {
                    return false;
                }
                else
                {
                    throw;
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"Erro ao atualizar a Nota Fiscal com ID {id} no banco de dados.", ex);
            }
        }

        public Boolean DeleteNotaFiscal(int id)
        {
            try
            {
                var notaFiscal = _context.NotasFiscais.Find(id);
                if (notaFiscal == null)
                {
                    return false;
                }

                _context.NotasFiscais.Remove(notaFiscal);
                _context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Erro ao excluir a Nota Fiscal com ID {id} do banco de dados.", ex);
            }
        }

        private bool NotaFiscalExists(int id)
        {
            //verificação se a nota fiscal existe no banco
            return _context.NotasFiscais.Any(e => e.Id == id);
        }
        private bool IsValidStatus(string status)
        {
            // Lista de status válidos para criação de notas fiscais
            var validStatus = new[] { "Emitida", "Cobrança realizada", "Pagamento em atraso", "Pagamento realizado" };

            return Array.IndexOf(validStatus, status) != -1;
        }
    }
}
