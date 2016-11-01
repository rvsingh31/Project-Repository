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
using System.Collections;
using Connect;

namespace WebApplication2.admin
{
    public partial class ag_reg_pack : System.Web.UI.Page
    {
        public string packages;
        public string users;
        public string a_id;
        public string name;
        public SqlDataReader r;
        public int count = 0;
        public ArrayList ar1;
        public ArrayList ar2, ar3, ar4;
        public int q;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                a_lbl.Text = (string)Session["username"];
         
            }
            else
            {
                Response.Redirect("admin_loginpage.aspx?msg=Log in to Continue..");
            }

            if(Request.QueryString["m"]!=null)
            {
                error_lbl.Text = Request.QueryString["m"].ToString();
            }

            int i = Int32.Parse(Session["id"].ToString());

            if (Request.QueryString["id"] != null)
            {
               a_id = Request.QueryString["id"].ToString();
                ag_name_lbl.Text = Request.QueryString["name"];

            }
            else
            {
                Response.Redirect("a_home.aspx?m=ID is not properly set.");
            }
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.openConnection();
            cc.setCommand("select p_id,p_name from package_details where a_id=@a_id");
            cc.setParameter("@a_id",a_id);
            SqlDataReader r2 = cc.getDDLResults();
            packages = "";
                ar1 = new ArrayList();
                ar2 = new ArrayList();
                while (r2.Read())
                {
                     packages = "Some packages to show!";

                     ar1.Add(r2["p_name"]);

                    ar2.Add(r2["p_id"]);

                }
            
            r2.Close();
            
          
        }
    }
}