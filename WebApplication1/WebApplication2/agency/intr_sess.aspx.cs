using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace WebApplication2.agency
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string name = Request.QueryString["name"];

            Session["package_id"] = id;
            Session["package_name"]=name;
            Response.Redirect("edit_package.aspx");
        }
    }
}