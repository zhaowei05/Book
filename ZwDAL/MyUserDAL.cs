using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;

namespace ZwDAL
{
    public class MyUserDAL
    {
        DBHelper db = new DBHelper();

        #region 列表
        public List<MyUserEntity> list()
        {
            List<MyUserEntity> list = new List<MyUserEntity>();
            string sql = "select * from MyUser";
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                MyUserEntity entity = new MyUserEntity();
                entity.UserId = int.Parse(item["UserId"].ToString());
                entity.RoleId = int.Parse(item["RoleId"].ToString());
                entity.UserAccount = item["UserAccount"].ToString();
                entity.UserPwd = item["UserPwd"].ToString();
                entity.UserRealName = item["UserRealName"].ToString();
                entity.UserPhone = item["UserPhone"].ToString();
                entity.UserPowerList = item["UserPowerList"].ToString();
                entity.UserTime = DateTime.Parse(item["UserTime"].ToString());
                list.Add(entity);
            }
            return list;
        }

        public List<MyUserEntity> list(MyUserEntity myentity, int Pageint,int Pagesize,out int Count)
        {
            string sqlwhere = "";
            if (myentity != null)
            {
                if (myentity.UserAccount != null && !myentity.UserAccount.Equals(""))
                    sqlwhere += " and UserAccount like'%"+ myentity.UserAccount + "%'";
                if (myentity.UserRealName != null && !myentity.UserRealName.Equals(""))
                    sqlwhere += " and UserRealName like'%" + myentity.UserRealName + "%'";
            }
            string sql = "select count(*) from MyUser where 1=1 "+ sqlwhere;
            db.PrepareSql(sql);
            Count= int.Parse(db.ExecScalar().ToString());
            List<MyUserEntity> list = new List<MyUserEntity>();
            sql = @"select *from(
select ROW_NUMBER()over(order by UserId) rowid,MyUser.*,MyRole.RoleName,MyRole.RolePowerList from MyUser left join MyRole on MyUser.RoleId=MyRole.RoleId where 1=1 " + sqlwhere + ") Tamp where rowid between @satr and @end";
            db.PrepareSql(sql);
            db.SetParameter("satr", (Pageint-1)* Pagesize+1);
            db.SetParameter("end", Pageint* Pagesize);
            DataTable dt = db.ExecQuery();
            foreach (DataRow item in dt.Rows)
            {
                MyUserEntity entity = new MyUserEntity();
                entity.UserId = int.Parse(item["UserId"].ToString());
                entity.RoleId = int.Parse(item["RoleId"].ToString());
                entity.UserAccount = item["UserAccount"].ToString();
                entity.UserPwd = item["UserPwd"].ToString();
                entity.UserRealName = item["UserRealName"].ToString();
                entity.UserPhone = item["UserPhone"].ToString();
                entity.UserPowerList = item["UserPowerList"].ToString();
                entity.UserTime = DateTime.Parse(item["UserTime"].ToString());

                entity.Role = new MyRoleEntity();
                entity.Role.RoleName= item["RoleName"].ToString();
                entity.Role.RolePowerList = item["RolePowerList"].ToString();
                list.Add(entity);
            }
            return list;
        }

        public int list(string acoot)
        {
            string sql = "select count(*) from MyUser  where UserAccount='"+ acoot + "'";
            db.PrepareSql(sql);
            return int.Parse(db.ExecScalar().ToString());
        }
        #endregion

        #region 详情
        public MyUserEntity list(int id)
        {
            string sql = "select MyUser.*,MyRole.RolePowerList from MyUser left join MyRole on MyUser.RoleId=MyRole.RoleId where UserId=" + id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count == 0)
                return null;
            MyUserEntity entity = new MyUserEntity();
            entity.UserId = int.Parse(dt.Rows[0]["UserId"].ToString());
            entity.RoleId = int.Parse(dt.Rows[0]["RoleId"].ToString());
            entity.UserAccount = dt.Rows[0]["UserAccount"].ToString();
            entity.UserPwd = dt.Rows[0]["UserPwd"].ToString();
            entity.UserRealName = dt.Rows[0]["UserRealName"].ToString();
            entity.UserPhone = dt.Rows[0]["UserPhone"].ToString();
            entity.UserPowerList = dt.Rows[0]["UserPowerList"].ToString();
            entity.UserTime = DateTime.Parse(dt.Rows[0]["UserTime"].ToString());

            entity.Role = new MyRoleEntity();
            entity.Role.RolePowerList= dt.Rows[0]["RolePowerList"].ToString();
            return entity;
        }
        #endregion

        #region 登录
        public MyUserEntity Delu(MyUserEntity Userentity)
        {
            string sql = "select * from MyUser where UserAccount=@UserAccount and UserPwd=@UserPwd";
            db.PrepareSql(sql);
            db.SetParameter("UserAccount", Userentity.UserAccount);
            db.SetParameter("UserPwd", Userentity.UserPwd);
            DataTable dt = db.ExecQuery();
            if (dt.Rows.Count != 1)
            {
                return null;
            }
            else
            {
                MyUserEntity entity = new MyUserEntity();
                entity.UserId = int.Parse(dt.Rows[0]["UserId"].ToString());
                entity.RoleId = int.Parse(dt.Rows[0]["RoleId"].ToString());
                entity.UserAccount = dt.Rows[0]["UserAccount"].ToString();
                entity.UserPwd = dt.Rows[0]["UserPwd"].ToString();
                entity.UserRealName = dt.Rows[0]["UserRealName"].ToString();
                entity.UserPhone = dt.Rows[0]["UserPhone"].ToString();
                entity.UserPowerList = dt.Rows[0]["UserPowerList"].ToString();
                entity.UserTime = DateTime.Parse(dt.Rows[0]["UserTime"].ToString());
                return entity;
            }
        }
        #endregion

        #region 添加
        public int Add(MyUserEntity entity)
        {
            string sql = @"insert into MyUser(RoleId,UserAccount,UserPwd,UserRealName,UserPhone,UserPowerList,UserTime)
values(@RoleId, @UserAccount,@UserPwd,@UserRealName, @UserPhone, '', GETDATE())";
            db.PrepareSql(sql);
            db.SetParameter("RoleId", entity.RoleId);
            db.SetParameter("UserAccount", entity.UserAccount);
            db.SetParameter("UserPwd", entity.UserPwd);
            db.SetParameter("UserRealName", entity.UserRealName);
            db.SetParameter("UserPhone", entity.UserPhone);
            return db.ExecNonQuery();
        }
        #endregion

        #region 删除
        public int Delete(int id)
        {
            string sql = "delete from MyUser  where UserId="+id;
            db.PrepareSql(sql);
            return db.ExecNonQuery();
        }
        #endregion

        #region 修改
        public int Update(MyUserEntity entity)
        {
            string sql = "Update MyUser set RoleId=@RoleId,UserPwd=@UserPwd,UserRealName=@UserRealName,UserPhone=@UserPhone where UserId=@UserId";
            db.PrepareSql(sql);
            db.SetParameter("RoleId", entity.RoleId);
            db.SetParameter("UserPwd", entity.UserPwd);
            db.SetParameter("UserRealName", entity.UserRealName);
            db.SetParameter("UserPhone", entity.UserPhone);
            db.SetParameter("UserId", entity.UserId);
            return db.ExecNonQuery();
        }
        #endregion

        #region 权限修改
        public int Powerup(string power,int id)
        {
            string sql = "Update MyUser set UserPowerList=@UserPowerList where UserId=@UserId";
            db.PrepareSql(sql);
            db.SetParameter("UserPowerList", power);
            db.SetParameter("UserId", id);
            return db.ExecNonQuery();
        }
        #endregion
    }
}
