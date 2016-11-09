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

namespace WebApplication2.agency
{
    public partial class settings : System.Web.UI.Page
    {
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["agency_id"]==null)
            {
                Response.Redirect("default.aspx?m=Login First!!");
            }

            if(Request.QueryString["m"]!=null)
            {
                msg.InnerText = Request.QueryString["m"].ToString();
            }
            id = Session["agency_id"].ToString();
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.openConnection();
            cc.setCommand("select * from users where id=@id");
            cc.setParameter("@id",id);
            SqlDataReader r = cc.getDDLResults();
            r.Read();
            name_lbl.Text = r["firstname"] + " " + r["lastname"];
            username_lbl.Text = r["username"].ToString();
            string temp = r["password"].ToString();
            string pass="";
            for (int i=0;i<temp.Count();i++)
            {
                pass += "*";
            }
            password_lbl.Text = pass;
            contact_lbl.Text = r["contact"].ToString();
            email_lbl.Text = r["email"].ToString();
        }

        protected void b1_Command(object sender, CommandEventArgs e)
        {
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.openConnection();
            if(e.CommandArgument.ToString()=="fname")
            {
                string value = new_fname.Text;
                cc.setCommand("update users set firstname=@fname where Id='"+id+"'");
                cc.setParameter("@fname",value);
            }
            else if (e.CommandArgument.ToString() == "lname")
            {
                string value = new_lname.Text;
                cc.setCommand("update users set lastname=@lname where Id='" + id + "'");
                cc.setParameter("@lname", value);

            }
            else if (e.CommandArgument.ToString() == "uname")
            {
                string value = new_username.Text;
                cc.setCommand("update users set username=@uname where Id='" + id + "'");
                cc.setParameter("@uname", value);

            }
            else if (e.CommandArgument.ToString() == "pass")
            {
                string value = new_password.Text;
                cc.setCommand("update users set password=@pass where Id='" + id + "'");
                cc.setParameter("@pass", value);

            }
            else if (e.CommandArgument.ToString() == "contact")
            {
                string value = new_contact.Text;
                cc.setCommand("update users set contact=@conn where Id='" + id + "'");
                cc.setParameter("@conn", value);

            }
            else if (e.CommandArgument.ToString() == "email")
            {
                string value = new_email.Text;
                cc.setCommand("update users set email=@email where Id='" + id + "'");
                cc.setParameter("@email", value);

            }

            int a = cc.getDMLResults();
            if(a>0)
            {
                Response.Redirect("settings.aspx?m=Changes made Successfully!");
            }
            else
            {
                Response.Redirect("settings.aspx?m=Error occured");
            }
        }
    }
}