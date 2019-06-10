using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.Self
{
    public partial class InfoEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bidata();
        }
        private void bidata()
        {
            ZwEntity.MyUserEntity myUser = (ZwEntity.MyUserEntity)Session["myuser"];
            ZwBLL.MyUserBLL userBLL = new ZwBLL.MyUserBLL();
            myUser = userBLL.list(myUser.UserId);
            spanAccount.Text = myUser.UserAccount;
            txtRealName.Text = myUser.UserRealName;
            txtPhone.Text = myUser.UserPhone;
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            ZwEntity.MyUserEntity myUser = (ZwEntity.MyUserEntity)Session["myuser"];
            ZwBLL.MyUserBLL userBLL = new ZwBLL.MyUserBLL();
            myUser = userBLL.list(myUser.UserId);
            myUser.UserRealName = txtRealName.Text;
            myUser.UserPhone = txtPhone.Text;
            if(userBLL.Update(myUser)==1)
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改完成')</script>");
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误！')</script>");
            bidata();

        }
    }
}