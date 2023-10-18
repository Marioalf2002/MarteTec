using Microsoft.AspNetCore.Mvc;
using SGPI.Models;

namespace SGPI.Controllers
{
    public class AdministradorController : Controller
    {
        private SgpiContext _context;

        public AdministradorController(SgpiContext context)
        {
            _context = context;
        }

        public IActionResult Admin()
        {
            ViewBag.genero = _context.Generos.ToList();

            return View();
        }
    }
}
