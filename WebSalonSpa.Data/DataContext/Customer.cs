namespace WebSalonSpa.Data.DataContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Customer")]
    public partial class Customer
    {
        public long CustomerId { get; set; }

        public int UserId { get; set; }

        [Required]
        [StringLength(250)]
        public string FirstName { get; set; }

        [StringLength(250)]
        public string MiddleName { get; set; }

        [Required]
        [StringLength(250)]
        public string LastName { get; set; }

        public long GenderId { get; set; }

        public DateTime BirthDate { get; set; }

        public long? Age { get; set; }

        [Required]
        [StringLength(250)]
        public string Email { get; set; }

        [Required]
        public string PhoneNumber { get; set; }

        [Required]
        public string CompleteAddress { get; set; }

        public long EntityStatusId { get; set; }

        public virtual EntityGender EntityGender { get; set; }

        public virtual EntityStatu EntityStatu { get; set; }

        public virtual User User { get; set; }
    }
}
