using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using SGPI.Models;
using System.Data;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore.SqlServer.Query.Internal;


namespace SGPI.Controllers
{
    public class AdministradorController : Controller
    {
        //OBJETO QUE SE CONECTA CON LOS MODELOS DE LA BASE DE DATOS
        private readonly SgpiContext _context;
        SgpiContext dbcontext = new SgpiContext();

        //TRAE LA CADENA DE CONEXION A LA BASE DE DATOS
        private readonly string CadenaSQL;

        //CONTROLADOR
        public AdministradorController(SgpiContext context, IConfiguration config)
        {  
            _context = context;

            CadenaSQL = config.GetConnectionString("cadenaSQL");
        }

        //METODO QUE TRAE LOS DATOS PARA LOS DropDownList/SELECT
        public IActionResult Admin()
        {
            ViewBag.Genero = dbcontext.Generos.ToList();
            ViewBag.Rol = dbcontext.Rols.ToList();
            ViewBag.Doc = dbcontext.Documentos.ToList();
            ViewBag.Prog = dbcontext.Programas.ToList();

            return View();
        }

        //METODO PARA AGREGAR AL USUARIO
        [HttpPost]
        public IActionResult AgregarUsuario(Usuario usuario)
        {
            DateTime fecha = DateTime.Now;
            long Fecha = long.Parse(fecha.ToString("yyyyMMddHHmmss")); // Esto contendrá año, mes, día, hora, minutos y segundos

            //SE VERIFICIA SE ESTAN TOMANDO LOS VALORES CORRECTAMENTE
            if (Fecha == 0)
            {
                return NotFound(); // Devolver un error si no se encuentra el usuario
            }
            else
            {
                //ID DEL USUARIO TOMA EL VALOR DE FECHA Y HORA
                usuario.Iduser = Fecha;

                //SE GUARDA LA LISTA ENVIADA POR EL FORMULARIO MEDIANTE POST CON LOS DATOS
                _context.Add(usuario);
                _context.SaveChanges();
            }

            //CARGA NUEVAMENTE EL METODO ADMIN QUE CONTIENE LAS LISTAS QUE TRAEN LOS DATOS DE LAS TABLAS REQUERIAS EN LOS DropDownList
            return RedirectToAction("Admin");
        }

        //METODO DE ELIMINACION DE USUARIO
        [HttpPost]
        public IActionResult EliminarUsuario(long id)
        {
            // Buscar el usuario por su ID
            var usuario = _context.Usuarios.Find(id);

            if (usuario == null)
            {
                return NotFound(); // Devolver un error si no se encuentra el usuario
            }
            else
            {
                // Eliminar el usuario de la base de datos
                _context.Usuarios.Remove(usuario);
                _context.SaveChanges();
            }

            return RedirectToAction("Admin"); // Redirigir a la página de administración después de la eliminación
        }

        //METODO QUE VA OBTENER AL USUARIO PARA MODIFICACION
        [HttpGet]
        public JsonResult ObtenerUsuario(long id)
        {
            // Buscar el usuario por su ID
            var usuario = _context.Usuarios.Find(id);
            return Json(usuario);
        }

        //METOOD QUE MODIFICARA AL USUARIO
        [HttpPost]
        public IActionResult EditarUsuario(Usuario usuario)
        {
            if (usuario.Iduser == 0)
            {
                // Indicar que la edición no se realizó
                TempData["EdicionExitosa"] = false;
                return NotFound();
            }
            else
            {
                _context.Update(usuario);
                _context.SaveChanges();
                // Indicar que la edición se realizó con éxito
                TempData["EdicionExitosa"] = true;
            }

            // Cargar nuevamente los datos de la tabla después de la edición
            return RedirectToAction("Admin");
        }


        //METODO QUE TRAE LOS DATOS NECESARIO PARA MOSTRAR EN LA TABLA
        [HttpGet]
        public JsonResult ListaUsuarios()
        {
            List<TablaAdmistrador> lista = new List<TablaAdmistrador>();

            using (var conexion = new SqlConnection(CadenaSQL))
            {
                conexion.Open();
                var cmd = new SqlCommand("sp_ObtenerUsuariosCompletos", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new TablaAdmistrador
                        {
                            Iduser = (long)dr["Iduser"],
                            PrimerNombre = dr["PrimerNombre"].ToString(),
                            SegundoNombre = dr["SegundoNombre"].ToString(),
                            PrimerApellido = dr["PrimerApellido"].ToString(),
                            SegundoApellido = dr["SegundoApellido"].ToString(),
                            NumDoc = Convert.ToInt32(dr["NumDoc"]),
                            Email = dr["Email"].ToString(),
                            Pass = dr["Pass"].ToString(),
                            Documento = dr["Documento"].ToString(),
                            Genero = dr["Genero"].ToString(),
                            Programa = dr["Programa"].ToString(),
                            Rol = dr["Rol"].ToString(),
                            Activo = Convert.ToBoolean(dr["Activo"])
                        });
                    }
                }
            }

            return Json(new { data = lista });
        }
    }
}
