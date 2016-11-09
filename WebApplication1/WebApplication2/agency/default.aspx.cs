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
using System.Net.Mail;
using System.Net;
using System.IO;


namespace WebApplication2.agency
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string str = Request.QueryString["msg"];
            if (!string.IsNullOrEmpty(str))
            {
                hidden_lbl.Text = str;
            }

            string str2 = Request.QueryString["m"];

            if (!string.IsNullOrEmpty(str2))
            {
                register_lbl_hidden.Text = str2;
            }



        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            string username = uname.Text;
            string password = passwd.Text;

            string constr = WebConfigurationManager.ConnectionStrings["database"].ConnectionString;

            SqlConnection conn = new SqlConnection(constr);

            SqlCommand cmd = new SqlCommand();

            cmd.Connection = conn;

            cmd.CommandText = "select * from users where username=@u and password=@p and type='AGENCY'";
            cmd.Parameters.AddWithValue("@u", username);
            cmd.Parameters.AddWithValue("@p", password);

            SqlDataReader rdr;
            conn.Open();

            rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                Session["username"] = rdr["username"];
                Session["type"] = rdr["type"];
                Session["agency_id"] = rdr["id"];
                Response.Redirect("a_home.aspx");
            }
            else
            {
                Response.Redirect("default.aspx?msg=Wrong Credentials!");
            }
        }

        protected void register_btn_Click(object sender, EventArgs e)
        {
            string r_fname = fname.Text;
            string r_lname = lname.Text;
            string r_uname = uname_r.Text;
            string r_pass = pass.Text;
            string r_contact = contact.Text;
            string r_mail = mail.Text;

            string constr = WebConfigurationManager.ConnectionStrings["database"].ConnectionString;

            SqlConnection conn = new SqlConnection(constr);



            string sql_ins = "insert into users(firstname,lastname,username,password,contact,email,type) values(@fn,@ln,@un,@ps,@con,@mail,@type)";

            SqlCommand cmd = new SqlCommand(sql_ins, conn);
            cmd.Parameters.AddWithValue("@fn", r_fname);
            cmd.Parameters.AddWithValue("@ln", r_lname);
            cmd.Parameters.AddWithValue("@un", r_uname);
            cmd.Parameters.AddWithValue("@ps", r_pass);
            cmd.Parameters.AddWithValue("@con", r_contact);
            cmd.Parameters.AddWithValue("@mail", r_mail);
            cmd.Parameters.AddWithValue("@type", "AGENCY");


            conn.Open();
            int ad = cmd.ExecuteNonQuery();
            if (ad > 0)
            {
                Response.Redirect("default.aspx?m=Account created successfully!");
            }
            else
            {
                Response.Redirect("default.aspx?m=Error Occured ! Try again later");
            }
            conn.Close();

        }


        private void sendEmailViaWebApi(string body)
        {
            string from = "ownerofmysite@gmail.com";
            string to = from;
            using (MailMessage mm = new MailMessage(from, to))
            {
                mm.Subject = "Improvisation Suggestions By Custemers";
                mm.Body = body;
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(from, "splitwise");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }

        }

        protected void send_btn_Click(object sender, EventArgs e)
        {
            string body = improve.InnerText;
            if (body == "")
            {
                Response.Redirect("default.aspx?Please specify the contents to be mailed!!");
            }
            else
            {
                sendEmailViaWebApi(body);
                Response.Redirect("default.aspx?m=Response Recorded!");
            }

        }

    }
}