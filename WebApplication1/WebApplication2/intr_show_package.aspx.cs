using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace WebApplication2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"].ToString() == null)
            {
                Response.Redirect("home.aspx?m=Select a package first!!");
            }
            string m = Request.QueryString["id"].ToString();
            Session["u_package_id"]= m;
            Response.Redirect("show_package.aspx");
             
        }
    }
}