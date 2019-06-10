using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.User
{
    public partial class UserAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }

        private void bindata()
        {
            ZwBLL.MyRoleBLL myRole = new ZwBLL.MyRoleBLL();
            ddlRole.DataTextField = "RoleName";
            ddlRole.DataValueField = "RoleId";
            ddlRole.DataSource = myRole.list();
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, new ListItem("--请选择--", "0"));
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            ZwBLL.MyUserBLL myUser = new ZwBLL.MyUserBLL();
            ZwEntity.MyUserEntity myUserEntity = new ZwEntity.MyUserEntity();
            myUserEntity.RoleId = int.Parse(ddlRole.SelectedValue);
            myUserEntity.UserAccount = txtAccount.Text;
            myUserEntity.UserPwd = txtPwd.Text;
            myUserEntity.UserRealName = txtRealName.Text;
            myUserEntity.UserPhone = txtPhone.Text;
            if (myUser.Add(myUserEntity) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('添加成功');window.parent.location.reload();</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误')</script>");
            }
        }
    }
}