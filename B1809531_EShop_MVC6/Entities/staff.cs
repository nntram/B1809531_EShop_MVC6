using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("STAFF")]
    [Index(nameof(Warehousereceiptid), Name = "STAFF_WAREHOUSERECEIPT_FK")]
    public partial class staff
    {
        public staff()
        {
            Invoices = new HashSet<Invoice>();
            StaffRoles = new HashSet<StaffRole>();
        }

        [Key]
        [Column("STAFFID")]
        [StringLength(64)]
        public string Staffid { get; set; } = null!;
        [Column("WAREHOUSERECEIPTID")]
        [StringLength(64)]
        public string? Warehousereceiptid { get; set; }
        [Column("STAFFNAME")]
        [StringLength(256)]
        public string? Staffname { get; set; }
        [Column("STAFFGENDER")]
        public int? Staffgender { get; set; }
        [Column("STAFFPHONENUMBER")]
        [StringLength(16)]
        public string? Staffphonenumber { get; set; }
        [Column("STAFFEMAIL")]
        [StringLength(256)]
        public string? Staffemail { get; set; }
        [Column("STAFFCREAREDDATE")]
        public long? Staffcreareddate { get; set; }
        [Column("STAFFUSERNAME")]
        [StringLength(256)]
        public string? Staffusername { get; set; }
        [Column("STAFFPASSWORD")]
        [StringLength(256)]
        public string? Staffpassword { get; set; }
        [Column("STAFFIDENTIFICATION")]
        [StringLength(16)]
        public string? Staffidentification { get; set; }

        [ForeignKey(nameof(Warehousereceiptid))]
        [InverseProperty("staff")]
        public virtual Warehousereceipt? Warehousereceipt { get; set; }
        [InverseProperty(nameof(Invoice.Staff))]
        public virtual ICollection<Invoice> Invoices { get; set; }
        [InverseProperty(nameof(StaffRole.Staff))]
        public virtual ICollection<StaffRole> StaffRoles { get; set; }
    }
}
