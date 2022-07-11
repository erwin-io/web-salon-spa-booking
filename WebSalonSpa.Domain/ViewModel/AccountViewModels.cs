using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace WebSalonSpa.Domain.ViewModel
{
    public class AccountViewModel
    {
        public UserViewModel User { get; set; }
        public CustomerViewModel Customer { get; set; }
    }
    public class ExternalLoginConfirmationViewModel
    {
        public string Email { get; set; }
    }
    public class VerifyCodeViewModel
    {
        public string Provider { get; set; }
        public string Code { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberBrowser { get; set; }
        public bool RememberMe { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }
}
