using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Connect;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Net.Mail;
using System.Net;
using System.IO;


namespace WebApplication2
{
    public partial class reset_mail : System.Web.UI.Page
    {
        private void sendEmailViaWebApi(string to, string body)
        {
            string from = "ownerofmysite@gmail.com";

            using (MailMessage mm = new MailMessage(from, to))
            {
                mm.Subject = "Password Reset Request";
                mm.Body = body;
                mm.IsBodyHtml = true;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = Request.QueryString["un"].ToString();
            string un = Request.QueryString["un"].ToString();
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.openConnection();
            cc.setCommand("select firstname,lastname,email,Id from users where username='"+un+"'");
            SqlDataReader rdr = cc.getDDLResults();
           
            if(rdr.Read())
            {
                string name = rdr["firstname"] + " " + rdr["lastname"];
                string id = rdr["Id"].ToString();
                string mailid = rdr["email"].ToString();
                rdr.Close();
                cc.closeConnection();
                string code = Guid.NewGuid().ToString();
                string body = "Hello "+name+ ",<br> A request to reset the password for your account has been made at Easy Travel.<br> Copy the following code and paste it in the area provided to go to <i>'Reset Password Section'</i> <br>Code: "+code+"<br> Regards,<br>Admin,<br>Easy-Travel.";
                ConnectClass cc1 = new ConnectClass();
                cc1.setConnection();
                cc1.openConnection();
                cc1.setCommand("insert into reset_account(code,user_id) values('"+code+"','"+id+"')");
                int a = cc1.getDMLResults();
                cc1.closeConnection();
                if(a>0)
                {
                    sendEmailViaWebApi(mailid, body);
                    Response.Write("sent");
                    Response.End();
                }
                else
                {
                    Response.Write("not sent");
                    Response.End();
                }
            }
            else
            {
                Response.Write("not done");
                Response.End();
            }
        }
    }
}