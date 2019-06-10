using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
   public class BookTypeEntity
    {
       public int TypeId { get; set; }//--编号,非空,主键
       public string TypeName { get; set; }//--类型名称,非空	
       public int ParentId { get; set; }//--父节点编号,非空
    }
}
