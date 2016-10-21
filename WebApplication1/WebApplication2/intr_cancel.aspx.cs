using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Connect;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.SessionState;
namespace WebApplication2
{
    public partial class intr_cancel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string view_str="";
            if(Request.QueryString["view"]!=null)
            {
                view_str = Request.QueryString["view"].ToString();
            }
            string p_id = Request.QueryString["p_id"];
            Session["cancel_package_id"]=p_id;

            if(view_str!="yes")
            {
                Session["cancel"] = "yes";
            }
            Response.Redirect("view.aspx");
        }
    }
}