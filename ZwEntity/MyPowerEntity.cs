using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZwEntity
{
   public class MyPowerEntity
    {
        public string PowerId { get; set; }//--主键
        public string MotherId { get; set; }//--母级权限
        public string PowerName { get; set; }//--权限名称
        public string MenuName { get; set; }//--菜单名称
        public string PowerPage { get; set; }//--菜单打开链接地址（*代表不跳转到具体功能页面，而是跳转到下级菜单展示信息页面）
    }
}
