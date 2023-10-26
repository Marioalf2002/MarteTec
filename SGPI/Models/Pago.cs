using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class Pago
{
    public int Idpay { get; set; }

    public DateTime Fecha { get; set; }

    public string Recibo { get; set; } = null!;

    public long IdUser { get; set; }

    public double Valor { get; set; }

    public virtual Usuario IdUserNavigation { get; set; } = null!;
}
