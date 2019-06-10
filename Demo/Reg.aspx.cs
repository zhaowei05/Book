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
    public partial class Reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        #region 检查用户名是否重名
        public bool bokaccto()
        {
            MemberBLL bll = new MemberBLL();
            if (string.IsNullOrWhiteSpace(this.txtMemberAcc.Text))
                return false;
            return  bll.list(this.txtMemberAcc.Text)==0?true:false;
        }
        #endregion

        protected void txtMemberAcc_TextChanged(object sender, EventArgs e)
        {
            string li = bokaccto().ToString().ToLower();
            if (li.Equals("false"))
            {
                this.accInfo.InnerHtml = "<span style='color:red'>账号已被占用!</span>";
            }
            else
            {
                this.accInfo.InnerHtml = "";
            }
            ViewState["lii"] = li;
        }

        protected void lbtnReg_Click(object sender, EventArgs e)
        {
            MemberBLL bll = new MemberBLL();
            MemberEntity member = new MemberEntity();
            member.MemberAcc = txtMemberAcc.Text;
            member.MemberPwd = txtConfirmPwd.Text;
            member.MemberCode = txtMemberCode.Text;
            member.MemberName = txtMemberName.Text;
            member.MemberPhone = txtMemberPhone.Text;
            member.MemberAddress = txtAddress.Text;
            member.MemberMail = txtMemberMail.Text;
            if (bll.Add(member) == 1)
            {
                Session["accou"] = member.MemberAcc;
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('注册成功！');window.location.href = 'Login.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误！');</script>");
            }
        }
    }
}