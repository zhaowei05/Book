using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Compilation;
using System.Web.SessionState;
using System.Web.UI;

namespace Demo.App_Code
{
    public class Handler : IHttpHandler,IRequiresSessionState
    {
        public bool IsReusable
        {
            get
            {
                return true;
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            HttpSessionState httpSession = context.Session;
            if (httpSession["usr"] != null)
            {
                
                //context.Server.Transfer(BuildManager.CreateInstanceFromVirtualPath(context.Request.Path, typeof(Page)) as IHttpHandler, false);
                
            }
            else
            {
                context.Response.Redirect("~/Login.aspx?myurl=" + context.Request.Path);
            }
        }
    }
}