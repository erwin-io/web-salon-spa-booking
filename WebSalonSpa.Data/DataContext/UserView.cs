namespace WebSalonSpa.Data.DataContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserView")]
    public partial class UserView
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(256)]
        public string UserName { get; set; }

        [StringLength(256)]
        public string Email { get; set; }

        [Key]
        [Column(Order = 2)]
        public bool EmailConfirmed { get; set; }

        public string PhoneNumber { get; set; }

        [Key]
        [Column(Order = 3)]
        public bool PhoneNumberConfirmed { get; set; }

        [Key]
        [Column(Order = 4, TypeName = "date")]
        public DateTime DateCreated { get; set; }

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

        public long? EntityStatusId { get; set; }
    }
}
