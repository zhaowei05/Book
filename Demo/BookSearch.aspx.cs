using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwEntity;
using ZwBLL;

namespace Demo
{
    public partial class BookSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    //BookTypeBLL bll = new BookTypeBLL();
            //    //DropDownList1.DataTextField = "TypeName";
            //    //DropDownList1.DataValueField = "TypeId";
            //    //DropDownList1.DataSource = bll.list();
                
            //    //DropDownList1.DataBind();
            //    //DropDownList1.Items.Insert(0, new ListItem("--全部分类--", "0"));
            //}
        }
        //private void bindata()
        //{
        //    int TypeId = 0;
        //    ViewState["TypeId"] = 0;
        //    BookTypeBLL typeBLL = new BookTypeBLL();
        //    BookInfoEntity infoEntity = new BookInfoEntity();
        //    BookInfoBLL infoBLL = new BookInfoBLL();
        //    bool i = int.TryParse(Request.QueryString["TypeId"], out int v);
        //    if (string.IsNullOrWhiteSpace(Request.QueryString["TypeId"])|| Request.QueryString["TypeId"].Equals("0"))
        //    {
        //        Repeater1.DataSource = typeBLL.list(TypeId);
        //        Repeater1.DataBind();
        //        Session["TypeId"] = null;
        //    }
        //    else if ( i== true)
        //    {
        //        TypeId = int.Parse(Request.QueryString["TypeId"]);
        //        BookTypeEntity typeEntity = typeBLL.lists(TypeId);
        //        Repeater1.DataSource = typeBLL.list(typeEntity.ParentId == 0 ? typeEntity.TypeId : typeEntity.ParentId);
        //        Repeater1.DataBind();
        //        ViewState["TypeId"] = typeEntity.TypeId;
        //        Session["TypeId"] = typeEntity.TypeId;
        //        ViewState["TypeName"] = typeEntity.TypeName;
        //        infoEntity.BookType = new BookTypeEntity();
        //        if (typeEntity.ParentId == 0)
        //            infoEntity.SellCount = typeEntity.TypeId;
        //        else
        //            infoEntity.TypeId = typeEntity.TypeId;
        //    }
        //    else
        //    {
        //        TypeId = 0;
        //    }

        //    string key = "";
        //    ViewState["key"] = "";
        //    if (string.IsNullOrWhiteSpace(Request.QueryString["Key"]))
        //    {
        //         key = "";
        //    }
        //    else
        //    {
        //        key = Request.QueryString["Key"];
        //        ViewState["key"] = key;
        //        infoEntity.BookName = key;
        //    }
        //    int count = 0;
        //    Repeater2.DataSource = infoBLL.list(infoEntity,AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize,out count);
        //    Repeater2.DataBind();
        //    AspNetPager1.RecordCount = count;
        //}

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
           // bindata();
        }
    }
}