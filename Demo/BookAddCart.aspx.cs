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
    public partial class BookAddCart : Demo.Longin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["usr"] == null)
                //    Response.Redirect("~/Login.aspx");
                bindata();
            }
        }
        //绑定数据
        private void bindata()
        {
            int count = 1;
            if (string.IsNullOrWhiteSpace(Request.QueryString["Count"]))
                count = 1;
            else
                if (int.TryParse(Request.QueryString["Count"], out count) == false|| count<=0)
                    count = 1;
            if (string.IsNullOrWhiteSpace(Request.QueryString["BookId"]))
                return;
            if (int.TryParse(Request.QueryString["BookId"], out int i))
            {
                BookInfoBLL infoBLL = new BookInfoBLL();
                BookInfoEntity infoEntity = new BookInfoEntity();
                MemberEntity member = (MemberEntity)Session["usr"];
                BookCartBLL cartBLL = new BookCartBLL();

                infoEntity = infoBLL.list(i);
                if (infoEntity == null)
                    return;
                ContentPlaceHolder1_imgBook.ImageUrl = "~/uploadfile/"+ infoEntity.PicPath;
                lblTitle.Text = "书名：" + infoEntity.BookName;
                lblInfo.Text= "作者："+ infoEntity .BookAuthor + "&nbsp; &nbsp; 出版社："+infoEntity.BookPress + "";
                lblPrice.InnerHtml = "<span style='text-decoration:line-through;'>原价："+(infoEntity.BookPrice* count).ToString().Split('.')[0]+ "元</span>&nbsp;&nbsp;现价："+ ((infoEntity.BookPrice* infoEntity.BookDisCount)* count).ToString("n") + "&nbsp;&nbsp;数量:"+count;

                //加入购物车

                BookCartEntity cartEntity = cartBLL.list(member.MemberId,infoEntity.BookId);
                if (cartEntity != null)
                {
                    cartEntity.BookCount += count;
                    cartBLL.Update(cartEntity);
                }
                else
                {
                    BookCartEntity bookCart = new BookCartEntity();
                    bookCart.MemberId = member.MemberId;
                    bookCart.BookId = infoEntity.BookId;
                    bookCart.BookCount = count;
                    cartBLL.Add(bookCart);
                }
            }

        }

        protected void LinkCaka_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Request.QueryString["BookId"]))
                return;
            Response.Redirect("BookDetail.aspx?BookId="+ Request.QueryString["BookId"]);
        }
    }
}