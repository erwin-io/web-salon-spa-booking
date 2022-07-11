namespace WebSalonSpa.Data.DataContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class EntityApprovalStatu
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long ApprovalStatusId { get; set; }

        [Required]
        [StringLength(100)]
        public string ApprovalStatusName { get; set; }
    }
}
