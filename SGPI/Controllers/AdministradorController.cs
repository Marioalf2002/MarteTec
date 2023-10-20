using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using SGPI.Models;
using System.Data;
using System.Data.SqlClient;

namespace SGPI.Controllers
{
    public class AdministradorController : Controller
    {
        private readonly SgpiContext _context;
        private readonly string CadenaSQL;
        SgpiContext dbcontext = new SgpiContext();

        public AdministradorController(SgpiContext context, IConfiguration config)
        {  
            _context = context;

            CadenaSQL = config.GetConnectionString("cadenaSQL");
        }

        public IActionResult Admin()
        {
            ViewBag.Genero = dbcontext.Generos.ToList();
            ViewBag.Rol = dbcontext.Rols.ToList();
            ViewBag.Doc = dbcontext.Documentos.ToList();
            ViewBag.Prog = dbcontext.Programas.ToList();

            return View();
        }

        [HttpGet]
        public JsonResult ListaUsuarios()
        {
            List<Usuario> lista = new List<Usuario>();

            using (var conexion = new SqlConnection(CadenaSQL))
            {
                conexion.Open();
                var cmd = new SqlCommand("sp_ObtenerUsuarios", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new Usuario
                        {
                            Iduser = Convert.ToInt32(dr["Iduser"]),
                            PrimerNombre = dr["primer_nombre"].ToString(),
                            SegundoNombre = dr["segundo_nombre"].ToString(),
                            PrimerApellido = dr["primer_apellido"].ToString(),
                            SegundoApellido = dr["segundo_apellido"].ToString(),
                            NumDoc = Convert.ToInt32(dr["num_doc"]),
                            Email = dr["email"].ToString(),
                            Pass = dr["pass"].ToString(),
                            Documento = Convert.ToInt32(dr["documento"]),
                            Genero = Convert.ToInt32(dr["genero"]),
                            Programa = Convert.ToInt32(dr["programa"]),
                            Rol = Convert.ToInt32(dr["rol"]),
                            Activo = Convert.ToBoolean(dr["activo"])
                        });

                        //lista.Add(new Usuario
                        //{
                        //    Iduser = Convert.ToInt32(dr["Iduser"]),
                        //    PrimerNombre = dr["PrimerNombre"].ToString(),
                        //    SegundoNombre = dr["SegundoNombre"].ToString(),
                        //    PrimerApellido = dr["PrimerApellido"].ToString(),
                        //    SegundoApellido = dr["SegundoApellido"].ToString(),
                        //    NumDoc = Convert.ToInt32(dr["NumDoc"]),
                        //    Email = dr["Email"].ToString(),
                        //    Pass = dr["Pass"].ToString(),
                        //    Documento = Convert.ToInt32(dr["Documento"]),
                        //    Genero = Convert.ToInt32(dr["Genero"]),
                        //    Programa = Convert.ToInt32(dr["Programa"]),
                        //    Rol = Convert.ToInt32(dr["Rol"]),
                        //    Activo = Convert.ToBoolean(dr["Activo"])
                        //});
                    }
                }
            }

            return Json(new { data = lista });
        }
    }
}
