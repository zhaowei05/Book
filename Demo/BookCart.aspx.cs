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
    public partial class BookCart :Demo.Longin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                //if (Session["usr"] == null)
                //Response.Redirect("~/Login.aspx");
                //bindata();
            }
        }
        //private void bindata()
        //{
        //    BookCartBLL cartBLL = new BookCartBLL();
        //    MemberEntity member = (MemberEntity)Session["usr"];
        //    List<BookCartEntity> list = cartBLL.list(member.MemberId);
        //    Repeater1.DataSource = list;
        //    Repeater1.DataBind();
        //    var av = from v in list where v.IsSelect == 1 select v;
        //    decimal pacount = 0;
        //    foreach (var item in av)
        //    {
        //        pacount += item.BookCount*(item.BookInfo.BookPrice* item.BookInfo.BookDisCount);
        //    }
        //    spanSumMoney.Text = pacount.ToString("n");
        //}

        //private void delect(int id)
        //{
        //    BookCartBLL cartBLL = new BookCartBLL();
        //    cartBLL.Delete(id);
        //}
        //private void ja(int id)
        //{
        //    BookCartBLL cartBLL = new BookCartBLL();
        //    BookCartEntity cartEntity = cartBLL.lists(id);
        //    cartEntity.BookCount += 1;
        //    cartBLL.Update(cartEntity);
        //}
        //private void jie(int id)
        //{
        //    BookCartBLL cartBLL = new BookCartBLL();
        //    BookCartEntity cartEntity = cartBLL.lists(id);
        //    if (cartEntity.BookCount <= 1)
        //        return;
        //    cartEntity.BookCount -= 1;
        //    cartBLL.Update(cartEntity);
        //}
        //private void xerg(int id)
        //{
        //    BookCartBLL cartBLL = new BookCartBLL();
        //    BookCartEntity cartEntity = cartBLL.lists(id);
        //    int i = cartEntity.IsSelect == 1 ?0:1;
        //    cartEntity.IsSelect = i;
        //    cartBLL.Update(cartEntity);
        //}
        //private void counts(int id,int count)
        //{
        //    BookCartBLL cartBLL = new BookCartBLL();
        //    BookCartEntity cartEntity = cartBLL.lists(id);
        //    cartEntity.BookCount = count;
        //    cartBLL.Update(cartEntity);
        //}

        ////全选
        ////protected void checkAll_CheckedChanged(object sender, EventArgs e)
        ////{
        ////    BookCartBLL cartBLL = new BookCartBLL();
        ////    MemberEntity member = (MemberEntity)Session["usr"];
        ////    List<BookCartEntity> cartEntity = cartBLL.list(member.MemberId);
        ////    var icv = from ic in cartEntity where ic.IsSelect == 0 select ic;
        ////    if (checkAll.Checked == true)
        ////    {
        ////        foreach (var item in icv)
        ////        {
        ////            xerg(item.CartId);
        ////        }
        ////    }
        ////    else
        ////    {
        ////        if (icv.Count()==0)
        ////            foreach (BookCartEntity item in cartEntity)
        ////            {
        ////                xerg(item.CartId);
        ////            }

        ////    }
        ////    bindata();
        ////}
        //protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    int id = int.Parse((e.Item.FindControl("HiddenField1") as HiddenField).Value);
        //    if (e.CommandName.Equals("xerg"))
        //    {
        //        xerg(id);
        //    }
        //    if (e.CommandName.Equals("jie"))
        //    {
        //        jie(id);
        //    }
        //    if (e.CommandName.Equals("ja"))
        //    {
        //        ja(id);
        //    }
        //    if (e.CommandName.Equals("delete"))
        //    {
        //        delect(id);
        //    }
        //    if (e.CommandName.Equals("text"))
        //    {
        //        int count = int.Parse((e.Item.FindControl("TextBox1")  as TextBox).Text);
        //        if (count >= 0)
        //            return;
        //        counts(id, count);
        //    }
        //    bindata();
        //}

        //protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        //{
        //    RepeaterCommandEventArgs e1 = new RepeaterCommandEventArgs(((CheckBox)sender).NamingContainer as RepeaterItem, sender, new CommandEventArgs("xerg", null));
        //    Repeater1_ItemCommand(Repeater1, e1);
        //}

        //protected void TextBox1_TextChanged(object sender, EventArgs e)
        //{
        //    RepeaterCommandEventArgs e1 = new RepeaterCommandEventArgs(((TextBox)sender).NamingContainer as RepeaterItem, sender, new CommandEventArgs("text", null));
        //    Repeater1_ItemCommand(Repeater1, e1);
        //}
    }
}