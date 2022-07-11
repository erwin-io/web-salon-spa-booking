using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebSalonSpa.Site.Startup))]
namespace WebSalonSpa.Site
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
