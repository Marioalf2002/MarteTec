using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class Genero
{
    public int Idgen { get; set; }

    public string Descripcion { get; set; } = null!;

    public virtual ICollection<Usuario> Usuarios { get; set; } = new List<Usuario>();
}
