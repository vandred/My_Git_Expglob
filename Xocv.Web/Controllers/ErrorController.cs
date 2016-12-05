using System.Web.Mvc;
using Abp.Auditing;

namespace Xocv.Web.Controllers
{
    public class ErrorController : XocvControllerBase
    {
        [DisableAuditing]
        public ActionResult E404()
        {
            return View();
        }
    }
}