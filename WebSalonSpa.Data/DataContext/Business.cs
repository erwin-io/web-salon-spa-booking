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
        public string BusinessName { get; set; }

        public long BusinessCategoryId { get; set; }

        [Required]
        [StringLength(250)]
        public string BusinessEmail { get; set; }

        [Required]
        public string PrimaryPhoneNumber { get; set; }

        public string SecondPhoneNumber { get; set; }

        [Required]
        public string CompleteAddress { get; set; }

        public long CityId { get; set; }

        public string Desciption { get; set; }

        [StringLength(10)]
        public string TimeOpen { get; set; }

        [StringLength(10)]
        public string TimeClose { get; set; }

        public bool IsVerified { get; set; }

        public bool IsPaid { get; set; }

        public bool IsSuspended { get; set; }

        public double? Rating { get; set; }

        public long? ViewCount { get; set; }

        public long? BannerImageFile { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DatePermitExpired { get; set; }

        public long EntityStatusId { get; set; }

        public virtual BusinessCategory BusinessCategory { get; set; }

        public virtual City City { get; set; }

        public virtual User User { get; set; }
    }
}
