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
    public partial class reset : System.Web.UI.Page
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
            step2_div.Visible = false;
            step3_div.Visible = false;
            step1_div.Visible = true;
           
        }

        protected void create()
        {
            Label lb1 = new Label();
            lb1.Text = "New Password";
            lb1.CssClass = "purple-text";
            TextBox tb1 = new TextBox();
            tb1.ID = "pass1";
            tb1.CssClass = "purple-text";

            Label lb2 = new Label();
            lb2.Text = "Confirm Password";
            lb2.CssClass = "purple-text";
            TextBox tb2 = new TextBox();
            tb2.ID = "pass2";
            tb2.CssClass = "purple-text";

            UpdatePanel1.ContentTemplateContainer.Controls.Add(lb1);
            UpdatePanel1.ContentTemplateContainer.Controls.Add(tb1);
            UpdatePanel1.ContentTemplateContainer.Controls.Add(lb2);
            UpdatePanel1.ContentTemplateContainer.Controls.Add(tb2);

            pass_tb.Controls.Add(lb1);
            pass_tb.Controls.Add(tb1);
            pass_tb.Controls.Add(lb2);
            pass_tb.Controls.Add(tb2);

        }
        protected void step2_Click(object sender, EventArgs e)
        {
            string code = code_ck.Text;
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select user_id from reset_account where code=@code");
            cc.setParameter("@code",code);
            cc.openConnection();
            SqlDataReader r = cc.getDDLResults();
            if(r.Read())
            {
                err.Text = "";
                string id = r["user_id"].ToString();
                
                step2_div.Visible = false;
                step1_div.Visible = false;
                step3_div.Visible = true;
            }
            else
            {
                step2_div.Visible = false;
                step1_div.Visible = true;
                step3_div.Visible = false;
                err.Text = "Wrong Code Enterred!";
            }
        }

        protected void st1_Click(object sender, EventArgs e)
        {
            string un_str = un.Text;

            Session["username"] = un_str;
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.openConnection();
            cc.setCommand("select firstname,lastname,email,Id from users where username='" + un_str + "'");
            SqlDataReader rdr = cc.getDDLResults();

            if (rdr.Read())
            {
                string name = rdr["firstname"] + " " + rdr["lastname"];
                string id = rdr["Id"].ToString();
                Session["id"] = id;
                string mailid = rdr["email"].ToString();
                rdr.Close();
                cc.closeConnection();
                string code = Guid.NewGuid().ToString();
                string body = "Hello " + name + ",<br> A request to reset the password for your account has been made at Easy Travel.<br> Copy the following code and paste it in the area provided to go to <i>'Reset Password Section'</i> <br>Code: " + code + "<br> Regards,<br>Admin,<br>Easy-Travel.";
                ConnectClass cc1 = new ConnectClass();
                cc1.setConnection();
                cc1.openConnection();
                cc1.setCommand("insert into reset_account(code,user_id) values('" + code + "','" + id + "')");
                int a = cc1.getDMLResults();
                cc1.closeConnection();
                if (a > 0)
                {
                    sendEmailViaWebApi(mailid, body);
                    step1_div.Visible = false;
                    step2_div.Visible = true;

                }
                else
                {
                    Response.Redirect("index.aspx?m=Error occured!");
                }
            }
            else
            {
                Response.Redirect("index.aspx?m=Error occured!");
            }
        }

        protected void final_Click(object sender, EventArgs e)
        {
            string pass1 = pass1_tb.Text;
            string pass2 = pass2_tb.Text;
            if(pass1!="" || pass2!="")
            {

                if (pass1 == pass2)
                {
                    string id = "";
                    if(Session["id"]!=null)
                    {
                        id = Session["id"].ToString();
                    }
                    else
                    {
                        Response.Redirect("index.aspx?m=Error occured!");
                    }

                    err2.Text = "";
                    ConnectClass cc = new ConnectClass();
                    cc.setConnection();
                    cc.setCommand("update users set password=@pass where Id=@i");
                    cc.setParameter("@pass",pass1);
                    cc.setParameter("@i",id);
                    cc.openConnection();
                    int a = cc.getDMLResults();
                    cc.closeConnection();
                    if (a > 0)
                    {
                        ConnectClass cc2 = new ConnectClass();
                        cc2.setConnection();
                        cc2.setCommand("delete from reset_account where user_id=" + id);
                        cc2.openConnection();
                        int b = cc2.getDMLResults();
                        if (b > 0)
                        {
                            Response.Redirect("index.aspx?m=Password Changed Successfully");
                        }
                        else
                        {
                            Response.Redirect("index.aspx?m=Error Occured! Try Again");
                        }
                    }
                    else
                    {
                        Response.Redirect("index.aspx?m=Error Occured! Try Again");
                    }
                }
                else
                {
                    step2_div.Visible = false;
                    step1_div.Visible = false;
                    step3_div.Visible = true;
                    err2.Text = "Password Doesnt Match!";
                }

            }
            else
            {
                step2_div.Visible = false;
                step1_div.Visible = false;
                step3_div.Visible = true;
                err2.Text = "Both Fields are Required!";
            }


        }
    }
}