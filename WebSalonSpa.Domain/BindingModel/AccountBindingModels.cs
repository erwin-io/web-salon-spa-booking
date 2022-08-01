using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using WebSalonSpa.Domain.ViewModel;

namespace WebSalonSpa.Domain.BindingModel
{

    public class ExternalLoginListBindingModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeBindingModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeBindingModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotBindingModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginBindingModel
    {
        [Required]
        [Display(Name = "Email", Prompt = "Email")]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password", Prompt = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterUserBindingModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
        [Required]
        [Display(Name = "CompleteAddress")]
        public string CompleteAddress { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class RegisterCustomerBindingModel : RegisterUserBindingModel
    {

        [Required]
        [Display(Name = "Firstname")]
        public string FirstName { get; set; }
        [Required]
        [Display(Name = "Lastname")]
        public string LastName { get; set; }

        [Display(Name = "Middlename")]
        public string MiddleName { get; set; }

        [Required]
        [Display(Name = "PhoneNumber")]
        public string PhoneNumber { get; set; }

        [Required]
        [Display(Name = "GenderId")]
        public long GenderId { get; set; }

        [Required]
        [Display(Name = "BirthDate")]
        public DateTime BirthDate { get; set; }
    }

    public class RegisterBusinessBindingModel : RegisterUserBindingModel
    {
        [Required]
        [Display(Name = "Business name")]
        public string BusinessName { get; set; }

        [Required]
        [Display(Name = "Business category")]
        public long BusinessCategoryId { get; set; }
        [Required]
        [Display(Name = "Primary phone number")]
        public string PrimaryPhoneNumber { get; set; }

        [Display(Name = "Second phone number")]
        public string SecondPhoneNumber { get; set; }

        [Display(Name = "City")]
        public long CityId { get; set; }

        [Display(Name = "Desciption")]
        public string Desciption { get; set; }

        [Display(Name = "Time open")]
        public string TimeOpen { get; set; }

        [Display(Name = "Time close")]
        public string TimeClose { get; set; }
    }

    public class ResetPasswordBindingModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordBindingModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
    //public class SelectListItem
    //{
    //    public SelectListItem() { }
    //    public bool Disabled { get; set; }
    //    public SelectListGroup Group { get; set; }
    //    public bool Selected { get; set; }
    //    public string Text { get; set; }
    //    public string Value { get; set; }
    //}

    //public class SelectListGroup
    //{
    //    public SelectListGroup() { }
    //    public bool Disabled { get; set; }
    //    public string Name { get; set; }
    //}
}
