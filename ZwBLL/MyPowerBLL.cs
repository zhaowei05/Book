using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwDAL;
using ZwEntity;
namespace ZwBLL
{
   public  class MyPowerBLL
    {
        #region 列表
        public List<ZwEntity.MyPowerEntity> list(string str)
        {
            MyPowerDAL dal = new MyPowerDAL();
            return dal.list(str);
        }

        #endregion
        
    }
}
