using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace Demo
{
    public class MyJson
    {
        #region 将对象转换为Json(支持实体、集合)
        public static string ToJsJson(object item)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string output = serializer.Serialize(item);
            return output;
        }
        #endregion

        #region 将Json字符串转换为实体或集合
        public static T FromJsonTo<T>(string jsonString)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            T jsonObject = serializer.Deserialize<T>(jsonString);
            return jsonObject;
        }
        #endregion

        #region 将DataTable转换成Json字符串
        public static string DataTableToJson(DataTable dt)
        {
            StringBuilder jsonBuilder = new StringBuilder();
            //jsonBuilder.Append("{\"");
            //jsonBuilder.Append(dt.TableName.ToString());
            //jsonBuilder.Append("\":[");

            jsonBuilder.Append("[");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                jsonBuilder.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    jsonBuilder.Append("\"");
                    jsonBuilder.Append(dt.Columns[j].ColumnName);
                    jsonBuilder.Append("\":\"");
                    jsonBuilder.Append(dt.Rows[i][j].ToString());
                    jsonBuilder.Append("\",");
                }
                jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
                jsonBuilder.Append("},");
            }
            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            jsonBuilder.Append("]");

            //jsonBuilder.Append("]");
            //jsonBuilder.Append("}");
            return jsonBuilder.ToString();
        }
        #endregion

        #region 将DataRow转换成Json数据
        public static string DataRowToJson(DataTable dt)
        {
            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.Append("{");
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                jsonBuilder.Append("\"");
                jsonBuilder.Append(dt.Columns[j].ColumnName);
                jsonBuilder.Append("\":\"");
                jsonBuilder.Append(dt.Rows[0][j].ToString());
                jsonBuilder.Append("\",");
            }
            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            jsonBuilder.Append("},");
            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            return jsonBuilder.ToString();
        }
        #endregion
    }
}