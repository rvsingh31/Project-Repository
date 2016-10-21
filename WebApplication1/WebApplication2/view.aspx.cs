using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Connect;
using System.Data.SqlClient;
using System.Data.SqlTypes;
namespace WebApplication2
{
    public partial class cancellation : System.Web.UI.Page
    {
        public string members;
        public string cancel;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["cancel_package_id"] == null)
            {
                Response.Redirect("home.aspx?m=Select a package first");
            }
            if (Session["cancel"] != null)
            {
                cancel = Session["cancel"].ToString();
            }
            ConnectClass cc = new ConnectClass();
            cc.setConnection();

            //     cc.setCommand("select p_name,p_description,cost_adult,cost_child,duration,limit,expiry_date,data from package_details join uploads on (package_details.image_id=uploads.Id) where package_details.p_id=@e");
            cc.setCommand("select a_name,a_address,a_description,a_contact,p_name,p_description,cost_adult,cost_child,duration,limit,expiry_date,data from  agency_details join (package_details join uploads on (package_details.image_id=uploads.Id)) on (agency_details.a_id = package_details.a_id) where package_details.p_id=@e");
            cc.setParameter("@e", Session["cancel_package_id"].ToString());
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

            r.Close();

            cc.setCommand("select total_cost,adults,child,eticket_id from booked_packages where p_id=@p_id and user_id=@user_id");
            cc.setParameter("@p_id",Session["cancel_package_id"].ToString());
            cc.setParameter("@user_id", Session["id"].ToString());

            SqlDataReader rdr = cc.getDDLResults();
            rdr.Read();

            string total_cost = rdr["total_cost"].ToString();
            string eticket = rdr["eticket_id"].ToString();
            int adult = Int32.Parse(rdr["adults"].ToString());
            int child = Int32.Parse(rdr["child"].ToString());
            rdr.Close();

            cc.setCommand("select * from eticket where eticket_id=@et");
            cc.setParameter("@et", eticket);
            SqlDataReader rdr2 = cc.getDDLResults();
            rdr2.Read();
            main_traveller.InnerText = rdr2["t_name"].ToString();
            eticket_span.InnerText = rdr2["eticket_id"].ToString();
            total_cost_span.InnerText = total_cost;
            rdr2.Close();
            if (adult>0 && child > 0)
            {
                adults_div.InnerHtml = "<h6 class='teal-text'>-- Travellers (ADULTS) --</h6>";
                child_div.InnerHtml = "<h6 class='teal-text'>-- Travellers (CHILDREN) --</h6>";
                members = "yes";
                cc.setCommand("select * from members where eticket_id=@ticket");
                cc.setParameter("@ticket",eticket);
                SqlDataReader rdr3 = cc.getDDLResults();
                while (rdr3.Read())
                {
                    if(rdr3["a_or_c"].ToString()=="adult")
                    {
                        adults_div.InnerHtml += "<h6 class='blue-text'>"+rdr3["name"]+"</h6>";
                    }
                    else
                    {
                        child_div.InnerHtml += "<h6 class='blue-text'>" + rdr3["name"] + "</h6>";
                    }

                }

            }
            else
            {
                members = "no";
            }

        }
    }
}