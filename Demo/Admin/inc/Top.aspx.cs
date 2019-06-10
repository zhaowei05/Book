using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.inc
{
    public partial class Top : Longin
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["myuser"] = null;
            Response.Redirect("~/Login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["myuser"] = null;
            Response.Redirect("../../Index.aspx");
        }
    }
}