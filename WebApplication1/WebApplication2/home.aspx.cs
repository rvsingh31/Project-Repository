using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["username"] != null)
            {
                u_lbl.Text = (string)Session["username"];
            }
            else
            {
                Response.Redirect("index.aspx?msg=Log in to Continue..");
            }
        }
    }
}