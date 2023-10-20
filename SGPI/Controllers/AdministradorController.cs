using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using SGPI.Models;

namespace SGPI.Controllers
{
    public class AdministradorController : Controller
    {
        private readonly SgpiContext _context;
        SgpiContext dbcontext = new SgpiContext();

        public AdministradorController(SgpiContext context)
        {  
            _context = context;
        }

        public IActionResult Admin()
        {
            ViewBag.Genero = dbcontext.Generos.ToList();
            ViewBag.Rol = dbcontext.Rols.ToList();
            ViewBag.Doc = dbcontext.Documentos.ToList();
            ViewBag.Prog = dbcontext.Programas.ToList();

            return View();
        }
    }
}
