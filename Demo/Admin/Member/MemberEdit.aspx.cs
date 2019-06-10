using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.Member
{
    public partial class MemberEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }

        private void bindata()
        {
            int id = 0;
            if (string.IsNullOrWhiteSpace(Request["MemberId"]))
                return;
            id = Convert.ToInt32(Request["MemberId"]);
            ZwBLL.MemberBLL member = new ZwBLL.MemberBLL();
            ZwEntity.MemberEntity entity = member.list(id);
            spanAccount.InnerHtml = entity.MemberAcc;
            txtMemberPwd.Text = "";
            txtCode.Text = entity.MemberCode;
            txtRealName.Text = entity.MemberName;
            txtPhone.Text = entity.MemberPhone;
            txtAddress.Text = entity.MemberAddress;
            txtMail.Text = entity.MemberMail;
        }

        protected void lbtnReg_Click(object sender, EventArgs e)
        {
            int id = 0;
            if (string.IsNullOrWhiteSpace(Request["MemberId"]))
                return;
            id = Convert.ToInt32(Request["MemberId"]);
            ZwBLL.MemberBLL member = new ZwBLL.MemberBLL();
            ZwEntity.MemberEntity entity = member.list(id);
            if (!txtMemberPwd.Text.Equals(""))
                entity.MemberPwd = txtMemberPwd.Text;
            entity.MemberCode= txtCode.Text;
            entity.MemberName = txtRealName.Text;
            entity.MemberPhone= txtPhone.Text ;
            entity.MemberAddress= txtAddress.Text;
            entity.MemberMail= txtMail.Text;
            if (member.Update(entity) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('修改成功');window.parent.location.reload();</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误')</script>");
            }
        }
    }
}