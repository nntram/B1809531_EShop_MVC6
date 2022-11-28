using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("WAREHOUSERECEIPT")]
    [Index("Supplierid", Name = "WAREHOUSERECEIPT_SUPPLIER_FK")]
    public partial class Warehousereceipt
    {
        public Warehousereceipt()
        {
            Warehousereceiptitems = new HashSet<Warehousereceiptitem>();
            staff = new HashSet<staff>();
        }

        [Key]
        [Column("WAREHOUSERECEIPTID")]
        [StringLength(64)]
        public string Warehousereceiptid { get; set; } = null!;
        [Column("SUPPLIERID")]
        [StringLength(64)]
        public string Supplierid { get; set; } = null!;
        [Column("WAREHOUSERECEIPTCREATEDDATE")]
        public long? Warehousereceiptcreateddate { get; set; }

        [ForeignKey("Supplierid")]
        [InverseProperty("Warehousereceipts")]
        public virtual Supplier Supplier { get; set; } = null!;
        [InverseProperty("Warehousereceipt")]
        public virtual ICollection<Warehousereceiptitem> Warehousereceiptitems { get; set; }
        [InverseProperty("Warehousereceipt")]
        public virtual ICollection<staff> staff { get; set; }
    }
}
