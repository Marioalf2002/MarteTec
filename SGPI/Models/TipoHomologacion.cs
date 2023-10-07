using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class TipoHomologacion
{
    public int Idtipohom { get; set; }

    public string Descripcion { get; set; } = null!;

    public virtual ICollection<Homologacion> Homologacions { get; set; } = new List<Homologacion>();
}
