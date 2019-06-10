using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.Order
{
    public partial class OrderDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }

        private void bindata()
        {
            if (string.IsNullOrWhiteSpace(Request["OrderId"]))
                return;
            int id = Convert.ToInt32(Request["OrderId"]);
            ZwBLL.OrderDetailBLL detailBLL = new ZwBLL.OrderDetailBLL();
            Repeater1.DataSource = detailBLL.list(id);
            Repeater1.DataBind();
        }
    }
}