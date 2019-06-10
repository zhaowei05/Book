using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZwEntity;

namespace ZwDAL
{
   public class MyRoleDAL
    {
       DBHelper db = new DBHelper();

       #region 列表
       public List<ZwEntity.MyRoleEntity> list()
       {
           List<ZwEntity.MyRoleEntity> list = new List<ZwEntity.MyRoleEntity>();
           string sql = "select * from MyRole";
           db.PrepareSql(sql);
           DataTable dt = db.ExecQuery();
           foreach (DataRow item in dt.Rows)
           {
               ZwEntity.MyRoleEntity entity = new ZwEntity.MyRoleEntity();
               entity.RoleId =int.Parse(item["RoleId"].ToString());
               entity.RoleName = item["RoleName"].ToString();
               entity.RoleRemark = item["RoleRemark"].ToString();
               entity.RolePowerList = item["RolePowerList"].ToString();
               list.Add(entity);
           }
           return list;
       }
        #endregion

       #region 详情
        public ZwEntity.MyRoleEntity list(int id)
        {
            string sql = "select * from MyRole where RoleId="+id;
            db.PrepareSql(sql);
            DataTable dt = db.ExecQuery();
            ZwEntity.MyRoleEntity entity = new ZwEntity.MyRoleEntity();
            entity.RoleId = int.Parse(dt.Rows[0]["RoleId"].ToString());
            entity.RoleName = dt.Rows[0]["RoleName"].ToString();
            entity.RoleRemark = dt.Rows[0]["RoleRemark"].ToString();
            entity.RolePowerList = dt.Rows[0]["RolePowerList"].ToString(); 

            return entity;
        }
        #endregion

       #region 添加
        public int Add(MyRoleEntity entity)
    {
        string sql = @"insert into MyRole(RoleName,RoleRemark)
values(@RoleName,@RoleRemark)";
        db.PrepareSql(sql);
        db.SetParameter("RoleName", entity.RoleName);
        db.SetParameter("RoleRemark", entity.RoleRemark);
        return db.ExecNonQuery();
    }
    #endregion
    
       #region 删除
    public int Delete(int id)
    {
        string sql = "delete from MyRole  where RoleId=" + id;
        db.PrepareSql(sql);
        return db.ExecNonQuery();
    }
    #endregion

       #region 修改
    public int Update(MyRoleEntity entity)
    {
        string sql = "Update MyRole set RoleName=@RoleName,RoleRemark=@RoleRemark where RoleId=@RoleId";
        db.PrepareSql(sql);
        db.SetParameter("RoleName", entity.RoleName);
        db.SetParameter("RoleRemark", entity.RoleRemark);
        db.SetParameter("RoleId", entity.RoleId);
        return db.ExecNonQuery();
    }
    #endregion

       #region 权限修改
    public int Powerup(string power, int id)
    {
        string sql = "Update MyRole set RolePowerList=@RolePowerList where RoleId=@RoleId";
        db.PrepareSql(sql);
        db.SetParameter("RolePowerList", power);
        db.SetParameter("RoleId", id);
        return db.ExecNonQuery();
    }
    #endregion

    }
}
