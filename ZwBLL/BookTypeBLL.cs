using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;
using ZwDAL;

namespace ZwBLL
{
    public class BookTypeBLL
    {
        BookTypeDAL dal = new BookTypeDAL();

        #region 列表
        public List<BookTypeEntity> list()
        {
            return dal.list();
        }
        public List<BookTypeEntity> list(int id)
        {
            return dal.list(id);
        }
        #endregion

        #region 详情
        public BookTypeEntity lists(int id)
        {
            return dal.lists(id);
        }
        #endregion

        #region 添加
        public int Add(BookTypeEntity entity)
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
        public int Update(BookTypeEntity entity)
        {
            return dal.Update(entity);
        }
        #endregion
    }
}
