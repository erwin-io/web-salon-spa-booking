namespace WebSalonSpa.Data.DataContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("File")]
    public partial class File
    {
        public long FileId { get; set; }

        [Required]
        [StringLength(250)]
        public string FileName { get; set; }

        [Required]
        [StringLength(100)]
        public string MimeType { get; set; }

        public long FileSize { get; set; }

        public byte[] FileContent { get; set; }

        public bool? IsFromStorage { get; set; }

        [StringLength(100)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedAt { get; set; }

        [StringLength(100)]
        public string LastUpdatedBy { get; set; }

        public DateTime? LastUpdatedAt { get; set; }

        public long EntityStatusId { get; set; }
    }
}
