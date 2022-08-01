using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Domain.BindingModel;

namespace WebSalonSpa.Domain.ViewModel
{
    public class SearchBusinessViewModel
    {
        public string Keyword { get; set; }
        public string BusinessCategoryId { get; set; }
        public string CityId { get; set; }
        public IList<BusinessViewModel> Result { get; set; }
    }
}
