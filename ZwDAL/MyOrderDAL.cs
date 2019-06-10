using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;
using System.Data;

namespace ZwDAL
{
   public  class MyOrderDAL
    {
        DBHelper db = new DBHelper();

        #region 列表
        public List<MyOrderEntity> list()
        {
            List<MyOrderEntity> list = new List<MyOrderEntity>();
            string sql = "select MyOrder.*,Member.MemberAcc from MyOrder left join Member on Member.MemberId=MyOrder.MemberId";
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                MyOrderEntity entity = new MyOrderEntity();
                entity.OrderId = int.Parse(item["OrderId"].ToString());
                entity.MemberId = int.Parse(item["MyOrder.MemberId"].ToString());
                entity.OrderCode = item["OrderCode"].ToString();
                entity.OrderPeople = item["OrderPeople"].ToString();
                entity.OrderPhone = item["OrderPhone"].ToString();
                entity.OrderAddress = item["OrderAddress"].ToString();
                entity.OrderAllMoney =decimal.Parse(item["OrderAllMoney"].ToString());
                entity.OrderStatus = int.Parse(item["OrderStatus"].ToString());
                entity.OrderTime = item["OrderTime"].ToString();

                entity.Member = new MemberEntity();
                entity.Member.MemberAcc = item["MemberAcc"].ToString();
                list.Add(entity);
            }
            return list;
        }

        public List<MyOrderEntity> list(string time,MyOrderEntity myentity, int Pageint, int Pagesize, out int Count)
        {
            string sqlwhere = "";
            if (myentity != null)
            {
                if (time != null && !time.Equals(""))
                    sqlwhere += " and OrderTime between '" + time.Split(',')[0] + "' and '"+ time.Split(',')[1] + "'";
                if (myentity.OrderStatus != null && myentity.OrderStatus!=0)
                    sqlwhere += " and OrderStatus ="+ myentity.OrderStatus;
                if (myentity.OrderCode != null && !myentity.OrderCode.Equals(""))
                    sqlwhere += " and OrderCode =" + myentity.OrderCode;
            }
            string sql = "select count(*) from MyOrder left join Member on Member.MemberId=MyOrder.MemberId where 1=1 " + sqlwhere;
            db.PrepareSql(sql);
            Count = int.Parse(db.ExecScalar().ToString());
            List<MyOrderEntity> list = new List<MyOrderEntity>();
            sql = @"select *from(
select ROW_NUMBER()over(order by OrderId) rowid,MyOrder.*,Member.MemberAcc from MyOrder left join Member on Member.MemberId=MyOrder.MemberId  where 1=1 " + sqlwhere + ") Tamp where rowid between @satr and @end";
            db.PrepareSql(sql);
            db.SetParameter("satr", (Pageint - 1) * Pagesize + 1);
            db.SetParameter("end", Pageint * Pagesize);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                MyOrderEntity entity = new MyOrderEntity();
                entity.OrderId = int.Parse(item["OrderId"].ToString());
                entity.MemberId = int.Parse(item["MemberId"].ToString());
                entity.OrderCode = item["OrderCode"].ToString();
                entity.OrderPeople = item["OrderPeople"].ToString();
                entity.OrderPhone = item["OrderPhone"].ToString();
                entity.OrderAddress = item["OrderAddress"].ToString();
                entity.OrderAllMoney = decimal.Parse(item["OrderAllMoney"].ToString());
                entity.OrderStatus = int.Parse(item["OrderStatus"].ToString());
                entity.OrderTime = item["OrderTime"].ToString();

                entity.Member = new MemberEntity();
                entity.Member.MemberAcc = item["MemberAcc"].ToString();
                list.Add(entity);
            }
            return list;
        }
        public List<MyOrderEntity> list(int merbid, int Pageint, int Pagesize, out int Count)
        {
            string sqlwhere = "and MemberId="+merbid;
            string sql = "select count(*) from MyOrder left join Member on Member.MemberId=MyOrder.MemberId where 1=1 " + sqlwhere;
            db.PrepareSql(sql);
            Count = int.Parse(db.ExecScalar().ToString());
            List<MyOrderEntity> list = new List<MyOrderEntity>();
            sql = @"select *from(
select ROW_NUMBER()over(order by OrderId) rowid,MyOrder.*,Member.MemberAcc from MyOrder left join Member on Member.MemberId=MyOrder.MemberId  where 1=1 " + sqlwhere + ") Tamp where rowid between @satr and @end order by OrderStatus";
            db.PrepareSql(sql);
            db.SetParameter("satr", (Pageint - 1) * Pagesize + 1);
            db.SetParameter("end", Pageint * Pagesize);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                MyOrderEntity entity = new MyOrderEntity();
                entity.OrderId = int.Parse(item["OrderId"].ToString());
                entity.MemberId = int.Parse(item["MemberId"].ToString());
                entity.OrderCode = item["OrderCode"].ToString();
                entity.OrderPeople = item["OrderPeople"].ToString();
                entity.OrderPhone = item["OrderPhone"].ToString();
                entity.OrderAddress = item["OrderAddress"].ToString();
                entity.OrderAllMoney = decimal.Parse(item["OrderAllMoney"].ToString());
                entity.OrderStatus = int.Parse(item["OrderStatus"].ToString());
                entity.OrderTime =item["OrderTime"].ToString();

                entity.Member = new MemberEntity();
                entity.Member.MemberAcc = item["MemberAcc"].ToString();
                list.Add(entity);
            }
            return list;
        }
        #endregion

        #region 详情
        public MyOrderEntity list(int id)
        {
            string sql = "select * from  MyOrder where OrderId=" + id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count == 0)
                return null;
            MyOrderEntity entity = new MyOrderEntity();
            entity.OrderId = int.Parse(dt.Rows[0]["OrderId"].ToString());
            entity.MemberId = int.Parse(dt.Rows[0]["MemberId"].ToString());
            entity.OrderCode = dt.Rows[0]["OrderCode"].ToString();
            entity.OrderPeople = dt.Rows[0]["OrderPeople"].ToString();
            entity.OrderPhone = dt.Rows[0]["OrderPhone"].ToString();
            entity.OrderAddress = dt.Rows[0]["OrderAddress"].ToString();
            entity.OrderAllMoney = decimal.Parse(dt.Rows[0]["OrderAllMoney"].ToString());
            entity.OrderStatus = int.Parse(dt.Rows[0]["OrderStatus"].ToString());
            entity.OrderTime = dt.Rows[0]["OrderTime"].ToString();

            return entity;
        }
        public MyOrderEntity list(string OrderCode)
        {
            string sql = "select * from  MyOrder where OrderCode='"+ OrderCode + "'";
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count == 0)
                return null;
            MyOrderEntity entity = new MyOrderEntity();
            entity.OrderId = int.Parse(dt.Rows[0]["OrderId"].ToString());
            entity.MemberId = int.Parse(dt.Rows[0]["MemberId"].ToString());
            entity.OrderCode = dt.Rows[0]["OrderCode"].ToString();
            entity.OrderPeople = dt.Rows[0]["OrderPeople"].ToString();
            entity.OrderPhone = dt.Rows[0]["OrderPhone"].ToString();
            entity.OrderAddress = dt.Rows[0]["OrderAddress"].ToString();
            entity.OrderAllMoney = decimal.Parse(dt.Rows[0]["OrderAllMoney"].ToString());
            entity.OrderStatus = int.Parse(dt.Rows[0]["OrderStatus"].ToString());
            entity.OrderTime = dt.Rows[0]["OrderTime"].ToString();
            return entity;
        }
        #endregion

        #region 添加
        public int Add(MyOrderEntity entity)
        {
            string sql = @"insert into MyOrder (OrderCode,MemberId,OrderPeople,OrderPhone,OrderAddress,OrderAllMoney,OrderStatus,OrderTime) values(@OrderCode, @MemberId,@OrderPeople,@OrderPhone, @OrderAddress,@OrderAllMoney,@OrderStatus, GETDATE())";
            db.PrepareSql(sql);
            db.SetParameter("OrderCode", entity.OrderCode);
            db.SetParameter("MemberId", entity.MemberId);
            db.SetParameter("OrderPeople", entity.OrderPeople);
            db.SetParameter("OrderPhone", entity.OrderPhone);
            db.SetParameter("OrderAddress", entity.OrderAddress);
            db.SetParameter("OrderAllMoney", entity.OrderAllMoney);
            db.SetParameter("OrderStatus", entity.OrderStatus);
            return db.ExecNonQuery();
        }
        #endregion

        #region 删除
        public int Delete(int id)
        {
            string sql = "delete from MyOrder  where OrderId=" + id;
            db.PrepareSql(sql);
            return db.ExecNonQuery();
        }
        #endregion

        #region 修改
        public int Update(MyOrderEntity entity)
        {
            string sql = "Update MyOrder set OrderCode=@OrderCode, MemberId=@MemberId,OrderPeople=@OrderPeople,OrderPhone=@OrderPhone, OrderAddress=@OrderAddress,OrderAllMoney=@OrderAllMoney,OrderStatus=@OrderStatus where OrderId=@OrderId";
            db.PrepareSql(sql);
            db.SetParameter("OrderCode", entity.OrderCode);
            db.SetParameter("MemberId", entity.MemberId);
            db.SetParameter("OrderPeople", entity.OrderPeople);
            db.SetParameter("OrderPhone", entity.OrderPhone);
            db.SetParameter("OrderAddress", entity.OrderAddress);
            db.SetParameter("OrderAllMoney", entity.OrderAllMoney);
            db.SetParameter("OrderStatus", entity.OrderStatus);
            db.SetParameter("OrderId", entity.OrderId);
            return db.ExecNonQuery();
        }
        #endregion

        #region 订单详情
        //public List<MyOrderEntity> listor(int merdid, int Pageint, int Pagesize, out int Count)
        //{
        //    List<MyOrderEntity> list = new List<MyOrderEntity>();

        //}
        #endregion
    }
}
