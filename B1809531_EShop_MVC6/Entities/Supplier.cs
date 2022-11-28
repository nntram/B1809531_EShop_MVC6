using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("SUPPLIER")]
    public partial class Supplier
    {
        public Supplier()
        {
            Warehousereceipts = new HashSet<Warehousereceipt>();
        }

        [Key]
        [Column("SUPPLIERID")]
        [StringLength(64)]
        public string Supplierid { get; set; } = null!;
        [Column("SUPPLIERNAME")]
        [StringLength(256)]
        public string? Suppliername { get; set; }
        [Column("SUPPLIEREMAIL")]
        [StringLength(256)]
        public string? Supplieremail { get; set; }
        [Column("SUPPLIERPHONENUMBER")]
        [StringLength(16)]
        [Unicode(false)]
        public string? Supplierphonenumber { get; set; }
        [Column("SUPPLIERADDRESS")]
        [StringLength(256)]
        public string? Supplieraddress { get; set; }
        [Column("SUPPLIERCREACTEDDATE")]
        public long? Suppliercreacteddate { get; set; }

        [InverseProperty("Supplier")]
        public virtual ICollection<Warehousereceipt> Warehousereceipts { get; set; }
    }
}
