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
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserId { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(250)]
        public string BusinessName { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long BusinessCategoryId { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(250)]
        public string BusinessEmail { get; set; }

        [Key]
        [Column(Order = 5)]
        public string PrimaryPhoneNumber { get; set; }

        public string SecondPhoneNumber { get; set; }

        [Key]
        [Column(Order = 6)]
        public string CompleteAddress { get; set; }

        [Key]
        [Column(Order = 7)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long CityId { get; set; }

        public string Desciption { get; set; }

        [StringLength(10)]
        public string TimeOpen { get; set; }

        [StringLength(10)]
        public string TimeClose { get; set; }

        [Key]
        [Column(Order = 8)]
        public bool IsVerified { get; set; }

        [Key]
        [Column(Order = 9)]
        public bool IsPaid { get; set; }

        [Key]
        [Column(Order = 10)]
        public bool IsSuspended { get; set; }

        public double? Rating { get; set; }

        public long? ViewCount { get; set; }

        public long? BannerImageFile { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DatePermitExpired { get; set; }

        [Key]
        [Column(Order = 11)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long EntityStatusId { get; set; }

        public long? Expr1 { get; set; }

        [StringLength(250)]
        public string BusinessCategoryName { get; set; }

        public long? Expr2 { get; set; }

        public string Name { get; set; }
    }
}
