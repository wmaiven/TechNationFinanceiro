namespace TechNationFinanceiroApi.Models
{
    public class FiltroNotas
    {
        public int MesEmissao { get; set; }
        public int MesCobranca { get; set; }
        public int MesPagamento { get; set; }
        public string? Status { get; set; }
    }
}
