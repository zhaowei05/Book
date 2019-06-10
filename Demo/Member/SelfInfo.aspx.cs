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
    public partial class SelfInfo : Longin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }
        private void bindata()
        {
            MemberEntity memberEntity = (MemberEntity)Session["usr"];
            MemberBLL memberBLL = new MemberBLL();
            memberEntity = memberBLL.list(memberEntity.MemberId);
            if (memberEntity == null)
                return;
            spanMemberAcc.InnerHtml = memberEntity.MemberAcc;
            spanCode.InnerHtml = memberEntity.MemberCode;
            spanRealName.InnerHtml = memberEntity.MemberName;
            txtMemberPhone.Text = memberEntity.MemberPhone;
            txtAddress.Text = memberEntity.MemberAddress;
            txtMemberMail.Text = memberEntity.MemberMail;

        }

        protected void lbtnUpdateInfo_Click(object sender, EventArgs e)
        {
            MemberEntity memberEntity = (MemberEntity)Session["usr"];
            MemberBLL memberBLL = new MemberBLL();
            memberEntity = memberBLL.list(memberEntity.MemberId);
            if (memberEntity == null)
                return;
            if (memberEntity.MemberPhone.Equals(txtMemberPhone.Text) && memberEntity.MemberAddress.Equals(txtAddress.Text) && memberEntity.MemberMail.Equals(txtMemberMail.Text))
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('请修改内容')</script>");
                return;
            }
            memberEntity.MemberPhone = txtMemberPhone.Text;
            memberEntity.MemberAddress = txtAddress.Text;
            memberEntity.MemberMail = txtMemberMail.Text;
            if (memberBLL.Update(memberEntity) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('信息修改成功!')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改失败！')</script>");
            }
        }
    }
}