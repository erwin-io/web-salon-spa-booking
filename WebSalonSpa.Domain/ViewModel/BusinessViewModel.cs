using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Domain.BindingModel;

namespace WebSalonSpa.Domain.ViewModel
{
    public class BusinessViewModel
    {
        public long BusinessId { get; set; }

        public int UserId { get; set; }
        public string BusinessName { get; set; }

        public long BusinessCategoryId { get; set; }
        public string BusinessEmail { get; set; }
        public string PrimaryPhoneNumber { get; set; }

        public string SecondPhoneNumber { get; set; }
        public string CompleteAddress { get; set; }

        public long CityId { get; set; }

        public string Desciption { get; set; }

        public string TimeOpen { get; set; }

        public string TimeClose { get; set; }

        public bool IsVerified { get; set; }

        public bool IsPaid { get; set; }

        public bool IsSuspended { get; set; }

        public double? Rating { get; set; }

        public long? ViewCount { get; set; }

        public long? BannerImageFile { get; set; }
        public DateTime? DatePermitExpired { get; set; }

        public long EntityStatusId { get; set; }
        public virtual UserViewModel User { get; set; }
        public virtual BusinessCategoryViewModel BusinessCategory { get; set; }

        public virtual CityViewModel City { get; set; }
    }
}
