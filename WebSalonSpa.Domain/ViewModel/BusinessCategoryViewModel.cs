using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Domain.BindingModel;

namespace WebSalonSpa.Domain.ViewModel
{
    public class BusinessCategoryViewModel
    {
        public long BusinessCategoryId { get; set; }
        public string BusinessCategoryName { get; set; }
    }
}
