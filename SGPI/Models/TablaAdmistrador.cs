using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class TablaAdmistrador
{
    public int Iduser { get; set; }

    public string PrimerNombre { get; set; } = null!;

    public string? SegundoNombre { get; set; }

    public string PrimerApellido { get; set; } = null!;

    public string? SegundoApellido { get; set; }

    public int NumDoc { get; set; }

    public string Email { get; set; } = null!;

    public string Pass { get; set; } = null!;

    public string Documento { get; set; }

    public string Genero { get; set; }

    public string Programa { get; set; }

    public string Rol { get; set; }

    public bool Activo { get; set; }
}
