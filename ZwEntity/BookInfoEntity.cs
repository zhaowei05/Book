using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
    public class BookInfoEntity
    {
        public int BookId { get; set; }//--编号
        public int TypeId { get; set; }//--类型编号
        public string BookCode { get; set; }//--条形码
        public string BookName { get; set; }//--书名
        public decimal BookPrice { get; set; }//--价格
        public decimal BookDisCount { get; set; }//--折扣
        public string BookAuthor { get; set; }//--作者
        public string BookPress { get; set; }//--出版社
        public DateTime PressTime { get; set; }//--出版时间
        public string PicPath { get; set; }//--图片路径
        public int SellCount { get; set; }//--销售数量
        public string BookRemark { get; set; }//--图书介绍

        public  BookTypeEntity BookType { get; set; }//类型
    }
}
