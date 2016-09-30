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
using Connect;
using System.Collections;

namespace WebApplication2.agency
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public string packages;
        public SqlDataReader r;
        public int count=0;
        public ArrayList ar1;
        public ArrayList ar2;
        public int q;
        // public SqlDataAdapter sda;
        // public DataSet ds;
        //public DataRow row;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                a_lbl.Text = (string)Session["username"];
            }
            else
            {
                Response.Redirect("/agency/index.aspx?msg=Log in to Continue..");
            }

            string str2 = Request.QueryString["m"];

            if (!string.IsNullOrEmpty(str2))
            {
                error_lbl.Text = str2;
            }

            int i = Int32.Parse(Session["id"].ToString());
            string constr = WebConfigurationManager.ConnectionStrings["database"].ConnectionString;

            SqlConnection conn = new SqlConnection(constr);

            SqlCommand cmd = new SqlCommand();

            cmd.Connection = conn;

            cmd.CommandText = "select * from agency_details where user_id=@u";
            cmd.Parameters.AddWithValue("@u", i);

            SqlDataReader rdr;
            conn.Open();

            rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                current_name.Text = rdr["a_name"].ToString();
                current_address.Text = rdr["a_address"].ToString();
                current_contact.Text = rdr["a_contact"].ToString();
                current_description.Text = rdr["a_description"].ToString();

                conn.Close();

                new_agency.Visible = false;
                old_agency.Visible = true;
                temp_div.Visible = false;
                pm.Visible = true;
                pm2.Visible = true;
                ConnectClass cc = new ConnectClass();
                cc.setConnection();
                cc.setCommand("select * from package_details where a_id=(select a_id from agency_details where user_id=@o)");
                cc.setParameter("@o", i.ToString());
                cc.openConnection();
                SqlDataReader r=cc.getDDLResults();

                if (r.HasRows)
                {
                    this.packages = "Some packages to show!";
                    ar1 = new ArrayList();
                    ar2 = new ArrayList();
                    while(r.Read())
                    {
                        ar1.Add(r["p_name"]);
                        ar2.Add(r["p_id"]);
                    }

                }
                else
                {
                    this.packages = "";
                }
                cc.closeConnection();

            }       
            else
            {
                new_agency.Visible = true;
                old_agency.Visible = false;
                temp_div.Visible = true;
                slide_div.Visible = false;
                pm.Visible = false;
                pm2.Visible = false;

            }


        }
    
        protected void Save_Name_Click(object sender, EventArgs e)
        {
            string n = new_name.Text;
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("update agency_details set a_name=@n where user_id=@l");
            cc.setParameter("@n",n);
            cc.setParameter("@l",Session["id"].ToString());
            cc.openConnection();
            int ad = cc.getDMLResults();
            if(ad>0)
            {
                Response.Redirect("/agency/a_home.aspx?m=Name Changed successfully!");
            }
            else
            {
                Response.Redirect("/agency/a_home.aspx?m=Error Occured ! Try again later");
            }
            cc.closeConnection();
        }

        protected void Save_Address_Click(object sender, EventArgs e)
        {
            string n = new_address.Text;
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("update agency_details set a_address=@n where user_id=@l");
            cc.setParameter("@n", n);
            cc.setParameter("@l", Session["id"].ToString());
            cc.openConnection();
            int ad = cc.getDMLResults();
            if (ad > 0)
            {
                Response.Redirect("/agency/a_home.aspx?m=Address Changed successfully!");
            }
            else
            {
                Response.Redirect("/agency/a_home.aspx?m=Error Occured ! Try again later");
            }
            cc.closeConnection();
        }

        protected void Save_Contact_Click(object sender, EventArgs e)
        {
            string n = new_contact.Text;
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("update agency_details set a_contact=@n where user_id=@l");
            cc.setParameter("@n", n);
            cc.setParameter("@l", Session["id"].ToString());
            cc.openConnection();
            int ad = cc.getDMLResults();
            if (ad > 0)
            {
                Response.Redirect("/agency/a_home.aspx?m=Contact Changed successfully!");
            }
            else
            {
                Response.Redirect("/agency/a_home.aspx?m=Error Occured ! Try again later");
            }
            cc.closeConnection();
        }

        protected void Save_Description_Click(object sender, EventArgs e)
        {
            string n = new_description.Text;
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("update agency_details set a_description=@n where user_id=@l");
            cc.setParameter("@n", n);
            cc.setParameter("@l", Session["id"].ToString());
            cc.openConnection();
            int ad = cc.getDMLResults();
            if (ad > 0)
            {
                Response.Redirect("/agency/a_home.aspx?m=Description Changed successfully!");
            }
            else
            {
                Response.Redirect("/agency/a_home.aspx?m=Error Occured ! Try again later");
            }
            cc.closeConnection();
        }
        protected void Add_Package_Click(object sender,EventArgs e)
        {
            string p = pname.Text;
            string d = pdesc.Text;
            string adult = a_cost.Text;
            string child = c_cost.Text;
            string lim = limit.Text;
            string loc = location.Text;
            string dur1 = days.Text;
            string dur2 = nights.Text;
            string exp = expiry_date.Text;
            string dur = dur1 + " days and " + dur2 + " nights";
           
            ConnectClass cc = new ConnectClass();

            cc.setConnection();
            int i = Int32.Parse(Session["id"].ToString());
            cc.setCommand("select a_id from agency_details where user_id=@e");
            cc.setParameter("@e",i.ToString());
            cc.openConnection();
            SqlDataReader r = cc.getDDLResults();
            r.Read();
            
                string ag_id = r["a_id"].ToString();
            
            cc.closeConnection();    

            cc.setCommand("insert into package_details(a_id,p_name,p_description,cost_adult,cost_child,duration,limit,expiry_date,location) values( @a_id,@p,@d,@adult,@child,@dur,@lim,@exp,@loc)");
            cc.setParameter("@a_id",ag_id);
            cc.setParameter("@p",p);
            cc.setParameter("@d", d);
            cc.setParameter("@adult", adult);
            cc.setParameter("@child", child);
            cc.setParameter("@dur", dur);
            cc.setParameter("@lim", lim);
            cc.setParameter("@exp", exp);
            cc.setParameter("@loc", loc);
          //  cc.setParameter("@a_id",ag_id);
            cc.openConnection();
            int a = cc.getDMLResults();
             if(a>0)
            {
                Response.Redirect("/agency/a_home.aspx?m=Package added successfully!");
            }   
             else
            {
                Response.Redirect("/agency/a_home.aspx?m=Error Occured ! Try again later");
            }

            cc.closeConnection();

        }
        protected void details_btn_Click(object sender, EventArgs e)
        {
            string f1 =a_name.Text;
            string f2 =desc.Text;
            string f3 =address.Text;
            string f4 =a_contact.Text;
            string f5 = Session["id"].ToString();

            string constr = WebConfigurationManager.ConnectionStrings["database"].ConnectionString;

            SqlConnection conn = new SqlConnection(constr);

            string sql_ins = "insert into agency_details(a_name,a_description,a_address,a_contact,user_id) values(@f1,@f2,@f3,@f4,@f5)";

            SqlCommand cmd = new SqlCommand(sql_ins, conn);
            cmd.Parameters.AddWithValue("@f1", f1);
            cmd.Parameters.AddWithValue("@f2", f2);
            cmd.Parameters.AddWithValue("@f3", f3);
            cmd.Parameters.AddWithValue("@f4", f4);
            cmd.Parameters.AddWithValue("@f5", f5);


            conn.Open();
            int ad = cmd.ExecuteNonQuery();
            if (ad > 0)
            {
                Response.Redirect("/agency/a_home.aspx?m=Details added successfully!");
            }
            else
            {
                Response.Redirect("/agency/a_home.aspx?m=Error Occured ! Try again later");
            }
            conn.Close();

        }
    }
}