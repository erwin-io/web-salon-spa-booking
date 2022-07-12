using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Domain.BindingModel;

namespace WebSalonSpa.Domain.ViewModel
{
    public class CityViewModel
    {
        public long CityId { get; set; }
        public string Name { get; set; }
    }
}
