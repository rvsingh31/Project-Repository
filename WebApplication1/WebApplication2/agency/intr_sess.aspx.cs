using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace WebApplication2.agency
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["agency_id"] == null)
            {
                Response.Redirect("index.aspx?m=Login First!!");
            }


            if (Request.QueryString["type"] != null && Request.QueryString["type"].ToString()=="inq")
            {
                if (Request.QueryString["user_id"] == null || Request.QueryString["enq_id"] == null)
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
                else
                {
                    Session["enq_user_id"] = Request.QueryString["user_id"];
                    Session["enq_id"] = Request.QueryString["enq_id"];
                    Response.Redirect("respond.aspx");
                }
            }

            if (Request.QueryString["type"] != null && Request.QueryString["type"]=="show")
            {
                string p_id = Request.QueryString["p_id"].ToString();
                Session["details_id"] = p_id;
                Response.Redirect("details.aspx");
            }
            else
            {
                
            string id = Request.QueryString["id"];
            string name = Request.QueryString["name"];

            Session["package_id"] = id;
            Session["package_name"]=name;
            Response.Redirect("edit_package.aspx");
            }
        }
    }
}