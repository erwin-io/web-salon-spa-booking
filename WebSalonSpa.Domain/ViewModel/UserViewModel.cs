using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebSalonSpa.Domain.ViewModel
{
    public class UserViewModel
    {
        public int UserId { get; set; }
        public long UserTypeId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; }

        public string PhoneNumber { get; set; }

        public bool PhoneNumberConfirmed { get; set; }

        public bool TwoFactorEnabled { get; set; }

        public long ProfilePictureFile { get; set; }
    }
}
