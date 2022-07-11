using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using WebSalonSpa.Mapping;
using WebSalonSpa.Site.Helpers;

namespace WebSalonSpa.Site
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AutoMapperConfig.Configure("WebSalonSpa.Mapping");
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            InitApp();
        }

        public void InitApp()
        {
            GlobalVariables.goDefaultUserProfilePicPath = GlobalVariables.GetApplicationConfig("DefaultUserProfilePic");
            GlobalVariables.goDefaultUploadRootDirectory = GlobalVariables.GetApplicationConfig("DefaultUploadRootDirectory");

            GlobalVariables.goEmailVerificationTempPath = GlobalVariables.GetApplicationConfig("EmailVerificationTempPath");
            GlobalVariables.goChangePasswordTempPath = GlobalVariables.GetApplicationConfig("ChangePasswordTempPath");
            GlobalVariables.goForgotPasswordTempPath = GlobalVariables.GetApplicationConfig("ForgotPasswordTempPath");
            GlobalVariables.goEmailTempProfilePath = GlobalVariables.GetApplicationConfig("EmailTempProfilePath");
            GlobalVariables.goSiteSupportEmail = GlobalVariables.GetApplicationConfig("SiteSupportEmail");
            GlobalVariables.goSiteSupportEmailPassword = GlobalVariables.GetApplicationConfig("SiteSupportEmailPassword");
        }
    }
}
