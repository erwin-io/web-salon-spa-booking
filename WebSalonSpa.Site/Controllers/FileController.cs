using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSalonSpa.Domain.ViewModel;
using WebSalonSpa.Models;
using WebSalonSpa.Site.Helpers;

namespace WebSalonSpa.Site.Controllers
{
    public class FileController : Controller
    {
        public ActionResult GetDefaultUserProfilePic()
        {
            var path = Server.MapPath(GlobalVariables.goDefaultUserProfilePicPath);
            return base.File(path, "image/jpeg");
        }

    }
}