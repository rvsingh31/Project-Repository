using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Connect;
using System.Web.SessionState;
namespace WebApplication2
{
    public partial class getstatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                // For GET Method    
                string u = Request.QueryString["user"].ToString();
                string p = Request.QueryString["package"].ToString();
                if (Request.QueryString["type"].ToString()=="save")
                {
                    Session["save"] = "yes";
                    ConnectClass cc = new ConnectClass();
                    cc.setConnection();
                    cc.setCommand("insert into starred(user_id,p_id) values(@w,@q)");
                    cc.setParameter("@w", u);
                    cc.setParameter("@q", p);
                    cc.openConnection();
                    int a = cc.getDMLResults();
                    cc.closeConnection();
                    if (a > 0)
                    {
                        Response.Write("donesaving");
                        Response.End();
                    }
                    else
                    {
                        Response.Write("not done");
                        Response.End();

                    }
                }
                else
                {
                    Session["save"] = "no";
                    ConnectClass cc = new ConnectClass();
                    cc.setConnection();
                    cc.setCommand("delete from starred where user_id=@wa and p_id=@qa");
                    cc.setParameter("@wa", u);
                    cc.setParameter("@qa", p);
                    cc.openConnection();
                    int a = cc.getDMLResults();
                    cc.closeConnection();
                    if (a > 0)
                    {
                        Response.Write("doneremoving");
                        Response.End();
                    }
                    else
                    {
                        Response.Write("not done");
                        Response.End();
                    }

                }

            }

        }
    }
}