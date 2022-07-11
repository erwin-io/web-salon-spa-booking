using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSalonSpa.Site.Models;

namespace WebSalonSpa.Site.Helpers
{
    public static class GlobalVariables
    {
        public static string goDefaultUploadRootDirectory { get; set; }
        public static string goDefaultUserProfilePicPath { get; set; }
        //Email Service
        public static string goEmailVerificationTempPath { get; set; }
        public static string goChangePasswordTempPath { get; set; }
        public static string goForgotPasswordTempPath { get; set; }
        public static string goEmailTempProfilePath { get; set; }
        public static string goSiteSupportEmail { get; set; }
        public static string goSiteSupportEmailPassword { get; set; }
        //End Email Service 
        public static string GetApplicationConfig(string pConfigurationkey)
        {
            return ConfigurationManager.AppSettings[pConfigurationkey].ToString();
        }
    }

    public static class GlobalActionExcecutingContext
    {
        public static ActionExecutingContext ActionExecutingContext { get; set; }
    }
}