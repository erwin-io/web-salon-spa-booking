using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using WebSalonSpa.Domain.ViewModel;
using WebSalonSpa.Helpers;
using WebSalonSpa.Site.Controllers.Core;

namespace WebSalonSpa.Site.Controllers
{
    [Authorize]
    public class HomeController : BaseController
    {
        public async Task<ActionResult> Index()
        {
            await base.GetLookup($"{LookupNames.LOOKUP_BUSINESS_CATEGORY},{LookupNames.LOOKUP_CITY}");
            var model = new SearchBusinessViewModel();
            return View(model);
        }
        public async Task<ActionResult> Search(SearchBusinessViewModel model)
        {
            await base.GetLookup($"{LookupNames.LOOKUP_BUSINESS_CATEGORY},{LookupNames.LOOKUP_CITY}");
            return View("~/Views/Home/Index.cshtml", model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}