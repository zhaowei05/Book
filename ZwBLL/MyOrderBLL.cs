using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwDAL;
using ZwEntity;

namespace ZwBLL
{
    public class MyOrderBLL
    {
        MyOrderDAL dal = new MyOrderDAL();
        #region 列表
        public List<MyOrderEntity> list()
        {
            return dal.list();
        }

        public List<MyOrderEntity> list(string time, MyOrderEntity myentity, int Pageint, int Pagesize, out int Count)
        {
           return dal.list(time,myentity,Pageint,Pagesize,out Count);
        }
        public List<MyOrderEntity> list(int merbid, int Pageint, int Pagesize, out int Count)
        {
            return dal.list(merbid, Pageint, Pagesize,out Count);
        }
        #endregion

        #region 详情
        public MyOrderEntity list(int id)
        {
            return dal.list(id);
        }
        public MyOrderEntity list(string OrderCode)
        {
            return dal.list(OrderCode);
        }
        #endregion

        #region 添加
        public int Add(MyOrderEntity entity)
        {
            return dal.Add(entity);
        }
        #endregion

        #region 删除
        public int Delete(int id)
        {
            return dal.Delete(id);
        }
        #endregion

        #region 修改
        public int Update(MyOrderEntity entity)
        {
            return dal.Update(entity);
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
