using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Connect;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;

namespace WebApplication2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public string str;
        public string t;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void b2_Click(object sender,EventArgs e)
        {
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select data from uploads where id=@id");
            cc.setParameter("@id", "Mysore_4_image");
            cc.openConnection();
            SqlDataReader rdr = cc.getDDLResults();
            

            if (rdr != null)

            {
                rdr.Read();
              
                    byte[] bytes = (byte[])rdr["data"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    string t = "data:image/png;base64," + base64String;
               // Image1.ImageUrl = "data:image/png;base64," + base64String;
            }
            cc.closeConnection();
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            if (f1.HasFile)
            {
                string file_name = f1.FileName.ToString();
                string contentType = MimeMapping.GetMimeMapping(file_name);
                int length = f1.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                cc.setConnection();
            
               f1.PostedFile.InputStream.Read(pic, 0, length);

                    cc.setCommand("insert into uploads(name,content_type,data) values (@name,@c,@photo)");
                    cc.setParameter("@photo", pic);
                cc.setParameter("@name", file_name);
                cc.setParameter("@c",contentType);

                cc.openConnection();
                int a= cc.getDMLResults();
                if(a>0)
                {
                    Label1.Visible = true;
                    Label1.Text = "Image Uploaded Sucessfully";  //after Sucessfully uploaded image
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Image wasnt Uploaded";  

                }
                cc.closeConnection();
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Plz upload the image!!!!";
            }
        }

  
    }
}