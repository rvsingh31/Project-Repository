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

            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select * from users where username = @e");
            cc.setParameter("@e",vtr);
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
        }

    }
}