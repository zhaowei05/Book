using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;

namespace ZwDAL
{
   public class BookTypeDAL
    {
        DBHelper db = new DBHelper();

        #region 列表
        public List<BookTypeEntity> list()
        {
            List<BookTypeEntity> list = new List<BookTypeEntity>();
            string sql = "select * from BookType";
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                BookTypeEntity entity = new BookTypeEntity();
                entity.TypeId = int.Parse(item["TypeId"].ToString());
                entity.TypeName = item["TypeName"].ToString();
                entity.ParentId = int.Parse(item["ParentId"].ToString());
                list.Add(entity);
            }
            return list;
        }
        public List<BookTypeEntity> list(int id)
        {
            List<BookTypeEntity> list = new List<BookTypeEntity>();
            string sql = "select * from BookType where ParentId="+id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                BookTypeEntity entity = new BookTypeEntity();
                entity.TypeId = int.Parse(item["TypeId"].ToString());
                entity.TypeName = item["TypeName"].ToString();
                entity.ParentId = int.Parse(item["ParentId"].ToString());
                list.Add(entity);
            }
            return list;
        }
        #endregion

        #region 详情
        public BookTypeEntity lists(int id)
        {
            string sql = "select * from BookType where TypeId=" + id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count == 0)
                return null;
            BookTypeEntity entity = new BookTypeEntity();
            entity.TypeId = int.Parse(dt.Rows[0]["TypeId"].ToString());
            entity.TypeName = dt.Rows[0]["TypeName"].ToString();
            entity.ParentId = int.Parse(dt.Rows[0]["ParentId"].ToString());

            return entity;
        }
        #endregion

        #region 添加
        public int Add(BookTypeEntity entity)
        {
            string sql = @"insert into BookType(TypeName,ParentId)
values(@TypeName,@ParentId)";
            db.PrepareSql(sql);
            db.SetParameter("TypeName", entity.TypeName);
            db.SetParameter("ParentId", entity.ParentId);
            return db.ExecNonQuery();
        }
        #endregion

        #region 删除
        public int Delete(int id)
        {
            string sql = "delete from BookType  where TypeId=" + id;
            db.PrepareSql(sql);
            return db.ExecNonQuery();
        }
        #endregion

        #region 修改
        public int Update(BookTypeEntity entity)
        {
            string sql = "Update BookType set TypeName=@TypeName,ParentId=@ParentId where TypeId=@TypeId";
            db.PrepareSql(sql);
            db.SetParameter("TypeName", entity.TypeName);
            db.SetParameter("ParentId", entity.ParentId);
            db.SetParameter("TypeId", entity.TypeId);
            return db.ExecNonQuery();
        }
        #endregion
    }
}
