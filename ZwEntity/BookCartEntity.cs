using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
   public class BookCartEntity
    {
        public int CartId { get; set; }//--自动编号
       public int MemberId { get; set; }//--会员编号
       public int BookId { get; set; }//--图书编号
       public int BookCount { get; set; }//--图书数量
       public int IsSelect { get; set; }//--是否选中（1-选中，0-未选中）

       public MemberEntity Member { get; set; }//--会员
       public BookInfoEntity BookInfo { get; set; }//--图书
    }
}
