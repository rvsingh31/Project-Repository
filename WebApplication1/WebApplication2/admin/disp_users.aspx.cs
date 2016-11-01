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
    public partial class disp_users : System.Web.UI.Page
    {
        public string user_info, id;
        public string agencies, uname, booked_pack;
        public SqlDataReader r, r1, r2, r3;
        public int count = 0;
        public ArrayList ar1;
        public ArrayList ar2, ar3, ar4, ar5;
        public int q, k = 0;
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

            if (Request.QueryString["id"] != null)
            {
                id = Request.QueryString["id"];
                uname = Request.QueryString["uname"];
                uname_lbl.Text = Request.QueryString["uname"];
            }
            else
            {
                Response.Redirect("a_home.aspx?m=ID is not properly set.");
            }

            string str2 = Request.QueryString["m"];

            if (!string.IsNullOrEmpty(str2))
            {
                error_lbl.Text = str2;
            }


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

            cc.setCommand("select firstname,lastname,contact,email from users where Id=@user_id ");
            cc.setParameter("@user_id", id);
            SqlDataReader r1 = cc.getDDLResults();

            try
            {
                while (r1.Read())
                {
                    full_lbl.Text = (string)r1["firstname"] + ' ' + (string)r1["lastname"];
                    contact_lbl.Text = (string)r1["contact"];
                    mail_lbl.Text = (string)r1["email"];
                }
            }
            catch
            {

            }
            r1.Close();
            cc.setCommand(" select p_name,booked_packages.p_id,eticket_id from package_details join booked_packages on (package_details.p_id=booked_packages.p_id) where user_id=@id ");
            cc.setParameter("@id", id);
            SqlDataReader r2 = cc.getDDLResults();
            try
            {
                if (r2.HasRows)
                {
                    booked_pack = "Some packages to show";
                    ar3 = new ArrayList();
                    ar4 = new ArrayList();
                    ar5 = new ArrayList();
                    while (r2.Read())
                    {
                        ar3.Add(r2["p_name"]);
                        ar4.Add(r2["p_id"]);
                        ar5.Add(r2["eticket_id"]);
                    }
                }
                else
                {
                    booked_pack = "";
                }
            }
            catch
            { }
            r2.Close();




        }
    }
}