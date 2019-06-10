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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindata();
                //登录
                if (Session["usr"] != null)
                {
                    MemberEntity entity = (MemberEntity)Session["usr"];
                    spanLogin.InnerHtml = entity.MemberAcc + "会员,您好";
                }
            }
        }
        //数据绑定
        private void bindata()
        {
            BookTypeBLL bll = new BookTypeBLL();
            DropDownList1.DataSource = bll.list(0);
            DropDownList1.DataTextField = "TypeName";
            DropDownList1.DataValueField = "TypeId";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("--全部分类--", "0"));

            Repeater1.DataSource = bll.list(0);
            Repeater1.DataBind();
        }
        //Repeater嵌套
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater re = e.Item.FindControl("Repeater2") as Repeater;
                int id = int.Parse((e.Item.FindControl("HiddenField1") as HiddenField).Value);
                BookTypeBLL bll = new BookTypeBLL();
                re.DataSource = bll.list(id);
                re.DataBind();
            }
        }
        //搜索
        protected void btSearch_Click(object sender, EventArgs e)
        {
            int TypeId = int.Parse(DropDownList1.SelectedValue);
            string Key = txtKey.Text;
            if (Session["TypeId"] != null&&int.Parse(Session["TypeId"].ToString())!=0&& int.Parse(DropDownList1.SelectedValue)==0)
            {
                Response.Redirect("~/BookSearch.aspx?TypeId=" + int.Parse(Session["TypeId"].ToString()) + "&Key=" + Key);
            }
            else
            {
                Response.Redirect("~/BookSearch.aspx?TypeId=" + TypeId + "&Key=" + Key);
            }
        }

        
    }
}