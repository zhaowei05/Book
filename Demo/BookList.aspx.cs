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
    public partial class BookList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }
        private void bindata()
        {
            if (string.IsNullOrWhiteSpace(Request.QueryString["BookList"]))
                return;
            bool i = int.TryParse(Request.QueryString["BookList"],out int a);
            if (i == true)
            {
                BookInfoBLL infoBLL = new BookInfoBLL();
                int count = 0;
                Repeater1.DataSource = infoBLL.Order(a, 1, 24, out count);
                Repeater1.DataBind();
                ViewState["BookList"] = a == 1 ? "销售排行" :a==2? "打折优惠" : "新书上架";
            }
        }
    }
}