using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
    public class OrderDetailEntity
    {
        public int OrderDetailId { get; set; }//--主键编号
        public int OrderId { get; set; }//--订单编号
        public int BookId { get; set; }//--图书编号
        public decimal BookSalePrice { get; set; }//--图书销售价格
        public int BookSaleCount { get; set; }//--单本图书销售数量

        public MyOrderEntity MyOrder { get; set; }//--订单
        public BookInfoEntity BookInfo { get; set; }//--图书
    }
}
