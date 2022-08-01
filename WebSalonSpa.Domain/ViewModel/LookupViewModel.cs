using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Domain.BindingModel;

namespace WebSalonSpa.Domain.ViewModel
{
    public class LookupViewModel
    {
        public IList<EntityGenderViewModel> EntityGenders { get; set; } = new List<EntityGenderViewModel>();
        public IList<BusinessCategoryViewModel> BusinessCategories { get; set; } = new List<BusinessCategoryViewModel>();
        public IList<CityViewModel> Cities { get; set; } = new List<CityViewModel>();
    }
}
