using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class Programa
{
    public int Idprog { get; set; }

    public string Descripcion { get; set; } = null!;

    public virtual ICollection<Asignatura> Asignaturas { get; set; } = new List<Asignatura>();

    public virtual ICollection<Usuario> Usuarios { get; set; } = new List<Usuario>();
}
