namespace WebSalonSpa.Data.DataContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BusinessView")]
    public partial class BusinessView
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long BusinessId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(250)]
        public string BusinessName { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(250)]
        public string BusinessEmail { get; set; }

        [Key]
        [Column(Order = 3)]
        public string PrimaryPhoneNumber { get; set; }

        public string SecondPhoneNumber { get; set; }

        [Key]
        [Column(Order = 4)]
        public string CompleteAddress { get; set; }

        public string Desciption { get; set; }

        [StringLength(10)]
        public string TimeOpen { get; set; }

        [StringLength(10)]
        public string TimeClose { get; set; }

        [Key]
        [Column(Order = 5)]
        public bool IsVerified { get; set; }

        [Key]
        [Column(Order = 6)]
        public bool IsPaid { get; set; }

        [Key]
        [Column(Order = 7)]
        public bool IsSuspended { get; set; }

        public double? Rating { get; set; }

        public long? ViewCount { get; set; }

        public long? BannerImageFile { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DatePermitExpired { get; set; }

        [Key]
        [Column(Order = 8)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long EntityStatusId { get; set; }

        public long? BusinessCategoryId { get; set; }

        [StringLength(250)]
        public string BusinessCategoryName { get; set; }

        public long? CityId { get; set; }

        public string Name { get; set; }

        public int? UserId { get; set; }

        [StringLength(256)]
        public string UserName { get; set; }

        public long? UserTypeId { get; set; }

        [StringLength(100)]
        public string UserTypeName { get; set; }

        public long? FileId { get; set; }

        [StringLength(250)]
        public string FileName { get; set; }

        [StringLength(100)]
        public string MimeType { get; set; }

        public long? FileSize { get; set; }

        public byte[] FileContent { get; set; }

        public bool? IsFromStorage { get; set; }
    }
}
