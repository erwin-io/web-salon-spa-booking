using AutoMapper;
using WebSalonSpa.Data.Models;
using WebSalonSpa.Domain.BindingModel;
using WebSalonSpa.Domain.ViewModel;
using System.Collections.Generic;
using WebSalonSpa.Data.DataContext;

namespace WebSalonSpa.Mapping.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            this.IgnoreUnmapped();
            CreateMap<ApplicationUser, UserViewModel>();
        }
    }
}
