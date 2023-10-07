using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class Asignatura
{
    public int Idasig { get; set; }

    public string Descripcion { get; set; } = null!;

    public int Grupo { get; set; }

    public string PeriodoAcad { get; set; } = null!;

    public string Aula { get; set; } = null!;

    public DateTime Fecha { get; set; }

    public int Idprog { get; set; }

    public virtual ICollection<Homologacion> Homologacions { get; set; } = new List<Homologacion>();

    public virtual Programa IdprogNavigation { get; set; } = null!;
}
