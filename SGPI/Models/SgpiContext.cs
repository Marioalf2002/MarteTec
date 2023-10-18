using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace SGPI.Models;

public partial class SgpiContext : DbContext
{
    public SgpiContext()
    {
    }

    public SgpiContext(DbContextOptions<SgpiContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Asignatura> Asignaturas { get; set; }

    public virtual DbSet<Documento> Documentos { get; set; }

    public virtual DbSet<Genero> Generos { get; set; }

    public virtual DbSet<Homologacion> Homologacions { get; set; }

    public virtual DbSet<Pago> Pagos { get; set; }

    public virtual DbSet<Programa> Programas { get; set; }

    public virtual DbSet<Rol> Rols { get; set; }

    public virtual DbSet<TipoHomologacion> TipoHomologacions { get; set; }

    public virtual DbSet<Usuario> Usuarios { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    #warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=PORTATILPRSNL\\SQLEXPRESS;Database=SGPI;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Asignatura>(entity =>
        {
            entity.HasKey(e => e.Idasig);

            entity.ToTable("Asignatura");

            entity.HasIndex(e => e.Idasig, "ID_asig").IsUnique();

            entity.Property(e => e.Idasig).ValueGeneratedNever();
            entity.Property(e => e.Aula)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("aula");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("descripcion");
            entity.Property(e => e.Fecha)
                .HasColumnType("date")
                .HasColumnName("fecha");
            entity.Property(e => e.Grupo).HasColumnName("grupo");
            entity.Property(e => e.PeriodoAcad)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("periodo_acad");

            entity.HasOne(d => d.IdprogNavigation).WithMany(p => p.Asignaturas)
                .HasForeignKey(d => d.Idprog)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Asignatura_Programa");
        });

        modelBuilder.Entity<Documento>(entity =>
        {
            entity.HasKey(e => e.Iddoc);

            entity.ToTable("Documento");

            entity.HasIndex(e => e.Iddoc, "ID_doc").IsUnique();

            entity.Property(e => e.Iddoc).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("descripcion");
        });

        modelBuilder.Entity<Genero>(entity =>
        {
            entity.HasKey(e => e.Idgen);

            entity.ToTable("Genero");

            entity.HasIndex(e => e.Idgen, "ID_gen").IsUnique();

            entity.Property(e => e.Idgen).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("descripcion");
        });

        modelBuilder.Entity<Homologacion>(entity =>
        {
            entity.HasKey(e => e.Idhom);

            entity.ToTable("Homologacion");

            entity.HasIndex(e => e.Idhom, "ID_hom").IsUnique();

            entity.Property(e => e.Idhom).ValueGeneratedNever();
            entity.Property(e => e.Asiganterior)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("asiganterior");
            entity.Property(e => e.Asignueva)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("asignueva");
            entity.Property(e => e.Creditosanterior).HasColumnName("creditosanterior");
            entity.Property(e => e.Creditosnuevos).HasColumnName("creditosnuevos");
            entity.Property(e => e.Documento).HasColumnName("documento");
            entity.Property(e => e.Nivelanterior).HasColumnName("nivelanterior");
            entity.Property(e => e.Nivelnuevo).HasColumnName("nivelnuevo");
            entity.Property(e => e.Nota).HasColumnName("nota");
            entity.Property(e => e.Programa)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("programa");
            entity.Property(e => e.Tipodoc).HasColumnName("tipodoc");

            entity.HasOne(d => d.IdasigNavigation).WithMany(p => p.Homologacions)
                .HasForeignKey(d => d.Idasig)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Homologacion_Asignatura");

            entity.HasOne(d => d.IdtipohomNavigation).WithMany(p => p.Homologacions)
                .HasForeignKey(d => d.Idtipohom)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Homologacion_Tipo_Homologacion");

            entity.HasOne(d => d.IduserNavigation).WithMany(p => p.Homologacions)
                .HasForeignKey(d => d.Iduser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Homologacion_Usuarios");
        });

        modelBuilder.Entity<Pago>(entity =>
        {
            entity.HasKey(e => e.Idpay);

            entity.HasIndex(e => e.Idpay, "ID_pay").IsUnique();

            entity.Property(e => e.Idpay).ValueGeneratedNever();
            entity.Property(e => e.Fecha)
                .HasColumnType("date")
                .HasColumnName("fecha");
            entity.Property(e => e.IdUser).HasColumnName("ID_user");
            entity.Property(e => e.Recibo)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("recibo");
            entity.Property(e => e.Valor).HasColumnName("valor");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Pagos)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Pagos_Usuarios");
        });

        modelBuilder.Entity<Programa>(entity =>
        {
            entity.HasKey(e => e.Idprog);

            entity.ToTable("Programa");

            entity.HasIndex(e => e.Idprog, "ID_prog").IsUnique();

            entity.Property(e => e.Idprog).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("descripcion");
        });

        modelBuilder.Entity<Rol>(entity =>
        {
            entity.HasKey(e => e.Idrol);

            entity.ToTable("Rol");

            entity.HasIndex(e => e.Idrol, "ID_rol").IsUnique();

            entity.Property(e => e.Idrol).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("descripcion");
        });

        modelBuilder.Entity<TipoHomologacion>(entity =>
        {
            entity.HasKey(e => e.Idtipohom);

            entity.ToTable("Tipo_Homologacion");

            entity.HasIndex(e => e.Idtipohom, "ID_tipo_hom").IsUnique();

            entity.Property(e => e.Idtipohom).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("descripcion");
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasKey(e => e.Iduser);

            entity.HasIndex(e => e.Iduser, "ID_usuer").IsUnique();

            entity.Property(e => e.Iduser).ValueGeneratedNever();
            entity.Property(e => e.Activo).HasColumnName("activo");
            entity.Property(e => e.Documento).HasColumnName("documento");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Genero).HasColumnName("genero");
            entity.Property(e => e.NumDoc).HasColumnName("num_doc");
            entity.Property(e => e.Pass)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("pass");
            entity.Property(e => e.PrimerApellido)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("primer_apellido");
            entity.Property(e => e.PrimerNombre)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("primer_nombre");
            entity.Property(e => e.Programa).HasColumnName("programa");
            entity.Property(e => e.Rol).HasColumnName("rol");
            entity.Property(e => e.SegundoApellido)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("segundo_apellido");
            entity.Property(e => e.SegundoNombre)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("segundo_nombre");

            entity.HasOne(d => d.DocumentoNavigation).WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.Documento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Usuarios_Documento1");

            entity.HasOne(d => d.GeneroNavigation).WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.Genero)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Usuarios_Genero1");

            entity.HasOne(d => d.ProgramaNavigation).WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.Programa)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Usuarios_Programa1");

            entity.HasOne(d => d.RolNavigation).WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.Rol)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Usuarios_Rol1");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
