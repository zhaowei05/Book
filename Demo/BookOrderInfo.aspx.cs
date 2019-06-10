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
    public partial class BookOrderInfo : Longin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }
        private void bindata()
        {
            MemberEntity member = (MemberEntity)Session["usr"];
            BookCartBLL cartBLL = new BookCartBLL();
            List<BookCartEntity> list = cartBLL.list(member.MemberId);
            decimal counpic = 0;
            foreach (BookCartEntity item in list)
            {
                if (item.IsSelect == 1)
                    counpic += (item.BookCount * (item.BookInfo.BookPrice * item.BookInfo.BookDisCount));
            }
            txtMemberName.Text = member.MemberName;
            txtPhone.Text = member.MemberPhone;
            txtAddress.Text = member.MemberAddress;
            spanAllMoney.InnerHtml = counpic.ToString("n");
        }

        protected void lbtOrderSubmit_Click(object sender, EventArgs e)
        {
            MemberEntity member = (MemberEntity)Session["usr"];
            BookCartBLL cartBLL = new BookCartBLL();
            List<BookCartEntity> list = cartBLL.list(member.MemberId);
            MyOrderEntity orderEntity = new MyOrderEntity();
            MyOrderBLL orderBLL = new MyOrderBLL();
            OrderDetailEntity orderDetailEntity = new OrderDetailEntity();

            orderEntity.OrderCode = DateTime.Now.ToString("yyyyMMddhhmmss") + member.MemberId;
            orderEntity.MemberId = member.MemberId;
            orderEntity.OrderPeople = txtMemberName.Text;
            orderEntity.OrderPhone = txtPhone.Text;
            orderEntity.OrderAddress = txtAddress.Text;
            decimal counpic = 0;
            foreach (BookCartEntity item in list)
            {
                if (item.IsSelect == 1)
                {
                    counpic += (item.BookCount * (item.BookInfo.BookPrice * item.BookInfo.BookDisCount));
                }
            }
            orderEntity.OrderAllMoney = counpic;
            orderEntity.OrderStatus = 1;
            orderBLL.Add(orderEntity);
            orderEntity = orderBLL.list(orderEntity.OrderCode);
            OrderDetailBLL orderDetailBLL = new OrderDetailBLL();
            foreach (BookCartEntity item in list)
            {
                if (item.IsSelect == 1)
                {
                    orderDetailEntity.OrderId = orderEntity.OrderId;
                    orderDetailEntity.BookId = item.BookId;
                    orderDetailEntity.BookSalePrice = (item.BookInfo.BookPrice * item.BookInfo.BookDisCount);
                    orderDetailEntity.BookSaleCount = item.BookCount;
                    orderDetailBLL.Add(orderDetailEntity);
                    cartBLL.Delete(item.CartId);
                }
            }
            Response.Redirect("~/Member/OrderList.aspx");
        }
    }
}