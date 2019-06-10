using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;
using System.Data;

namespace ZwDAL
{
    public class BookCartDAL
    {
        DBHelper db = new DBHelper();

        #region 列表
        public List<BookCartEntity> list(int id)
        {
            List<BookCartEntity> list = new List<BookCartEntity>();
            string sql = "select BookCart.*,BookInfo.PicPath,BookInfo.BookName,BookInfo.BookPrice,BookInfo.BookDisCount from BookCart left join BookInfo on BookCart.BookId=BookInfo.BookId where MemberId="+id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                BookCartEntity entity = new BookCartEntity();
                entity.CartId = int.Parse(item["CartId"].ToString());
                entity.MemberId = int.Parse(item["MemberId"].ToString());
                entity.BookId = int.Parse(item["BookId"].ToString());
                entity.BookCount = int.Parse(item["BookCount"].ToString());
                entity.IsSelect = int.Parse(item["IsSelect"].ToString());

                entity.BookInfo = new BookInfoEntity();
                entity.BookInfo.BookName = item["BookName"].ToString();
                entity.BookInfo.PicPath = item["PicPath"].ToString();
                entity.BookInfo.BookPrice = decimal.Parse(item["BookPrice"].ToString());
                entity.BookInfo.BookDisCount = decimal.Parse(item["BookDisCount"].ToString());
                list.Add(entity);
            }
            return list;
        }
        #endregion

        #region 详情
        public BookCartEntity lists(int id)
        {
            string sql = "select BookCart.*,BookInfo.PicPath,BookInfo.BookName,BookInfo.BookPrice,BookInfo.BookDisCount from BookCart left join BookInfo on BookCart.BookId=BookInfo.BookId where CartId=" + id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            BookCartEntity entity = new BookCartEntity();
            entity.CartId = int.Parse(dt.Rows[0]["CartId"].ToString());
            entity.MemberId = int.Parse(dt.Rows[0]["MemberId"].ToString());
            entity.BookId = int.Parse(dt.Rows[0]["BookId"].ToString());
            entity.BookCount = int.Parse(dt.Rows[0]["BookCount"].ToString());
            entity.IsSelect = int.Parse(dt.Rows[0]["IsSelect"].ToString());
            
            entity.BookInfo = new BookInfoEntity();
            entity.BookInfo.BookName = dt.Rows[0]["BookName"].ToString();
            entity.BookInfo.PicPath = dt.Rows[0]["PicPath"].ToString();
            entity.BookInfo.BookPrice = decimal.Parse(dt.Rows[0]["BookPrice"].ToString());
            entity.BookInfo.BookDisCount = decimal.Parse(dt.Rows[0]["BookDisCount"].ToString());
            return entity;
        }
        #endregion

        #region 添加
        public int Add(BookCartEntity entity)
        {
            string sql = @"insert into BookCart(MemberId,BookId,BookCount,IsSelect)
values(@MemberId, @BookId,@BookCount,1)";
            db.PrepareSql(sql);
            db.SetParameter("MemberId", entity.MemberId);
            db.SetParameter("BookId", entity.BookId);
            db.SetParameter("BookCount", entity.BookCount);
            return db.ExecNonQuery();
        }
        #endregion

        #region 删除
        public int Delete(int id)
        {
            string sql = "delete from BookCart  where CartId=" + id;
            db.PrepareSql(sql);
            return db.ExecNonQuery();
        }
        #endregion

        #region 修改
        public int Update(BookCartEntity entity)
        {
            string sql = "Update BookCart set  BookId=@BookId,BookCount=@BookCount,IsSelect=@IsSelect  where CartId=@CartId";
            db.PrepareSql(sql);
            db.SetParameter("BookId", entity.BookId);
            db.SetParameter("BookCount", entity.BookCount);
            db.SetParameter("IsSelect", entity.IsSelect);
            db.SetParameter("CartId", entity.CartId);
            return db.ExecNonQuery();
        }
        #endregion

        #region 是否存在该商品
        public BookCartEntity list(int usrid, int bookid)
        {
            BookCartEntity cartEntity = new BookCartEntity();
            string sql = " select * from BookCart where MemberId=@MemberId and BookId=@BookId";
            db.PrepareSql(sql);
            db.SetParameter("MemberId", usrid);
            db.SetParameter("BookId", bookid);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count == 0)
                return null;
            cartEntity.CartId= int.Parse(dt.Rows[0]["CartId"].ToString());
            cartEntity.MemberId = int.Parse(dt.Rows[0]["MemberId"].ToString());
            cartEntity.BookId = int.Parse(dt.Rows[0]["BookId"].ToString());
            cartEntity.BookCount = int.Parse(dt.Rows[0]["BookCount"].ToString());
            cartEntity.IsSelect = int.Parse(dt.Rows[0]["IsSelect"].ToString());
            return cartEntity;
        }
        #endregion
    }
}
