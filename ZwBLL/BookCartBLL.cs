using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwDAL;
using ZwEntity;

namespace ZwBLL
{
    public class BookCartBLL
    {
        BookCartDAL dal = new BookCartDAL();


        #region 列表
        public List<BookCartEntity> list(int id)
        {
            return dal.list(id);
        }
        #endregion

        #region 详情
        public BookCartEntity lists(int id)
        {
            return dal.lists(id);
        }
        #endregion

        #region 添加
        public int Add(BookCartEntity entity)
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
        public int Update(BookCartEntity entity)
        {
            return dal.Update(entity);
        }
        #endregion

        #region 是否存在该商品
        public BookCartEntity list(int usrid, int bookid)
        {
            return dal.list(usrid, bookid);
        }
        #endregion
    }
}
