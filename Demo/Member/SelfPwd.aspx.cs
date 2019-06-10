using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo.Member
{
    public partial class SelfPwd : Longin
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnUpdatePwd_Click(object sender, EventArgs e)
        {
            MemberBLL memberBLL = new MemberBLL();
            MemberEntity meentity = (MemberEntity)Session["usr"];
            meentity = memberBLL.list(meentity.MemberId);
            if (txtConfirmPwd.Text.Equals(meentity.MemberPwd))
            {
                ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('请使用新的密码！')</script>");
                return;
            }
            if (txtOldPwd.Text.Equals(meentity.MemberPwd))
            {
                meentity.MemberPwd = txtConfirmPwd.Text;
                memberBLL.Update(meentity);
                txtOldPwd.Text = "";
                txtNewPwd.Text = "";
                txtConfirmPwd.Text = "";
                ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('密码修改成功！')</script>");
            }
            else
            {
                txtOldPwd.Text = "";
                txtNewPwd.Text = "";
                txtConfirmPwd.Text = "";
                ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('请输入正确的密码！')</script>");
            }
        }
    }
}