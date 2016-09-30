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

namespace WebApplication2.admin
{
    public partial class index_admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login_btn_Click(object sender, EventArgs e)
        {
            string username = uname.Text;
            string password = passwd.Text;

            string constr = WebConfigurationManager.ConnectionStrings["table"].ConnectionString;

            SqlConnection conn = new SqlConnection(constr);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandText = "select * from users where username=@u and password=@p and type='ADMIN'";
            cmd.Parameters.AddWithValue("@u", username);
            cmd.Parameters.AddWithValue("@p", password);

            SqlDataReader rdr;
            conn.Open();
            rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                Session["username"] = rdr["username"];
                Session["password"] = rdr["password"];
                Session["type"] = rdr["type"];
                Session["id"] = rdr["id"];
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Redirect("admin_loginpage.aspx?msg=Wrong Credentials!");
            }
        }
    }
}