using AutoMapper;
using WebSalonSpa.Data.Models;
using WebSalonSpa.Domain.BindingModel;
using WebSalonSpa.Domain.ViewModel;
using System.Collections.Generic;
using WebSalonSpa.Data.DataContext;
using WebSalonSpa.Data.Views;

namespace WebSalonSpa.Mapping.Profiles
{
    public class BusinessProfile : Profile
    {
        public BusinessProfile()
        {
            this.IgnoreUnmapped();
            CreateMap<Business, BusinessViewModel>()
                .ForPath(dest => dest.User, opt => opt.MapFrom(src =>
                    new UserViewModel()));
            CreateMap<BusinessView, BusinessViewModel>();
        }
    }
}
