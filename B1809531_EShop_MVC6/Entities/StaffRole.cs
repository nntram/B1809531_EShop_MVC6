using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("STAFF_ROLE")]
    [Index("Roleid", Name = "STAFF_ROLE2_FK")]
    [Index("Staffid", Name = "STAFF_ROLE_FK")]
    public partial class StaffRole
    {
        [Key]
        [Column("STAFFID")]
        [StringLength(64)]
        public string Staffid { get; set; } = null!;
        [Key]
        [Column("ROLEID")]
        [StringLength(64)]
        public string Roleid { get; set; } = null!;
        [Column("STAFFROLEID")]
        [StringLength(64)]
        public string? Staffroleid { get; set; }

        [ForeignKey("Roleid")]
        [InverseProperty("StaffRoles")]
        public virtual Role Role { get; set; } = null!;
        [ForeignKey("Staffid")]
        [InverseProperty("StaffRoles")]
        public virtual staff Staff { get; set; } = null!;
    }
}
