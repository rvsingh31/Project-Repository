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

namespace WebApplication2.admin
{
    public partial class delete_users : System.Web.UI.Page
    {
        public string id;
        public string g_type;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                id = Request.QueryString["id"];
                g_type = Request.QueryString["type"];
            }
            else
            {
                Response.Redirect("a_home.aspx?m=ID is not properly set.");
            }

            ConnectClass cc = new ConnectClass();
            ConnectClass cc1 = new ConnectClass();
            cc.setConnection();
            cc.setCommand("delete from users where Id=@id");
            cc.setParameter("@id", id);
            cc.openConnection();
            int ad = cc.getDMLResults();
            if (ad > 0)
            {
                if(g_type=="AGENCY")
                {
                    cc.setCommand("delete from package_details where a_id=(select a_id from agency_details where user_id=@us_id)");
                    cc.setParameter("@us_id", id);
                    int a = cc.getDMLResults();

                    if (a > 0)
                    {
                        cc1.setConnection();

                        cc1.setCommand("delete from agency_details where user_id=@u_id");
                        cc1.setParameter("@u_id", id);
                        cc1.openConnection();
                        int b = cc1.getDMLResults();

                        if (b > 0)
                        {

                            Response.Redirect("a_home.aspx?m=User and his/her agency and packages deleted successfully!");
                        }
                        else
                        {
                            Response.Redirect("a_home.aspx?m=User and his/her packages deleted successfully!");
                        }
                    }
                }
                else
                {
                    Response.Redirect("a_home.aspx?m=User deleted successfully!");
                }
            }
            else
            {
                Response.Redirect("a_home.aspx?m=Error Occured ! Try again later");
            }

        }
    }
}