﻿using System;
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
        public int y;

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