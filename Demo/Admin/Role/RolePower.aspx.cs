﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Admin.Role
{
    public partial class RolePower : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindata();
        }
        private void bindata()
        {
            if (string.IsNullOrWhiteSpace(Request["RoleId"]))
                return;
            int id = Convert.ToInt32(Request["RoleId"]);
            ZwBLL.MyRoleBLL roleBLL = new ZwBLL.MyRoleBLL();
            ZwEntity.MyRoleEntity roleEntity =roleBLL.list(id);
           ViewState["RolePowerList"] = roleEntity.RolePowerList;
            Label1.Text = roleEntity.RoleName;
            ZwBLL.MyPowerBLL powerBLL = new ZwBLL.MyPowerBLL();
            string str = "___";
            Repeater1.DataSource=powerBLL.list(str);
            Repeater1.DataBind();
            
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater re = e.Item.FindControl("Repeater2") as Repeater;
            HiddenField hi = e.Item.FindControl("HiddenField2") as HiddenField;
            ZwBLL.MyPowerBLL powerBLL = new ZwBLL.MyPowerBLL();
            string str =  hi.Value+"___";
            re.DataSource = powerBLL.list(str);
            re.DataBind();
        }

        protected void btUpdatePower_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Request["RoleId"]))
                return;
            int id = Convert.ToInt32(Request["RoleId"]);
            ZwBLL.MyRoleBLL roleBLL = new ZwBLL.MyRoleBLL();
            if (roleBLL.Powerup(HiddenField1.Value, id) == 1)
            {
                bindata();
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('未知错误')</script>");
            }
        }
    }
}