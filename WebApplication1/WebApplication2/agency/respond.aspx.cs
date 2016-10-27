using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.SessionState;
using Connect;
using System.Net.Mail;
using System.Net;
using System.IO;


namespace WebApplication2.agency
{
    public partial class respond : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["agency_id"] == null)
            {
                Response.Redirect("index.aspx?m=Login First!!");
            }


            if (Session["enq_user_id"]==null || Session["enq_id"]==null)
            {
                if (Session["agency_id"] == null)
                {
                    Response.Redirect("index.aspx?m=Login First!!");
                }
                else
                {
                    Response.Redirect("a_home.aspx?m=Select an inquiry first!!"); 
                }
            }


            string user_id = Session["enq_user_id"].ToString();
            string enq_id = Session["enq_id"].ToString();
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select firstname,lastname,location,description,budget from users join inquiries on (users.Id=inquiries.user_id) where user_id=@u and enq_id=@e");
            cc.setParameter("@u",user_id);
            cc.setParameter("@e",enq_id);
            cc.openConnection();
            SqlDataReader r = cc.getDDLResults();
            if(r.Read())
            {
                name.InnerText = r["firstname"] + " " + r["lastname"];
                location.InnerText = r["location"].ToString();
                description.InnerText = r["description"].ToString();
                budget.InnerText = r["budget"].ToString();
            }
            else
            {
                Response.Redirect("a_home.aspx?m=Invalid Selection");
            }
        }

        protected void mail_btn_Click(object sender, EventArgs e)
        {
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.openConnection();
            cc.setCommand("select email from users where Id=@us");
            cc.setParameter("@us",Session["enq_user_id"].ToString());
            SqlDataReader r = cc.getDDLResults();
            r.Read();
            string to = r["email"].ToString();
            string body =mail.InnerText;
            sendEmailViaWebApi(to, body);

        }

        private void sendEmailViaWebApi(string to, string body)
        {
            string from = "ownerofmysite@gmail.com";

            using (MailMessage mm = new MailMessage(from, to))
            {
                mm.Subject = "Response regarding your Inquiry";
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
              //  ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
                      Response.Redirect("a_home.aspx?m=Mail Sent");
            }

        }
    }
}