using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace B1809531_EShop_MVC6.Entities
{
    [Table("VOUCHER")]
    public partial class Voucher
    {
        public Voucher()
        {
            Orders = new HashSet<Order>();
        }

        [Key]
        [Column("VOUCHERID")]
        [StringLength(64)]
        public string Voucherid { get; set; } = null!;
        [Column("VOUCHERSTARTDATE")]
        public long? Voucherstartdate { get; set; }
        [Column("VOUCHERENDDATE")]
        public long? Voucherenddate { get; set; }
        [Column("VOUCHERMAXDISCOUNT")]
        public int? Vouchermaxdiscount { get; set; }
        [Column("VOUCHERMINORDERVALUE")]
        public int? Voucherminordervalue { get; set; }
        [Column("VOUCHERDESCRIPTION")]
        [StringLength(256)]
        public string? Voucherdescription { get; set; }
        [Column("VOUCHERCREATEDDATE")]
        public long? Vouchercreateddate { get; set; }
        [Column("VOUCHERAVAILABLE")]
        public int? Voucheravailable { get; set; }
        [Column("VOUCHERINACTIVE")]
        public bool? Voucherinactive { get; set; }

        [InverseProperty(nameof(Order.Voucher))]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
