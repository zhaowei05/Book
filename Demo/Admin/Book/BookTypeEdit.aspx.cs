using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo.Admin.Book
{
    public partial class BookTypeEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindate();
        }
        private void bindate()
        {
            if (string.IsNullOrWhiteSpace(Request["TypeId"]))
                return;
            BookTypeBLL bookType = new BookTypeBLL();
            BookTypeEntity typeEntity = bookType.lists(int.Parse(Request["TypeId"]));
            ViewState["txtName"] = typeEntity.TypeName;
            ViewState["ParentId"] = typeEntity.ParentId;
            ViewState["TypeId"] = typeEntity.TypeId;
        }
    }
}