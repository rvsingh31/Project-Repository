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
using System.Net.Mail;
using System.Net;
using System.IO;

namespace WebApplication2.agency
{
    public partial class refund : System.Web.UI.Page
    {
        private void sendEmailViaWebApi( string to,string body)
        {
            string from = "ownerofmysite@gmail.com";
            
            using (MailMessage mm = new MailMessage(from, to))
            {
                mm.Subject = "Refund Complete";
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
           //     ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["agency_id"]==null)
            {
                Response.Redirect("default.aspx?m=Login to Continue..");
            }

            if (Request.QueryString["p_id"] != null && Request.QueryString["user_id"] != null) 
            {
                string p_id = Request.QueryString["p_id"].ToString();
                string user_id = Request.QueryString["user_id"].ToString();

                ConnectClass cc = new ConnectClass();
                ConnectClass cc1 = new ConnectClass();
                cc1.setConnection();
                cc.setConnection();
                cc.setCommand("delete from booked_packages where p_id="+p_id+" and user_id="+user_id);
                cc.openConnection();
                int i = cc.getDMLResults();
                cc.closeConnection();
                if (i > 0)
                {
                    cc1.setCommand("select email from users where Id="+user_id);
                    cc1.openConnection();
                    SqlDataReader r = cc1.getDDLResults();
                    r.Read();
                    string to = r["email"].ToString();
                    cc1.setCommand("select p_name from package_details where p_id="+p_id);
                    SqlDataReader r1 = cc1.getDDLResults();
                    r1.Read();
                    string package = r1["p_name"].ToString();
                    r1.Close();
                    cc1.closeConnection();
                    string body = "Dear User,<br> Your Booked Package named "+package+" has been cancelled successfully and the transaction of Refund Process has been completed. We are happy to serve you.For any kind of inconveniency faced ,you can contact +91-8460348865 or even for any kind of help.<br>Thank You for choosing Easy Travel";
                    sendEmailViaWebApi(to,body);
                    Response.Redirect("a_home.aspx?m=Refund Completed!");

                }

            }
            else
            {
                Response.Redirect("a_home.aspx?m=Select a package to delete!");
            }
        }
    }
}