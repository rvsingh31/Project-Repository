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

namespace WebApplication2.admin
{
    public partial class admin_loginpage : System.Web.UI.Page
    {
        public string ms;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["msg"]!=null)
            {
                ms = Request.QueryString["msg"].ToString();
                hidden_lbl.Text = ms;
            }
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            string username = uname.Text;
            string password = passwd.Text;
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.openConnection();
            cc.setCommand("select * from users where username=@u and password=@p and type='ADMIN'");
            cc.setParameter("@u", username);
            cc.setParameter("@p", password);

           SqlDataReader rdr = cc.getDDLResults();

            if (rdr.Read())
            {
                Session["username"] = rdr["username"];
                Session["password"] = rdr["password"];
                Session["type"] = rdr["type"];
                Session["id"] = rdr["id"];
                Response.Redirect("a_home.aspx");
            }
            else
            {
                Response.Redirect("admin_loginpage.aspx?msg=Wrong Credentials!");
            }
        }
    }
}