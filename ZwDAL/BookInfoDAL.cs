using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;
using System.Data;

namespace ZwDAL
{
    public class BookInfoDAL
    {
        DBHelper db = new DBHelper();

        #region 列表
        public List<BookInfoEntity> list()
        {
            List<BookInfoEntity> list = new List<BookInfoEntity>();
            string sql = "select * from BookInfo";
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                BookInfoEntity entity = new BookInfoEntity();
                entity.BookId = int.Parse(item["BookId"].ToString());
                entity.TypeId = int.Parse(item["TypeId"].ToString());
                entity.BookCode = item["BookCode"].ToString();
                entity.BookName = item["BookName"].ToString();
                entity.BookPrice = decimal.Parse(item["BookPrice"].ToString());
                entity.BookDisCount = decimal.Parse(item["TypeName"].ToString());
                entity.BookAuthor = item["BookAuthor"].ToString();
                entity.BookPress = item["BookPress"].ToString();
                entity.PressTime = DateTime.Parse(item["ParentId"].ToString());
                entity.PicPath = item["PicPath"].ToString();
                entity.SellCount = int.Parse(item["SellCount"].ToString());
                entity.BookRemark = item["BookRemark"].ToString();

                entity.BookType = new BookTypeEntity();
                entity.BookType.ParentId = int.Parse(item["ParentId"].ToString());
                entity.BookType.TypeName= item["TypeName"].ToString();
                list.Add(entity);
            }
            return list;
        }

        public List<BookInfoEntity> list(BookInfoEntity infoEntity,int Pageint, int Pagesize, out int Count)
        {
            string sqlwhere = "";
            if (infoEntity != null)
            {
                if (!infoEntity.TypeId.Equals("") && infoEntity.TypeId != 0)
                    sqlwhere += " and BookType.TypeId=" + infoEntity.TypeId;
                if(!infoEntity.SellCount.Equals("") && infoEntity.SellCount != 0)
                    sqlwhere += " and BookType.ParentId=" + infoEntity.SellCount;
                if (infoEntity.BookName != null && !infoEntity.BookName.Equals(""))
                {
                    sqlwhere += " and BookName like '%" + infoEntity.BookName + "%'";
                    //for (int i = 0; i < infoEntity.BookName.Split(',').Length; i++)
                    //{
                    //    sqlwhere += " and BookName like '%" + infoEntity.BookName.Split(',')[i]+ "%'";
                    //}
                }
            }
            string sql = "select count(*) from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId where 1=1 " + sqlwhere;
            db.PrepareSql(sql);
            Count = int.Parse(db.ExecScalar().ToString());
            List<BookInfoEntity> list = new List<BookInfoEntity>();
            sql = @"select *from(
select ROW_NUMBER()over(order by SellCount desc) rowid,BookInfo.*,BookType.TypeName,BookType.ParentId from BookInfo left join BookType on BookInfo.TypeId = BookType.TypeId   where 1 = 1 " + sqlwhere + " ) Tamp where rowid between @star and @end";
            db.PrepareSql(sql);
            db.SetParameter("star",(Pageint-1)* Pagesize+1);
            db.SetParameter("end", Pageint* Pagesize);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                BookInfoEntity entity = new BookInfoEntity();
                entity.BookId = int.Parse(item["BookId"].ToString());
                entity.TypeId = int.Parse(item["TypeId"].ToString());
                entity.BookCode = item["BookCode"].ToString();
                entity.BookName = item["BookName"].ToString();
                entity.BookPrice = decimal.Parse(item["BookPrice"].ToString());
                entity.BookDisCount = decimal.Parse(item["BookDisCount"].ToString());
                entity.BookAuthor = item["BookAuthor"].ToString();
                entity.BookPress = item["BookPress"].ToString();
                entity.PressTime = DateTime.Parse(item["PressTime"].ToString());
                entity.PicPath = item["PicPath"].ToString();
                entity.SellCount = int.Parse(item["SellCount"].ToString());
                entity.BookRemark = item["BookRemark"].ToString();

                entity.BookType = new BookTypeEntity();
                entity.BookType.ParentId = int.Parse(item["ParentId"].ToString());
                entity.BookType.TypeName = item["TypeName"].ToString();
                list.Add(entity);
            }
            return list;
        }
        #endregion

        #region 详情
        public BookInfoEntity list(int id)
        {
            string sql = "select BookInfo.*,BookType.TypeName,BookType.ParentId from BookInfo left join BookType on BookInfo.TypeId = BookType.TypeId  where BookId=" + id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count == 0)
                return null;
            BookInfoEntity entity = new BookInfoEntity();
            entity.BookId = int.Parse(dt.Rows[0]["BookId"].ToString());
            entity.TypeId = int.Parse(dt.Rows[0]["TypeId"].ToString());
            entity.BookCode = dt.Rows[0]["BookCode"].ToString();
            entity.BookName = dt.Rows[0]["BookName"].ToString();
            entity.BookPrice = decimal.Parse(dt.Rows[0]["BookPrice"].ToString());
            entity.BookDisCount = decimal.Parse(dt.Rows[0]["BookDisCount"].ToString());
            entity.BookAuthor = dt.Rows[0]["BookAuthor"].ToString();
            entity.BookPress = dt.Rows[0]["BookPress"].ToString();
            entity.PressTime = DateTime.Parse(dt.Rows[0]["PressTime"].ToString());
            entity.PicPath = dt.Rows[0]["PicPath"].ToString();
            entity.SellCount = int.Parse(dt.Rows[0]["SellCount"].ToString());
            entity.BookRemark = dt.Rows[0]["BookRemark"].ToString();

            entity.BookType = new BookTypeEntity();
            entity.BookType.ParentId = int.Parse(dt.Rows[0]["ParentId"].ToString());
            entity.BookType.TypeName = dt.Rows[0]["TypeName"].ToString();
            return entity;
        }
        #endregion

        #region 添加
        public int Add(BookInfoEntity entity)
        {
            string sql = @"insert into BookInfo(TypeId,BookCode,BookName,BookPrice,BookDisCount,BookAuthor,BookPress,PressTime,PicPath,SellCount,BookRemark) values(@TypeId,@BookCode,@BookName,@BookPrice,@BookDisCount,@BookAuthor,@BookPress,@PressTime,@PicPath,@SellCount,@BookRemark)";
            db.PrepareSql(sql);
            db.SetParameter("TypeId", entity.TypeId);
            db.SetParameter("BookCode", entity.BookCode);
            db.SetParameter("BookName", entity.BookName);
            db.SetParameter("BookPrice", entity.BookPrice);
            db.SetParameter("BookDisCount", entity.BookDisCount);
            db.SetParameter("BookAuthor", entity.BookAuthor);
            db.SetParameter("BookPress", entity.BookPress);
            db.SetParameter("PressTime", entity.PressTime);
            db.SetParameter("PicPath", entity.PicPath);
            db.SetParameter("SellCount", entity.SellCount);
            db.SetParameter("BookRemark", entity.BookRemark);
            return db.ExecNonQuery();
        }
        #endregion

        #region 删除
        public int Delete(int id)
        {
            string sql = "delete from BookInfo  where BookId=" + id;
            db.PrepareSql(sql);
            return db.ExecNonQuery();
        }
        #endregion

        #region 修改
        public int Update(BookInfoEntity entity)
        {
            string sql = "Update BookInfo set TypeId=@TypeId,BookCode=@BookCode,BookName=@BookName,BookPrice=@BookPrice,BookDisCount=@BookDisCount,BookAuthor=@BookAuthor,BookPress=@BookPress,PressTime=@PressTime,PicPath=@PicPath,SellCount=@SellCount,BookRemark=@BookRemark where BookId=@BookId";
            db.PrepareSql(sql);
            db.SetParameter("TypeId", entity.TypeId);
            db.SetParameter("BookCode", entity.BookCode);
            db.SetParameter("BookName", entity.BookName);
            db.SetParameter("BookPrice", entity.BookPrice);
            db.SetParameter("BookDisCount", entity.BookDisCount);
            db.SetParameter("BookAuthor", entity.BookAuthor);
            db.SetParameter("BookPress", entity.BookPress);
            db.SetParameter("PressTime", entity.PressTime);
            db.SetParameter("PicPath", entity.PicPath);
            db.SetParameter("SellCount", entity.SellCount);
            db.SetParameter("BookRemark", entity.BookRemark);
            db.SetParameter("BookId", entity.BookId);
            return db.ExecNonQuery();
        }
        #endregion

        #region 排序
        public List<BookInfoEntity> Order(int by,int Pageint, int Pagesize, out int Count)
        {
            string Order = "BookId";
            if (by != 0)
            {
                if (by == 1)
                    Order = " SellCount desc ";
                if (by == 2)
                    Order = " BookDisCount";
                if (by == 3)
                    Order = " BookId desc";
            }
            string sql = "select count(*) from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId where 1=1 " ;
            db.PrepareSql(sql);
            Count = int.Parse(db.ExecScalar().ToString());
            List<BookInfoEntity> list = new List<BookInfoEntity>();
            sql = @"select *from(
select ROW_NUMBER()over(order by "+ Order + " ) rowid,BookInfo.*,BookType.TypeName,BookType.ParentId from BookInfo left join BookType on BookInfo.TypeId = BookType.TypeId   where 1 = 1 ) Tamp where rowid between @star and @end";
            db.PrepareSql(sql);
            db.SetParameter("star", (Pageint - 1) * Pagesize + 1);
            db.SetParameter("end", Pageint * Pagesize);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                BookInfoEntity entity = new BookInfoEntity();
                entity.BookId = int.Parse(item["BookId"].ToString());
                entity.TypeId = int.Parse(item["TypeId"].ToString());
                entity.BookCode = item["BookCode"].ToString();
                entity.BookName = item["BookName"].ToString();
                entity.BookPrice = decimal.Parse(item["BookPrice"].ToString());
                entity.BookDisCount = decimal.Parse(item["BookDisCount"].ToString());
                entity.BookAuthor = item["BookAuthor"].ToString();
                entity.BookPress = item["BookPress"].ToString();
                entity.PressTime = DateTime.Parse(item["PressTime"].ToString());
                entity.PicPath = item["PicPath"].ToString();
                entity.SellCount = int.Parse(item["SellCount"].ToString());
                entity.BookRemark = item["BookRemark"].ToString();

                entity.BookType = new BookTypeEntity();
                entity.BookType.ParentId = int.Parse(item["ParentId"].ToString());
                entity.BookType.TypeName = item["TypeName"].ToString();
                list.Add(entity);
            }
            return list;
        }
        #endregion
    }
}
