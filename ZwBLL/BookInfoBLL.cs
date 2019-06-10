using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwDAL;
using ZwEntity;

namespace ZwBLL
{
    public class BookInfoBLL
    {
        BookInfoDAL dal = new BookInfoDAL();
        #region 列表
        public List<BookInfoEntity> list()
        {
            return dal.list();
        }

        public List<BookInfoEntity> list(BookInfoEntity infoEntity, int Pageint, int Pagesize, out int Count)
        {
            return dal.list(infoEntity, Pageint, Pagesize, out Count);
        }
        #endregion

        #region 排序
        public List<BookInfoEntity> Order(int by, int Pageint, int Pagesize, out int Count)
        {
            return dal.Order(by, Pageint, Pagesize,out Count);
        }
        #endregion

        #region 详情
        public BookInfoEntity list(int id)
        {
            return dal.list(id);
        }
        #endregion

        #region 添加
        public int Add(BookInfoEntity entity)
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
        public int Update(BookInfoEntity entity)
        {
            return dal.Update(entity);
        }
        #endregion

    }
}
