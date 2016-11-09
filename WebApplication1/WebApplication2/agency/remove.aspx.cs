using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Web.SessionState;
using Connect;
using System.Collections;


namespace WebApplication2.agency
{
    public partial class remove : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && Session["agency_id"] != null)
            {
                ConnectClass cc = new ConnectClass();
                cc.setConnection();
                cc.openConnection();
                cc.setCommand("delete from package_details where p_id=@pid");
                cc.setParameter("@pid",Request.QueryString["id"].ToString());
                int a= cc.getDMLResults();
                   if(a>0)
                {
                    Response.Redirect("a_home.aspx?m=Package Removed!");
                }
                   else
                {
                    Response.Redirect("a_home.aspx?m=Error Occured!Try again later");
                }
            }
            else
            {
                Response.Redirect("index.aspx?m=Error Occured.");
            }
        }
    }
}