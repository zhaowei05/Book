using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.Role
{
    public partial class RoleEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }
        private void bindata()
        {
            int id = Convert.ToInt32(Request["RoleId"]);
            ZwBLL.MyRoleBLL roleBLL = new ZwBLL.MyRoleBLL();
            ZwEntity.MyRoleEntity roleEntity = roleBLL.list(id);
            txtRoleName.Text = roleEntity.RoleName;
            txtRemark.Text= roleEntity.RoleRemark;
        }
        protected void btUpdate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request["RoleId"]);
            ZwBLL.MyRoleBLL roleBLL = new ZwBLL.MyRoleBLL();
            ZwEntity.MyRoleEntity roleEntity = roleBLL.list(id);
            roleEntity.RoleName = txtRoleName.Text;
            roleEntity.RoleRemark = txtRemark.Text;
            if(roleBLL.Update(roleEntity)==1)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改成功');window.parent.location.reload();</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误！')</script>");
            }
        }
    }
}