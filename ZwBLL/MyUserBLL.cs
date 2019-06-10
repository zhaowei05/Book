using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;
using ZwDAL;

namespace ZwBLL
{
    public class MyUserBLL
    {
        MyUserDAL dal = new MyUserDAL();

        #region 列表
        public List<MyUserEntity> list()
        {
            return dal.list();
        }

        public List<MyUserEntity> list(MyUserEntity myentity, int Pageint, int Pagesize, out int Count)
        {
            return dal.list(myentity, Pageint, Pagesize, out Count);
        }
        #endregion

        #region 详情
        public MyUserEntity list(int id)
        {
            return dal.list(id);
        }
        #endregion

        #region 登录
        public MyUserEntity Delu(MyUserEntity Userentity)
        {
            return dal.Delu(Userentity);
        }
        #endregion

        #region 添加
        public int Add(MyUserEntity entity)
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
        public int Update(MyUserEntity entity)
        {
            return dal.Update(entity);
        }
        #endregion

        #region 权限修改
        public int Powerup(string power, int id)
        {
            return dal.Powerup(power, id);
        }

        public int list(string acoot)
        {
            return dal.list(acoot);
        }
        #endregion
    }
}
