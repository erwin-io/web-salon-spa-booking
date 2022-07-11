using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using WebSalonSpa.Models;

namespace WebSalonSpa.Helpers
{

    public static class GlobalFunctions
    {
        public static bool IsValidTimeFormat(this string input)
        {
            TimeSpan dummyOutput;
            return TimeSpan.TryParse(input, out dummyOutput);
        }
        public static string ConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ApplicationDbContext"].ToString();
        }

        public static string GetApplicationConfig(string pConfigurationKey)
        {
            return ConfigurationManager.AppSettings[pConfigurationKey].ToString();
        }

        public static void ResetVisitors_Online()
        {
            HttpContext.Current.Application["visitors_online"] = 0;
        }

        public static int GetVisitors_Online()
        {
            int visitorsOnline = 0;
            if (HttpContext.Current.Application["visitors_online"] != null)
            {
                int.TryParse(HttpContext.Current.Application["visitors_online"].ToString(), out visitorsOnline);
            }
            return visitorsOnline;
        }

        public static void SetVisitors_Online()
        {
            int visitorsOnline = 0;
            if (HttpContext.Current.Application["visitors_online"] != null)
            {
                int.TryParse(HttpContext.Current.Application["visitors_online"].ToString(), out visitorsOnline);
                visitorsOnline = visitorsOnline + 1;
            }
            HttpContext.Current.Session.Timeout = 720; //12 hours
            HttpContext.Current.Application.Lock();
            HttpContext.Current.Application["visitors_online"] = visitorsOnline;
            HttpContext.Current.Application.UnLock();
        }

        public static void SetVisitors_Offline()
        {
            int visitorsOnline = 0;
            if (HttpContext.Current.Application["visitors_online"] != null)
            {
                int.TryParse(HttpContext.Current.Application["visitors_online"].ToString(), out visitorsOnline);
                visitorsOnline = visitorsOnline - 1;
            }
            HttpContext.Current.Application.Lock();
            HttpContext.Current.Application["visitors_online"] = visitorsOnline;
            HttpContext.Current.Application.UnLock();
        }

    }
}