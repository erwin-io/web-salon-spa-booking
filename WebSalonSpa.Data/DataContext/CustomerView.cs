namespace WebSalonSpa.Data.DataContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CustomerView")]
    public partial class CustomerView
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long CustomerId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(250)]
        public string FirstName { get; set; }

        [StringLength(250)]
        public string MiddleName { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(250)]
        public string LastName { get; set; }

        [Key]
        [Column(Order = 3)]
        public DateTime BirthDate { get; set; }

        public long? Age { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(250)]
        public string Email { get; set; }

        [Key]
        [Column(Order = 5)]
        public string PhoneNumber { get; set; }

        [Key]
        [Column(Order = 6)]
        public string CompleteAddress { get; set; }

        public int? UserId { get; set; }

        [StringLength(256)]
        public string UserName { get; set; }

        public long? GenderId { get; set; }

        [StringLength(100)]
        public string GenderName { get; set; }

        public long? UserTypeId { get; set; }

        [StringLength(100)]
        public string UserTypeName { get; set; }
    }
}
