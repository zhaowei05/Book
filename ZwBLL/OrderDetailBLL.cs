using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwDAL;
using ZwEntity;

namespace ZwBLL
{
    public class OrderDetailBLL
    {
        OrderDetailDAL dal = new OrderDetailDAL();


        #region 列表
        public List<OrderDetailEntity> list()
        {
            return dal.list();
        }

        public List<OrderDetailEntity> list(int merid, int Pageint, int Pagesize, out int Count)
        {
            return dal.list(merid,Pageint,Pagesize,out Count);
        }
        #endregion

        #region 详情
        public List<OrderDetailEntity> list(int id)
        {
            return dal.list(id);
        }
        #endregion

        #region 添加
        public int Add(OrderDetailEntity entity)
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
        public int Update(OrderDetailEntity entity)
        {
            return dal.Update(entity);
        }
        #endregion
    }
}
