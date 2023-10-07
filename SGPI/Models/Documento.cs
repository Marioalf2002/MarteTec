﻿using System;
using System.Collections.Generic;

namespace SGPI.Models;

public partial class Documento
{
    public int Iddoc { get; set; }

    public string Descripcion { get; set; } = null!;

    public virtual ICollection<Usuario> Usuarios { get; set; } = new List<Usuario>();
}
