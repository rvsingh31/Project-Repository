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
using System.Web.Configuration;


namespace WebApplication2.agency
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        public string msg;
        public string img_link;
        public string image_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["package_id"]==null)
            {
                Response.Redirect("a_home.aspx?msg=Select a package to edit its details!");
            }

            msg = Request.QueryString["m"];
            ConnectClass cc = new ConnectClass();
            string p_id = Session["package_id"].ToString();
            cc.setConnection();
            cc.setCommand("select * from package_details join uploads on (package_details.image_id=uploads.Id) where p_id=@r");
            cc.setParameter("@r",p_id);
            cc.openConnection();
            SqlDataReader r = cc.getDDLResults();
            r.Read();
            name_lbl.Text = r["p_name"].ToString();
            desc_lbl.Text = r["p_description"].ToString();
            cost_lbl.Text = "ADULT:Rs "+r["cost_adult"].ToString()+"  , CHILD:Rs "+r["cost_child"];
            duration_lbl.Text = r["duration"].ToString();
            limit_lbl.Text = r["limit"].ToString();
            expiry_lbl.Text = r["expiry_Date"].ToString();
            location_lbl.Text = r["location"].ToString();
            image_id = r["image_id"].ToString();
            byte[] bytes = (byte[])r["data"];
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            img_link = "data:image/png;base64," + base64String; 

            r.Close();

            cc.closeConnection();   
        }

        protected void Update_Event(object sender, CommandEventArgs e)
        {
            string p_id = Session["package_id"].ToString();
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            string value1,value2;
            if(e.CommandArgument.ToString()=="name_div")
            {
                value1 = name_field.Text;
                cc.setCommand("update package_details set p_name = @t where p_id="+p_id);
                cc.setParameter("@t",value1);
            }
            else if (e.CommandArgument.ToString() == "description_div")
            {
                value1 = desc_field.Text;
                cc.setCommand("update package_details set p_description = @t where p_id="+p_id);
                cc.setParameter("@t", value1);
            }
            else if (e.CommandArgument.ToString() == "cost_div")
            {
                value1 = adult_field.Text;
                value2 = child_field.Text;
                cc.setCommand("update package_details set cost_adult = @t , cost_child = @y where p_id="+p_id);
                cc.setParameter("@t", value1);
                cc.setParameter("@y",value2);
            }
            else if (e.CommandArgument.ToString() == "duration_div")
            {
                value1 = days_field.Text;
                value2 = nights_field.Text;
                string temp = value1 + " days and " + value2 + " nights";
                cc.setCommand("update package_details set duration = @t where p_id=" + p_id);
                cc.setParameter("@t", temp);
              
            }
            else if (e.CommandArgument.ToString() == "limit_div")
            {
                value1 = limit_field.Text;
                cc.setCommand("update package_details set limit = @t where p_id=" + p_id);
                cc.setParameter("@t", value1);
            }
            else if (e.CommandArgument.ToString() == "expiry_div")
            {
                value1 = expiry_field.Text;
                cc.setCommand("update package_details set expiry_date = @t where p_id=" + p_id);
                cc.setParameter("@t", value1);
            }
            else if (e.CommandArgument.ToString() == "location_div")
            {
                value1 = location_field.Text;
                cc.setCommand("update package_details set location = @t where p_id=" + p_id);
                cc.setParameter("@t", value1);
            }
            else if (e.CommandArgument.ToString() == "image_div")
            {
                string file_name = f1.FileName.ToString();
                string contentType = MimeMapping.GetMimeMapping(file_name);
                if (contentType != "image/jpeg")
                {
                    Response.Redirect("edit_package.aspx?m=Select an image of JPEG format");
                }
                int length = f1.PostedFile.ContentLength;
                byte[] pic = new byte[length];

                f1.PostedFile.InputStream.Read(pic, 0, length);

                cc.setCommand("update uploads set name=@name, data=@data, content_type=@type where Id=@image_id");
                cc.setParameter("@name",file_name);
                cc.setParameter("@type", contentType);
                cc.setParameter("@data", pic);
                cc.setParameter("@image_id",image_id);

            }

            cc.openConnection();
            int a = cc.getDMLResults();
            if(a>0)
            {
                Response.Redirect("edit_package.aspx?m=Changes made successfully!");
            }
            else
            {
                Response.Redirect("edit_package.aspx?m=Error Occured!Try again Later.");

            }

        }
    }
}