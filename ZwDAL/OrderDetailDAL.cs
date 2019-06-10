using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;
using System.Data;

namespace ZwDAL
{
    public class OrderDetailDAL
    {
        DBHelper db = new DBHelper();

        #region 列表
        public List<OrderDetailEntity> list()
        {
            List<OrderDetailEntity> list = new List<OrderDetailEntity>();
            string sql = "select OrderDetail.*,BookInfo.BookName,BookInfo.PicPath from OrderDetail left join BookInfo on OrderDetail.BookId=BookInfo.BookId ";
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                OrderDetailEntity entity = new OrderDetailEntity();
                entity.OrderDetailId = int.Parse(item["OrderDetailId"].ToString());
                entity.OrderId = int.Parse(item["OrderId"].ToString());
                entity.BookId = int.Parse(item["OrderDetail.BookId"].ToString());
                entity.BookSalePrice = decimal.Parse(item["BookSalePrice"].ToString());
                entity.BookSaleCount = int.Parse(item["BookSaleCount"].ToString());

                entity.BookInfo = new BookInfoEntity();
                entity.BookInfo.BookName = item["BookName"].ToString();
                entity.BookInfo.PicPath = item["PicPath"].ToString();
                list.Add(entity);
            }
            return list;
        }

        public List<OrderDetailEntity> list(int merid, int Pageint, int Pagesize, out int Count)
        {
            List<OrderDetailEntity> list = new List<OrderDetailEntity>();
            string sql = "select count(*) from OrderDetail left join MyOrder on OrderDetail.OrderId = MyOrder.OrderId where MemberId = "+ merid;
            db.PrepareSql(sql);
            Count = int.Parse(db.ExecScalar().ToString());
            sql = @"select * from(select row_number() over(order by OrderStatus)rowid,OrderDetail.*,BookInfo.BookName,BookInfo.PicPath,MyOrder.OrderTime,MyOrder.OrderCode,MyOrder.OrderStatus,MyOrder.OrderAllMoney,MyOrder.MemberId from OrderDetail
            left join BookInfo on OrderDetail.BookId = BookInfo.BookId
            left join MyOrder on OrderDetail.OrderId = MyOrder.OrderId where MemberId = @MemberId  ) tamp where rowid between @start and @end";
            db.PrepareSql(sql);
            db.SetParameter("MemberId", merid);
            db.SetParameter("start", (Pageint - 1) * Pagesize + 1);
            db.SetParameter("end", Pageint * Pagesize);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                OrderDetailEntity entity = new OrderDetailEntity();
                entity.OrderDetailId = int.Parse(item["OrderDetailId"].ToString());
                entity.OrderId = int.Parse(item["OrderId"].ToString());
                entity.BookId = int.Parse(item["BookId"].ToString());
                entity.BookSalePrice = decimal.Parse(item["BookSalePrice"].ToString());
                entity.BookSaleCount = int.Parse(item["BookSaleCount"].ToString());

                entity.BookInfo = new BookInfoEntity();
                entity.BookInfo.BookName = item["BookName"].ToString();
                entity.BookInfo.PicPath = item["PicPath"].ToString();
                entity.MyOrder = new MyOrderEntity();
                entity.MyOrder.OrderTime = item["OrderTime"].ToString();
                entity.MyOrder.OrderCode= item["OrderCode"].ToString();
                entity.MyOrder.OrderStatus = int.Parse(item["OrderStatus"].ToString());
                entity.MyOrder.OrderAllMoney = decimal.Parse(item["OrderAllMoney"].ToString());
                entity.MyOrder.MemberId = int.Parse(item["MemberId"].ToString());
                list.Add(entity);
            }
            return list;
        }
        #endregion

        #region 详情
        public List<OrderDetailEntity> list(int id)
        {
            List<OrderDetailEntity> list = new List<OrderDetailEntity>();
            string sql = "select OrderDetail.*,BookInfo.BookName,BookInfo.PicPath from OrderDetail left join BookInfo on OrderDetail.BookId=BookInfo.BookId  where OrderId=" + id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                OrderDetailEntity entity = new OrderDetailEntity();
                entity.OrderDetailId = int.Parse(item["OrderDetailId"].ToString());
                entity.OrderId = int.Parse(item["OrderId"].ToString());
                entity.BookId = int.Parse(item["BookId"].ToString());
                entity.BookSalePrice = decimal.Parse(item["BookSalePrice"].ToString());
                entity.BookSaleCount = int.Parse(item["BookSaleCount"].ToString());

                entity.BookInfo = new BookInfoEntity();
                entity.BookInfo.BookName = item["BookName"].ToString();
                entity.BookInfo.PicPath = item["PicPath"].ToString();
                list.Add(entity);
            }
            return list;
        }
        #endregion

        #region 添加
        public int Add(OrderDetailEntity entity)
        {
            string sql = @"insert into OrderDetail(OrderId,BookId,BookSalePrice,BookSaleCount)
values(@OrderId, @BookId,@BookSalePrice,@BookSaleCount)";
            db.PrepareSql(sql);
            db.SetParameter("OrderId", entity.OrderId);
            db.SetParameter("BookId", entity.BookId);
            db.SetParameter("BookSalePrice", entity.BookSalePrice);
            db.SetParameter("BookSaleCount", entity.BookSaleCount);
            return db.ExecNonQuery();
        }
        #endregion

        #region 删除
        public int Delete(int id)
        {
            string sql = "delete from OrderDetail  where OrderDetailId=" + id;
            db.PrepareSql(sql);
            return db.ExecNonQuery();
        }
        #endregion

        #region 修改
        public int Update(OrderDetailEntity entity)
        {
            string sql = "Update OrderDetail set OrderId=@OrderId, BookId=@BookId,BookSalePrice=@BookSalePrice,BookSaleCount=@BookSaleCount where OrderDetailId=@OrderDetailId";
            db.PrepareSql(sql);
            db.SetParameter("OrderId", entity.OrderId);
            db.SetParameter("BookId", entity.BookId);
            db.SetParameter("BookSalePrice", entity.BookSalePrice);
            db.SetParameter("BookSaleCount", entity.BookSaleCount);
            return db.ExecNonQuery();
        }
        #endregion
    }
}
