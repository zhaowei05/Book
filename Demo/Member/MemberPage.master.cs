using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Member
{
    public partial class MemberPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["usr"] == null)
                    Response.Redirect("~/Login.aspx");
            }
        }

        protected void LinkEnd_Click(object sender, EventArgs e)
        {
            Session["usr"] = null;
            Response.Redirect("~/Login.aspx");
        }
    }
}