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

namespace WebApplication2.booking
{
    public partial class booking_userdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void payment_button(object sender, EventArgs e)
        {
            string t_name = fnametextbox.Text + " " + lnametextbox.Text;
            string t_email = emailtextbox.Text;
            string t_mobno = mobnotextbox.Text;
            //  string members = (string)Session["members_adult"]+(string)Session["members_child"];
            //   string total_cost = ((int)Session["package_adult_cost"]*session["members_adult"])+((int)Session["package_child_cost"]*session["members_child"]);


            string constr = WebConfigurationManager.ConnectionStrings["table"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);

            string insert_query = "insert into booked_package(t_name,t_email,t_mobno,members,total_cost) values(@tn,@te,@tmob,@mem,@tot)";
            SqlCommand cmd = new SqlCommand(insert_query, conn);
            cmd.Parameters.AddWithValue("@tn", t_name);
            cmd.Parameters.AddWithValue("@te", t_email);
            cmd.Parameters.AddWithValue("@tmob", t_mobno);
            //          cmd.Parameters.AddWithValue("@mem", members);
            //          cmd.Parameters.AddWithValue("@tot", total_cost);

            conn.Open();
            int n = cmd.ExecuteNonQuery();
            if (n > 0)
            {
                Response.Redirect("booking_userdetails.aspx?m=Details added successfully!");
            }
            else
            {
                Response.Redirect("booking_userdetails.aspx?m=Error Occured ! Try again later");
            }

            conn.Close();
        }
    }
}