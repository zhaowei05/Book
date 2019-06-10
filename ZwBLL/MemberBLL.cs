
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwDAL;
using ZwEntity;


namespace ZwBLL
{
    public class MemberBLL
    {
        MemberDAL dal = new MemberDAL();
        #region 列表
        public List<MemberEntity> list()
        {
            return dal.list();
        }

        public List<MemberEntity> list(MemberEntity myentity, int Pageint, int Pagesize, out int Count)
        {
            return dal.list(myentity, Pageint, Pagesize, out Count);
        }

        public int list(string str)
        {
            return dal.list(str);
        }
        #endregion

        #region 详情
        public MemberEntity list(int id)
        {
            return dal.list(id);
        }
        #endregion

        #region 登录
        public MemberEntity Delu(MemberEntity Userentity)
        {
            return dal.Delu(Userentity);
        }
        #endregion

        #region 添加
        public int Add(MemberEntity entity)
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
        public int Update(MemberEntity entity)
        {
            return dal.Update(entity);
        }
        #endregion
    }
}
