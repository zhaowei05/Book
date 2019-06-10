using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo.Admin.Role
{
    public partial class RoleList : Longin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }
        private void bindata()
        {
            MyRoleBLL roleBLL = new MyRoleBLL();
            Repeater1.DataSource=roleBLL.list();
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("delete"))
            {
                HiddenField hi = e.Item.FindControl("HiddenField1") as HiddenField;
                MyRoleBLL roleBLL = new MyRoleBLL();
                if (roleBLL.Delete(int.Parse(hi.Value))==1)
                {
                    ClientScript.RegisterStartupScript(GetType(), "", " <script>alert('删除成功！')</script>");
                }
                else
                {
                    return;
                }
            }
            bindata();
        }
    }
}