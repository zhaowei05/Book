using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.User
{
    public partial class UserEdit : System.Web.UI.Page
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
            ZwBLL.MyUserBLL myUser = new ZwBLL.MyUserBLL();
            int id = int.Parse(Request["UserId"]);
            ZwEntity.MyUserEntity userEntity = new ZwEntity.MyUserEntity();
            userEntity = myUser.list(id);
            ddlRole.SelectedValue = userEntity.RoleId.ToString();
            txtAccount.Text = userEntity.UserAccount;
            txtRealName.Text = userEntity.UserRealName;
            txtPhone.Text = userEntity.UserPhone;
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            ZwBLL.MyUserBLL myUser = new ZwBLL.MyUserBLL();
            int id = int.Parse(Request["UserId"]);
            ZwEntity.MyUserEntity userEntity = myUser.list(id);
            userEntity.RoleId = Convert.ToInt32(ddlRole.SelectedValue);
            if (!txtPwd.Text.Equals(""))
                userEntity.UserPwd = txtPwd.Text;
            userEntity.UserRealName = txtRealName.Text;
            userEntity.UserPhone = txtPhone.Text;
            if (myUser.Update(userEntity) == 1)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改成功');window.parent.location.reload();</script>");
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误')</script>");
        }
    }
}