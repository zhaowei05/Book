using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
    public class MyUserEntity
    {
        public int UserId { get; set; }//--主键
        public int RoleId { get; set; }//--角色编号，外键（与角色表关联）
        public string UserAccount { get; set; }//--用户名
        public string UserPwd { get; set; }//--密码
        public string UserRealName { get; set; }//--真实姓名
        public string UserPhone { get; set; }//--用户联系电话
        public string UserPowerList { get; set; }//--用户权限列表
        public DateTime UserTime { get; set; }//--信息添加时间

        public MyRoleEntity Role { get; set; }//--角色
    }
}
