using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            if (!txtValidate.Text.ToLower().Equals(Session["chek"].ToString().ToLower()))
            {
                ClientScript.RegisterStartupScript(GetType(),"", "<script>alert('验证码输入错误！')</script>");
                return;
            }
            MyUserEntity userEntity = new MyUserEntity();
            MyUserBLL userBLL = new MyUserBLL();
            userEntity.UserAccount = txtAccount.Text;
            userEntity.UserPwd = txtPwd.Text;
            userEntity = userBLL.Delu(userEntity);
            if (userEntity != null)
            {
                Session["myuser"] = userEntity;
                Response.Redirect("inc/Main.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('用户名或密码错误！')</script>");
                return;
            }
        }
    }
}