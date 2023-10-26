using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class Homologacion
{
    public int Idhom { get; set; }

    public int Idtipohom { get; set; }

    public int Idasig { get; set; }

    public long Iduser { get; set; }

    public int Tipodoc { get; set; }

    public int Documento { get; set; }

    public int Nivelanterior { get; set; }

    public string Asiganterior { get; set; } = null!;

    public int Creditosanterior { get; set; }

    public int Nivelnuevo { get; set; }

    public string Programa { get; set; } = null!;

    public string Asignueva { get; set; } = null!;

    public int Creditosnuevos { get; set; }

    public double Nota { get; set; }

    public virtual Asignatura IdasigNavigation { get; set; } = null!;

    public virtual TipoHomologacion IdtipohomNavigation { get; set; } = null!;

    public virtual Usuario IduserNavigation { get; set; } = null!;
}
