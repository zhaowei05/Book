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
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindata(); 
            }
        }
        private void bindata()
        {
            BookInfoBLL infobll = new BookInfoBLL();
            int count = 0;
            //销售数量TOP
            RepeSellCount.DataSource = infobll.Order(1, 1, 2, out count);
            RepeSellCount.DataBind();
            //折扣TOP
            RepeBookDisCount.DataSource = infobll.Order(2, 1, 2, out count);
            RepeBookDisCount.DataBind();
            //新书上架TOP
            RepeBookId.DataSource = infobll.Order(3, 1, 6, out count);
            RepeBookId.DataBind();
            //计算机与互联网TOP
            BookInfoEntity bookentity = new BookInfoEntity();
            bookentity.BookType = new BookTypeEntity();
            bookentity.SellCount = 1;
            RepeFulew.DataSource = infobll.list(bookentity, 1, 12, out count);
            RepeFulew.DataBind();
            //文学TOP
            bookentity.SellCount = 6;
            RepeWexue.DataSource = infobll.list(bookentity, 1, 12, out count);
            RepeWexue.DataBind();
        }
    }
}