using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.Role
{
    public partial class RoleAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            ZwBLL.MyRoleBLL roleBLL = new ZwBLL.MyRoleBLL();
            ZwEntity.MyRoleEntity roleEntity = new ZwEntity.MyRoleEntity();
            roleEntity.RoleName = txtRoleName.Text;
            roleEntity.RoleRemark = txtRemark.Text;
            if (roleBLL.Add(roleEntity) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加成功');window.parent.location.reload();</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误！')</script>");
            }
        }
    }
}