using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwDAL;

namespace Demo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ZwDAL.MyPowerDAL dal = new ZwDAL.MyPowerDAL();

            TolistDataFun tolist = new TolistDataFun();
            
            GridView1.DataSource= dal.listMyPower();
            GridView1.DataBind();
        }
    }
}