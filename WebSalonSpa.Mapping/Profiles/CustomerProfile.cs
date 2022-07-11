using AutoMapper;
using WebSalonSpa.Data.Models;
using WebSalonSpa.Domain.BindingModel;
using WebSalonSpa.Domain.ViewModel;
using System.Collections.Generic;
using WebSalonSpa.Data.DataContext;

namespace WebSalonSpa.Mapping.Profiles
{
    public class CustomerProfile : Profile
    {
        public CustomerProfile()
        {
            this.IgnoreUnmapped();
            CreateMap<Customer, CustomerViewModel>();
        }
    }
}
