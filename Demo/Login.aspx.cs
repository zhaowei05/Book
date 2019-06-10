using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["accou"]!=null)
                    this.txtMemberAcc.Text = Session["accou"].ToString();
            }
        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            MemberBLL bLL = new MemberBLL();
            MemberEntity entity = new MemberEntity();
            entity.MemberAcc = txtMemberAcc.Text;
            entity.MemberPwd = txtMemberPwd.Text;
            entity = bLL.Delu(entity);
            if (entity != null)
            {
                Session["usr"] = entity;
                if (string.IsNullOrWhiteSpace(Request.QueryString["myurl"]))
                {
                    Response.Redirect("Member/OrderList.aspx");
                }
                else
                {
                    Response.Redirect(Request.QueryString["myurl"]);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('用户名或密码错误！')</script>");
            }
        }
    }
}