using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using ZwDAL;
using ZwEntity;

namespace ZwDAL
{
    public class TolistDataFun
    {
        public static List<T> Tolist<T>(object obj) where T : new()
        {
            DataTable dt = (DataTable)obj;
            List<T> list = new List<T>();
            Type type = typeof(T);
            string Tampname = string.Empty;
            foreach (DataRow item in dt.Rows)
            {
                T t = new T();
                PropertyInfo[] propertys = t.GetType().GetProperties();
                foreach (PropertyInfo info in propertys)
                {
                    Tampname = info.Name;
                    if (dt.Columns.Contains(Tampname))
                    {
                        if (!info.CanWrite) continue;

                        object value = item[Tampname];
                        if (value != DBNull.Value)
                        {
                            if (info.GetMethod.ReturnParameter.ParameterType.Name == "Int32")
                                value = Convert.ToInt32(value);
                        }
                        info.SetValue(t, value, null);
                    }
                }

                list.Add(t);
            }
            return list;
        }

        public static DBHelper db;
    }

    public static class class1
    {
        
        public static List<MyPowerEntity> listMyPower(this MyPowerDAL myPowerDAL)
        {
            TolistDataFun.db = new DBHelper();
            List<MyPowerEntity> list = new List<MyPowerEntity>();
            string sql = "select * from MyPower where 1=1 ";
            TolistDataFun.db.PrepareSql(sql);
            list= TolistDataFun.Tolist<MyPowerEntity> (TolistDataFun.db.ExecQuery());
            return list;
        }
    }
}
