using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using Connect;
using System.Data.SqlClient;
using System.Data.SqlTypes;
namespace WebApplication2.agency
{
    public partial class refund : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"]==null)
            {
                Response.Redirect("index.aspx?m=Login to Continue..");
            }

            if (Request.QueryString["p_id"] != null && Request.QueryString["user_id"] != null) 
            {
                string p_id = Request.QueryString["p_id"].ToString();
                string user_id = Request.QueryString["user_id"].ToString();

                ConnectClass cc = new ConnectClass();
                cc.setConnection();
                cc.setCommand("delete from booked_packages where p_id="+p_id+" and user_id="+user_id);
                cc.openConnection();
                int i = cc.getDMLResults();
                if (i > 0)
                {
                    Response.Redirect("a_home.aspx?m=Refund Completed!");
                }

            }
            else
            {
                Response.Redirect("a_home.aspx?m=Select a package to delete!");
            }
        }
    }
}