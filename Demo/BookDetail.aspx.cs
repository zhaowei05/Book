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
    public partial class BookDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }
        private void bindata()
        {
            BookInfoBLL bll = new BookInfoBLL();
            BookInfoEntity entity = new BookInfoEntity();
            bool i = int.TryParse(Request.QueryString["BookId"], out int x);
            if (string.IsNullOrWhiteSpace(Request.QueryString["BookId"]))
                return;
            else if (i == true)
            {
                entity = bll.list(int.Parse(Request.QueryString["BookId"]));
                if (entity != null)
                {
                    ViewState["Bookid"] = entity.BookId;
                    Image1.ImageUrl = "uploadfile/" + entity.PicPath;
                    lblname.Text = entity.BookName;
                    lblPrice.Text = entity.BookPrice.ToString().Split('.')[0];
                    lblDis.Text = (decimal.Parse(entity.BookPrice.ToString()) * decimal.Parse(entity.BookDisCount.ToString())).ToString("n");
                    lblAuthor.Text = entity.BookAuthor;
                    lblPress.Text = entity.BookPress;
                    lblRemark.Text = entity.BookRemark;
                }
            }
            else { } 
        }
    }
}