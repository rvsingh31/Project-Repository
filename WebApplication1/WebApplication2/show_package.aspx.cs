using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Connect;
using System.Collections;

namespace WebApplication2
{
   
    public partial class WebForm6 : System.Web.UI.Page
    {
        public void b1_click(object sender,EventArgs e)
        {
            string variable=traveler.Value;
           if(variable=="yes")
            {
                select_div.Visible = false;
                old_traveller.Visible = true;
            }
            else
            {
                select_div.Visible = false;
                new_traveller.Visible = true;
            }
        }
      
        protected void Page_Load(object sender, EventArgs e)
        {
            new_traveller.Visible = false;
            old_traveller.Visible = false;
            if (Session["u_package_id"]==null)
            {
                Response.Redirect("home.aspx?m=Select a package first");
            }
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
           
       //     cc.setCommand("select p_name,p_description,cost_adult,cost_child,duration,limit,expiry_date,data from package_details join uploads on (package_details.image_id=uploads.Id) where package_details.p_id=@e");
            cc.setCommand("select a_name,a_address,a_description,a_contact,p_name,p_description,cost_adult,cost_child,duration,limit,expiry_date,data from  agency_details join (package_details join uploads on (package_details.image_id=uploads.Id)) on (agency_details.a_id = package_details.a_id) where package_details.p_id=@e");
            cc.setParameter("@e", Session["u_package_id"].ToString());
            cc.openConnection();
           
            SqlDataReader r = cc.getDDLResults();
            r.Read();
            pn.InnerText = r["p_name"].ToString();
            pd.InnerText = r["p_description"].ToString();
            pdu.InnerText = r["duration"].ToString();
            pl.InnerText = r["limit"].ToString();
            pe.InnerText = r["expiry_date"].ToString();
            ca.InnerText = r["cost_adult"].ToString();
            cc1.InnerText = r["cost_child"].ToString();
            an.InnerText = r["a_name"].ToString();
            ad.InnerText = r["a_description"].ToString();
            aa.InnerText = r["a_address"].ToString();
            ac.InnerText = r["a_contact"].ToString();
            byte[] bytes = (byte[])r["data"];
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            im1.ImageUrl = "data:image/png;base64," + base64String; ;


        }
    }
}