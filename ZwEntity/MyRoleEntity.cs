using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
   public  class MyRoleEntity
    {
        public int RoleId { get; set; }//--主键
       public string RoleName { get; set; }//--角色名称
       public string RoleRemark { get; set; }//--系统角色描述
       public string RolePowerList { get; set; }//--角色权限列表
    }
}
