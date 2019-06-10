using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;

namespace ZwDAL
{
    public class MyPowerDAL
    {
        DBHelper db = new DBHelper();
        #region 列表
        public List<ZwEntity.MyPowerEntity> list(string str)
        {
            string sqlwhere = "";
            if (str != null && !str.Equals(""))
                sqlwhere += " and PowerId like'"+str+"'";
            List<ZwEntity.MyPowerEntity> list = new List<ZwEntity.MyPowerEntity>();
            string sql = "select * from MyPower where 1=1 "+ sqlwhere;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                ZwEntity.MyPowerEntity entity = new MyPowerEntity();
                entity.PowerId = item["PowerId"].ToString();
                entity.MotherId = item["MotherId"].ToString();
                entity.PowerName = item["PowerName"].ToString();
                entity.MenuName = item["MenuName"].ToString();
                entity.PowerPage = item["PowerPage"].ToString();
                list.Add(entity);
            }
            return list;
        }
        #endregion
    }
}
