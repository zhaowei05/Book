using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwDAL;
using ZwEntity;

namespace ZwBLL
{
    public class MyRoleBLL
    {
        MyRoleDAL dal = new MyRoleDAL();

        #region 列表
        public List<ZwEntity.MyRoleEntity> list()
        {
            return dal.list();
        }
        #endregion

        #region 详情
        public ZwEntity.MyRoleEntity list(int id)
        {
            return dal.list(id);
        }
        #endregion

        #region 添加
        public int Add(MyRoleEntity entity)
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
        public int Update(MyRoleEntity entity)
        {
            return dal.Update(entity);
        }
        #endregion

        #region 权限修改
        public int Powerup(string power, int id)
        {
            return dal.Powerup(power,id); 
        }
        #endregion
    }
}
