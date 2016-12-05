using System.Web.Mvc;

namespace Xocv.Web.Controllers
{
    public class HomeController : XocvControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
	}
}