namespace WebSalonSpa.Data.DataContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserType")]
    public partial class UserType
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long UserTypeId { get; set; }

        [Required]
        [StringLength(100)]
        public string UserTypeName { get; set; }
    }
}
