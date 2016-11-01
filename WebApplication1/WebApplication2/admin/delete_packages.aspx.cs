using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Web.SessionState;
using Connect;
using System.Collections;
using System;

namespace WebApplication2.admin
{
    public partial class delete_packages : System.Web.UI.Page
    {
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                id = Request.QueryString["id"];
            }
            else
            {
                Response.Redirect("a_home.aspx?m=ID is not properly set.");
            }
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("delete from package_details where p_id=@id");
            cc.setParameter("@id", id);
            cc.openConnection();
            int ad = cc.getDMLResults();
            if (ad > 0)
            {
                Response.Redirect("a_home.aspx?m=Package deleted successfully!");

            }
            else
            {
                Response.Redirect("a_home.aspx?m=Error Occured ! Try again later!");
            }
        }
    }
}