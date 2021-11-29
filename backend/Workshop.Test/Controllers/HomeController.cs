using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Diagnostics;
using Workshop.Test.Models;

namespace Workshop.Test.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly string _authenticationUrl;
        private readonly string _adminMvcUrl;

        public HomeController(ILogger<HomeController> logger, IConfiguration config)
        {
            _logger = logger;
            _authenticationUrl = config.GetValue<string>("AuthenConfig:AuthenticationUrl");
            _adminMvcUrl = config.GetValue<string>("AuthenConfig:AdminMvcUrl");
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [Authorize]
        public IActionResult Authenticate()
        {
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Logout()
        {
            return SignOut("Cookies", "oidc");
        }
    }
}
