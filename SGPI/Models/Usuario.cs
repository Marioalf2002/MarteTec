using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class Usuario
{
    public int Iduser { get; set; }

    public string PrimerNombre { get; set; } = null!;

    public string? SegundoNombre { get; set; }

    public string PrimerApellido { get; set; } = null!;

    public string? SegundoApellido { get; set; }

    public int NumDoc { get; set; }

    public string Email { get; set; } = null!;

    public string Pass { get; set; } = null!;

    public int Documento { get; set; }

    public int Genero { get; set; }

    public int Programa { get; set; }

    public int Rol { get; set; }

    public bool Activo { get; set; }

    public virtual Documento DocumentoNavigation { get; set; } = null!;

    public virtual Genero GeneroNavigation { get; set; } = null!;

    public virtual ICollection<Homologacion> Homologacions { get; set; } = new List<Homologacion>();

    public virtual ICollection<Pago> Pagos { get; set; } = new List<Pago>();

    public virtual Programa ProgramaNavigation { get; set; } = null!;

    public virtual Rol RolNavigation { get; set; } = null!;
}
