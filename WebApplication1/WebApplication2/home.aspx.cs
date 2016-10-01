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
        public ArrayList ar3;
        public ArrayList ar4;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["username"] != null)
            {
               vtr = (string)Session["username"];
            }
            else
            {
                Response.Redirect("index.aspx?msg=Log in to Continue..");
            }

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


            cc.setCommand("select p_name,p_description,cost_adult,duration,image_id from package_details ");
            SqlDataReader r =cc.getDDLResults();
            ar2 = new ArrayList();
            ar3 = new ArrayList();
            ar4 = new ArrayList();
            while (r.Read())
            {
                ar2.Add(r["p_name"]);
                ar2.Add(r["p_description"]);
                ar2.Add(r["cost_adult"]);
                ar2.Add(r["duration"]);
                ar3.Add(r["image_id"]);
            }
            r.Close();

            for(int k=0;k<ar3.Count;k++)
            {
                cc.setCommand("select data from uploads where Id='"+ ar3[k].ToString()+"'");
                SqlDataReader r2 = cc.getDDLResults();
                r2.Read();
                byte[] bytes = (byte[])r2["data"];
                r2.Close();
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                ar4.Add("data:image/png;base64," + base64String);
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
                Response.Redirect("home.aspx?m=Error Occured!Try Again later!");            }
        }

    }
}