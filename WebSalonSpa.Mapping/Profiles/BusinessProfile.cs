using AutoMapper;
using WebSalonSpa.Data.Models;
using WebSalonSpa.Domain.BindingModel;
using WebSalonSpa.Domain.ViewModel;
using System.Collections.Generic;
using WebSalonSpa.Data.DataContext;
using System;

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
            CreateMap<BusinessView, BusinessViewModel>()
                .ForPath(dest => dest.User, opt => opt.MapFrom(src =>
                    new UserViewModel()
                    {
                        UserId = Convert.ToInt32(src.UserTypeId),
                        UserName = src.UserName,
                        UserType = new UserTypeViewModel() { UserTypeId = Convert.ToInt32(src.UserTypeId), UserTypeName = src.UserTypeName }
                    }))
                .ForPath(dest => dest.BusinessCategory, opt => opt.MapFrom(src =>
                    new BusinessCategory()
                    {
                        BusinessCategoryId = Convert.ToInt32(src.BusinessCategoryId),
                        BusinessCategoryName = src.BusinessCategoryName,
                    }))
                .ForPath(dest => dest.City, opt => opt.MapFrom(src =>
                    new City()
                    {
                        CityId = Convert.ToInt32(src.CityId),
                        Name = src.Name,
                    }));
        }
    }
}
