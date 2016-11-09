using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.SessionState;
using Connect;

namespace WebApplication2
{
    public partial class inquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"]==null)
            {
                Response.Redirect("default.aspx?m=Login First!!");
            }
            
        }

        protected void enq_submit(object sender, EventArgs e)
        {
            string user_id = Session["id"].ToString();
            string loc = location.Text;
            string desc = description.Text;
            string bud = budget.Text;

            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("insert into inquiries(user_id,location,description,budget,status) values(@u,@l,@d,@b,@s)");
            cc.setParameter("@u",user_id);
            cc.setParameter("@l",loc);
            cc.setParameter("@d",desc);
            cc.setParameter("@b",bud);
            cc.setParameter("@s","enquired");
            cc.openConnection();
            int a = cc.getDMLResults();
            if(a>0)
            {
                Response.Redirect("home.aspx?m=Inquiry Saved.Our Agencies will contact you soon!");
            }
            else
            {
                Response.Redirect("home.aspx?m=Failed Execution.Try Again later!!");
            }
        }
    }
}