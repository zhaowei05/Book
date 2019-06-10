using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo
{
    public class Longin: System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (this.Request.Path.Contains("Admin"))
            {
                if (this.Request.Path.Contains("Login") || this.Request.Path.Contains("Vesbtext"))
                    return;
                if (Session["myuser"] == null)
                {
                    returnkd();
                }
                else
                {
                    if (this.Request.Path.Contains("inc"))
                        return;
                    ZwEntity.MyUserEntity myUser = (ZwEntity.MyUserEntity)Session["myuser"];
                    ZwBLL.MyUserBLL userBLL = new ZwBLL.MyUserBLL();
                    myUser = userBLL.list(myUser.UserId);
                    string stry = "";
                    if (!string.IsNullOrWhiteSpace(myUser.UserPowerList))
                        stry += myUser.UserPowerList;
                    if (!string.IsNullOrWhiteSpace(myUser.UserPowerList) && !string.IsNullOrWhiteSpace(myUser.Role.RolePowerList))
                        stry += ",";
                    if (!string.IsNullOrWhiteSpace(myUser.Role.RolePowerList))
                        stry += myUser.Role.RolePowerList;
                    string[] arr = stry.Split(',');
                    if (this.Request.Path.Contains("Book") && !qeix(arr, "002"))
                        returnkd();
                    if (this.Request.Path.Contains("Member") && !qeix(arr, "001"))
                        returnkd();
                    if (this.Request.Path.Contains("Order") && !qeix(arr, "003"))
                        returnkd();
                    if (this.Request.Path.Contains("Self") && !qeix(arr, "998"))
                        returnkd();
                    if (this.Request.Path.Contains("User") && !qeix(arr, "999"))
                        returnkd();
                    if (this.Request.Path.Contains("Role") && !qeix(arr, "999"))
                        returnkd();
                }
                return;
            }
            if (Session["usr"] == null)
            {
                
                if (Request["web"] != null&&Request["web"].Equals("BookSearch"))
                {
                    return;
                }
                if (this.Request.Path.Contains("Myrespson"))
                {
                    this.Response.Redirect("~/Login.aspx");
                }
                else
                    this.Response.Redirect("~/Login.aspx?myurl=" + this.Request.Path);
                
            }
            base.OnPreInit(e);
        }

        public bool qeix(string[] arr,string str)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                if (arr[i].Equals(str))
                {
                    return true;
                }
            }
            return false;
        }

        private void returnkd()
        {
            Session["myusr"] = null;
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
}