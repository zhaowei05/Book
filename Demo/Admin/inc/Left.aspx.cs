using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZwBLL;
using ZwEntity;

namespace Demo.Admin.inc
{
    public partial class Left : Longin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }
        private void bindata()
        {
            MyUserEntity myUserEntity = (MyUserEntity)Session["myuser"];
            MyUserBLL userBLL = new MyUserBLL();
            myUserEntity = userBLL.list(myUserEntity.UserId);
            string stry = "";
            if (!string.IsNullOrWhiteSpace(myUserEntity.UserPowerList))
                stry += myUserEntity.UserPowerList;
            if (!string.IsNullOrWhiteSpace(myUserEntity.UserPowerList) && !string.IsNullOrWhiteSpace(myUserEntity.Role.RolePowerList))
                stry += ",";
            if (!string.IsNullOrWhiteSpace(myUserEntity.Role.RolePowerList))
                stry += myUserEntity.Role.RolePowerList;
            string[] koo = stry.Split(',');
            ViewState["koo"] = koo;
            MyPowerBLL myPower = new MyPowerBLL();
            List<MyPowerEntity> powerEntity= myPower.list("___");
            List<MyPowerEntity> mies = new List<MyPowerEntity>();

            for (int i = 0; i < powerEntity.Count; i++)
            {
                for (int j = 0; j < koo.Length; j++)
                {
                    if (powerEntity[i].PowerId.Equals(koo[j]))
                    {
                        mies.Add(powerEntity[i]);
                        break;
                    }
                }
            }
            Repeater1.DataSource = mies;
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string[] koo = (string[])ViewState["koo"];
            HiddenField hi = e.Item.FindControl("HiddenField1") as HiddenField;
            Repeater re = e.Item.FindControl("Repeater2") as Repeater;
            MyPowerBLL myPower = new MyPowerBLL();
            List<MyPowerEntity> powerEntity = myPower.list(hi.Value+"___");
            List<MyPowerEntity> mies = new List<MyPowerEntity>();
            for (int i = 0; i < powerEntity.Count; i++)
            {
                for (int j = 0; j < koo.Length; j++)
                {
                    if (powerEntity[i].PowerId.Equals(koo[j]))
                    {
                        mies.Add(powerEntity[i]);
                        break;
                    }
                }
            }
            re.DataSource = mies;
            re.DataBind();
        }
    }
}