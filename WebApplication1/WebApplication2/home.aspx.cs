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
using System.Collections;


namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public string vtr;
        public ArrayList ar;
        public string msg;
        public int count = 0;
        public ArrayList ar2;
        public ArrayList ar3,ar4,ar5;
        public int y, sess_id;

        protected void searchb_click(object sender,EventArgs e)
        {
            string s = search_input.Text;
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select package_details.p_id,package_details.p_name,package_details.p_description,package_details.cost_adult,package_details.duration,uploads.data from package_details join uploads on (package_details.image_id=uploads.Id) where package_details.p_id in ((select p_id from package_details where p_name like '%"+s+"%' ) union (select p_id from package_details where p_description like '%"+s+"%' ))");
            cc.openConnection();
            SqlDataReader r1 = cc.getDDLResults();
                while (r1.Read())
                {
                    ar3.Add(r1["p_id"]);
                    ar3.Add(r1["p_name"]);
                    ar3.Add(r1["p_description"]);
                    ar3.Add(r1["cost_adult"]);
                    ar3.Add(r1["duration"]);
                    byte[] bytes = (byte[])r1["data"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    ar3.Add("data:image/png;base64," + base64String);
                }
                r1.Close();

            cc.closeConnection();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["username"] != null)
            {
               vtr = (string)Session["username"];
                sess_id =Int32.Parse(Session["id"].ToString());
            }
            else
            {
                Response.Redirect("index.aspx?msg=Log in to Continue..");
            }
            ar3 = new ArrayList();
                msg=Request.QueryString["m"];
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select * from users where id = @e");
            cc.setParameter("@e",Session["id"].ToString());
            cc.openConnection();
            SqlDataReader rdr = cc.getDDLResults();
            rdr.Read();
            ar = new ArrayList();
            string n = rdr["firstname"].ToString() + " " + rdr["lastname"].ToString();
            string p = rdr["password"].ToString();
            int i=p.Length;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            for (int j=0;j<i;j++)
            {
                sb.Append("*");
            }
            ar.Add(n);
            ar.Add(rdr["username"].ToString());
            ar.Add(sb);
            ar.Add(rdr["contact"].ToString());
            ar.Add(rdr["email"].ToString());
            rdr.Close();


            cc.setCommand("select package_details.p_id,package_details.p_name,package_details.p_description,package_details.cost_adult,package_details.duration,uploads.data from package_details join uploads on (package_details.image_id=uploads.Id)");
            SqlDataReader r =cc.getDDLResults();
            ar2 = new ArrayList();
            while (r.Read())
            {
                ar2.Add(r["p_id"]);
                ar2.Add(r["p_name"]);
                ar2.Add(r["p_description"]);
                ar2.Add(r["cost_adult"]);
                ar2.Add(r["duration"]);
                byte[] bytes = (byte[])r["data"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                ar2.Add("data:image/png;base64," + base64String);
            }
            r.Close();

            string today = System.DateTime.Today.ToString();
            today.Split('/');
            int c_m = (Int32.Parse(today[0].ToString()) * 10) + Int32.Parse(today[1].ToString());
            int c_d = (Int32.Parse(today[3].ToString()) * 10) + Int32.Parse(today[4].ToString());
            cc.setCommand("select p_name,p_id,expiry_date from package_details where p_id in (select p_id from booked_packages where user_id=@p and status=@st)");
            cc.setParameter("@p",Session["id"].ToString());
            cc.setParameter("@st","booked");
            SqlDataReader rw = cc.getDDLResults();
            ar4 = new ArrayList();
            while (rw.Read())
            {
                ar4.Add(rw["p_id"].ToString());
                ar4.Add(rw["p_name"].ToString());
               string exp_date = rw["expiry_date"].ToString();
                exp_date.Split('/');
                int d = (Int32.Parse(exp_date[0].ToString()) * 10) + Int32.Parse(exp_date[1].ToString());
                int m = (Int32.Parse(exp_date[3].ToString()) * 10) + Int32.Parse(exp_date[4].ToString());

                if ((m - c_m) < 1)
                {
                    ar4.Add("display:none");
                }
                else
                {
                    ar4.Add("");
                }
            }

            rw.Close();

            cc.setCommand("select p_name,p_id from package_details where p_id in (select p_id from booked_packages where user_id=@pd and status=@st2)");
            cc.setParameter("@pd",Session["id"].ToString());
            cc.setParameter("@st2","cancelled");
            SqlDataReader rw2 = cc.getDDLResults();
            ar5 = new ArrayList();
            while (rw2.Read())
            {
                ar5.Add(rw2["p_name"].ToString());
                ar5.Add(rw2["p_id"].ToString());
                
            }
            rw2.Close();

            cc.setCommand("select p_name,package_details.p_id from package_details join starred on (package_details.p_id=starred.p_id) where user_id ="+Session["id"].ToString());
            SqlDataReader rw3 = cc.getDDLResults();
            while(rw3.Read())
            {
                starred_div.InnerHtml+= "<a href='intr_show_package?id="+rw3["p_id"]+"' class='collection-item'>"+rw3["p_name"]+"</a>";
            }

        }

        protected void Changes(object sender,CommandEventArgs e)
        {
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            string v1, v2;
           if(e.CommandArgument.ToString()=="name")
            {
                v1 = fname_input.Text;
                v2 = lname_input.Text;
                cc.setCommand("update users set firstname=@v1 ,lastname=@v2 where id=@id");
                cc.setParameter("@v1",v1);
                cc.setParameter("@v2",v2);
                cc.setParameter("@id", Session["id"].ToString());
            }
           else if (e.CommandArgument.ToString() == "username")
            {
                v1 = username_input.Text;
                cc.setCommand("update users set username=@v1 where id=@id");
                cc.setParameter("@v1", v1);
                cc.setParameter("@id", Session["id"].ToString());

            }
            else if (e.CommandArgument.ToString() == "password")
            {
                v1 = password_input.Text;
                cc.setCommand("update users set password=@v1 where id=@id");
                cc.setParameter("@v1", v1);
                cc.setParameter("@id", Session["id"].ToString());

            }
            else if (e.CommandArgument.ToString() == "contact")
            {
                v1 = contact_input.Text;
                cc.setCommand("update users set contact=@v1 where id=@id");
                cc.setParameter("@v1", v1);
                cc.setParameter("@id", Session["id"].ToString());

            }
            else if (e.CommandArgument.ToString() == "email")
            {
                v1 = email_input.Text;
                cc.setCommand("update users set email=@v1 where id=@id");
                cc.setParameter("@v1", v1);
                cc.setParameter("@id", Session["id"].ToString());

            }
            cc.openConnection();

            int a = cc.getDMLResults();
            if(a>0)
            {
                Response.Redirect("home.aspx?m=Changes made successfully");
            }
            else
            {
                Response.Redirect("home.aspx?m=Error Occured!Try Again later!");
            }
        }

    }
}