using AutoMapper;
using WebSalonSpa.Data.Models;
using WebSalonSpa.Domain.BindingModel;
using WebSalonSpa.Domain.ViewModel;
using System.Collections.Generic;
using WebSalonSpa.Data.DataContext;
using System;

namespace WebSalonSpa.Mapping.Profiles
{
    public class CustomerProfile : Profile
    {
        public CustomerProfile()
        {
            this.IgnoreUnmapped();
            CreateMap<Customer, CustomerViewModel>()
                .ForPath(dest => dest.User, opt => opt.MapFrom(src =>
                    new UserViewModel()));
            CreateMap<CustomerView, CustomerViewModel>()
                .ForPath(dest => dest.User, opt => opt.MapFrom(src =>
                    new UserViewModel()
                    {
                        UserId = Convert.ToInt32(src.UserTypeId),
                        UserName = src.UserName,
                        UserType = new UserTypeViewModel() { UserTypeId = src.UserTypeId.Value, UserTypeName = src.UserTypeName }
                    }))
                .ForPath(dest => dest.EntityGender, opt => opt.MapFrom(src =>
                    new EntityGenderViewModel()
                    {
                        GenderId = Convert.ToInt32(src.GenderId),
                        GenderName = src.GenderName,
                    }));
        }
    }
}
