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

namespace WebApplication2.admin
{
    public partial class a_home : System.Web.UI.Page
    {
        public string users;
        public string agencies;
        public SqlDataReader r, r1;
        public int count = 0;
        public ArrayList ar1;
        public ArrayList ar2, ar3, ar4, ar5;
        public int q;
        public string a_name;
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

            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select * from agency_details");
            cc.openConnection();
            SqlDataReader r = cc.getDDLResults();
            if (r.HasRows)
            {
                agencies = "Some agencies to show!";
                ar1 = new ArrayList();
                ar2 = new ArrayList();
                while (r.Read())
                {
                    ar1.Add(r["a_name"]);

                    ar2.Add(r["a_id"]);


                }
            }
            else
            {
                agencies = "";
            }
            r.Close();
            string type = (string)Session["type"];
            cc.setCommand("select * from users where type!=@type");
            cc.setParameter("@type", type);
            SqlDataReader r2 = cc.getDDLResults();
            if (r2.HasRows)
            {
                users = "Some users to show!";
                ar3 = new ArrayList();
                ar4 = new ArrayList();
                ar5 = new ArrayList();
                while (r2.Read())
                {
                    ar3.Add(r2["username"]);
                    ar4.Add(r2["Id"]);
                    ar5.Add(r2["type"]);
                }
            }
            else
            {
                users = "";
            }
            r2.Close();
        }
    }
}