using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Domain.BindingModel;

namespace WebSalonSpa.Domain.ViewModel
{
    public class CustomerViewModel
    {
        public long CustomerId { get; set; }
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public long GenderId { get; set; }
        public DateTime BirthDate { get; set; }
        public long? Age { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string CompleteAddress { get; set; }
        public long EntityStatusId { get; set; }
        public EntityGenderViewModel EntityGender { get; set; }
    }
}
