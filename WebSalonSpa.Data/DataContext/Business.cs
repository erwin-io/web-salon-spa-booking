namespace WebSalonSpa.Data.DataContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Business")]
    public partial class Business
    {
        public long BusinessId { get; set; }

        public int UserId { get; set; }

        [Required]
        [StringLength(250)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(250)]
        public string LastName { get; set; }

        public long BusinessCategoryId { get; set; }

        [Required]
        [StringLength(250)]
        public string BusinessEmail { get; set; }

        [Required]
        public string PrimaryPhoneNumber { get; set; }

        public string SecondPhoneNumber { get; set; }

        [Required]
        public string CompleteAddress { get; set; }

        public string Desciption { get; set; }

        public TimeSpan? OpenHourStart { get; set; }

        public TimeSpan? OpenHourEnd { get; set; }

        public bool IsVerified { get; set; }

        public bool IsPaid { get; set; }

        public bool IsSuspended { get; set; }

        public double? Rating { get; set; }

        public long? ViewCount { get; set; }

        public long? BannerImageFile { get; set; }

        public long EntityStatusId { get; set; }

        public virtual BusinessCategory BusinessCategory { get; set; }

        public virtual User User { get; set; }
    }
}
