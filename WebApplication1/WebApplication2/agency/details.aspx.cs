using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Connect;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Collections;


namespace WebApplication2
{
    public partial class details : System.Web.UI.Page
    {
        public ArrayList ar1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["details_id"]==null)
            {
                Response.Redirect("a_home.aspx?m=Select appropriate package for details!");
            }
            ar1 = new ArrayList();
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select t_name, t_contact, adults, child, booked_packages.eticket_id,total_cost from booked_packages join eticket on (booked_packages.user_id = eticket.user_id) where p_id = @p_id and status='booked' group by t_name, t_contact, adults, child, booked_packages.eticket_id,total_cost");
            cc.setParameter("@p_id", Session["details_id"].ToString());
            cc.openConnection();
            SqlDataReader rdr = cc.getDDLResults();
            while(rdr.Read())
            {
                ar1.Add(rdr["t_name"]);
                ar1.Add(rdr["t_contact"]);
                ar1.Add(rdr["eticket_id"]);
                ar1.Add(rdr["adults"]);
                ar1.Add(rdr["child"]);
                ar1.Add(rdr["total_cost"]);
            }


        }

       
    }
}