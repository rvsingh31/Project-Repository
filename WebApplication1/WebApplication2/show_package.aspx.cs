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
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;

namespace WebApplication2
{
   
    public partial class WebForm6 : System.Web.UI.Page
    {
        public int ct_ad,ct_ch,i;
        public string save;
        public string user, package,x;

        
        public void book_package(object sender,CommandEventArgs e)
        {
            ct_ad = Int32.Parse(Session["count_adult"].ToString());
            ct_ch = Int32.Parse(Session["count_child"].ToString());

            int adult_cost = Int32.Parse(ca.InnerText);
            int child_cost = Int32.Parse(cc1.InnerText);
            ConnectClass cc = new ConnectClass();
            cc.setConnection();

            if(e.CommandArgument.ToString()=="new")
            {
               if(Session["traveller"]!=null && Session["alone"]!=null)
                {
                   if(Session["alone"].ToString()=="no")
                    {
                        ArrayList adults = new ArrayList();
                        ArrayList children = new ArrayList();
                        for (int i = 0; i < ct_ad; i++)
                        {
                            int j = i + 1;
                            // string input = (UpdatePanel1.ContentTemplateContainer.FindControl("adult_input" + (i + 1)) as TextBox).Text;
                            string input = ((TextBox)UpdatePanel1.FindControl("ph").FindControl("adult_input" + j.ToString())).Text;
                            adults.Add(input);
                          }

                          for (int i = 0; i < ct_ch; i++)
                          {
                            int j = i + 1;
                            string input = ((TextBox)UpdatePanel1.FindControl("ph").FindControl("child_input" + j.ToString())).Text;
                            children.Add(input);
                          }

                 
                        string new_tr = traveller_name.Text;
                        string t_contact = traveller_contact.Text;
                        string et = Session["u_package_id"].ToString() + Session["id"].ToString() + System.DateTime.Today;
                        cc.setCommand("insert into eticket(user_id,t_name,t_contact,eticket_id) values(@e,@r,@t,@y)");
                        cc.setParameter("@e", Session["id"].ToString());
                        cc.setParameter("@r", new_tr);
                        cc.setParameter("@t", t_contact);
                        cc.setParameter("@y", et);
                        cc.openConnection();
                        int a = cc.getDMLResults();
                        cc.closeConnection();
                        if (a > 0)
                        {
                            int t = (ct_ad * adult_cost) + (ct_ch * child_cost) + adult_cost;
                            string total_cost = t.ToString();
                            ConnectClass cc1 = new ConnectClass();
                            string t_ct_ad = (ct_ad + 1).ToString();
                            cc1.setConnection();
                            cc1.setCommand("insert into booked_packages(p_id,user_id,eticket_id,adults,child,total_cost,status) values(@p_id,@user_id,@et,@adults,@child,@tc,@status)");
                            cc1.setParameter("@p_id", Session["u_package_id"].ToString());
                            cc1.setParameter("@user_id", Session["id"].ToString());
                            cc1.setParameter("@et", et);
                            cc1.setParameter("@adults", t_ct_ad.ToString());
                            cc1.setParameter("@child", ct_ch.ToString());
                            cc1.setParameter("@tc", total_cost);
                            cc1.setParameter("@status", "booked");
                            cc1.openConnection();
                            int b = cc1.getDMLResults();
                            cc1.closeConnection();
                            if (b > 0)
                            {
                                int flag1 = 0;
                                for (int o=0;o<ct_ad;o++)
                                {
                                    string x = adults[o].ToString();
                                    ConnectClass cc2 = new ConnectClass();
                                    cc2.setConnection();
                                    cc2.setCommand("insert into members(eticket_id,name,a_or_c) values(@et,@name,'adult')");
                                    cc2.setParameter("@et",et);
                                    cc2.setParameter("@name",x);
                                    cc2.openConnection();
                                    int c = cc.getDMLResults();
                                    cc2.closeConnection();
                                    if (c>0)
                                    {
                                        flag1 = 0;
                                        continue;
                                    }
                                    else
                                    {
                                        flag1 = 1;
                                        break;
                                    }                                 
                                }

                                if (flag1 == 1)
                                {
                                    //FAILURE
                                }
                                else
                                {
                                   flag1 = 0;

                                    for (int o = 0; o < ct_ch; o++)
                                    {
                                        string x = children[o].ToString();
                                        ConnectClass cc3 = new ConnectClass();
                                        cc3.setConnection();
                                        cc3.setCommand("insert into members(eticket_id,name,a_or_c) values(@et,@name,'child')");
                                        cc3.setParameter("@et", et);
                                        cc3.setParameter("@name", x);
                                        cc3.openConnection();
                                        int c = cc.getDMLResults();
                                        cc3.closeConnection();
                                        if (c > 0)
                                        {
                                            flag1 = 0;
                                            continue;
                                        }
                                        else
                                        {
                                            flag1 = 1;
                                            break;
                                        }
                                    }
                                    if(flag1==1)
                                    {
                                        //FAILURE
                                    }
                                    else
                                    {
                                        //FINAL SUCCESS--------------------ALL ADDED
                                        new_traveller.Visible = false;
                                    
                                        final.Visible = true;


                                    }


                                }

                            }
                            else
                            {
                                //FAILURE
                            }

                        }
                        else
                        {
                            //FAILURE
                        }
                    }
                   else
                    {
                        string new_tr = traveller_name.Text;
                        string t_contact = traveller_contact.Text;
                        string et = Session["u_package_id"].ToString()+Session["id"].ToString()+System.DateTime.Today;
                        cc.setCommand("insert into eticket(user_id,t_name,t_contact,eticket_id) values(@e,@r,@t,@y)");
                        cc.setParameter("@e", Session["id"].ToString());
                        cc.setParameter("@r", new_tr);
                        cc.setParameter("@t", t_contact);
                        cc.setParameter("@y",et);
                        cc.openConnection();
                        int a = cc.getDMLResults();
                        if (a > 0)
                        {
                            string total_cost = adult_cost.ToString();

                            cc.setCommand("insert into booked_packages(p_id,user_id,eticket_id,adults,child,total_cost,status) values(@p_id,@user_id,@et,@adults,@child,@tc,@status)");
                            cc.setParameter("@p_id", Session["u_package_id"].ToString());
                            cc.setParameter("@user_id", Session["id"].ToString());
                            cc.setParameter("@et", et);
                            cc.setParameter("@adults","1");
                            cc.setParameter("@child","0");
                            cc.setParameter("@tc",total_cost);
                            cc.setParameter("@status","booked");
                            int b =cc.getDMLResults();

                            if(b > 0)
                            {
                                //SUCCESS
                                new_traveller.Visible = false;
                             
                                final.Visible = true;

                            }
                            else
                            {
                                //FAILURE
                            }
                        }
                        else
                        {
                            //FAILURE
                        }
                        cc.closeConnection();
                    }

                }
               else
                {
                    Response.Redirect("home.aspx?m=Session timed Out. Try Again!");
                }

            }
            else
            {
                cc.setCommand("select firstname,lastname,contact from users where id=@user_id");
                cc.setParameter("@user_id", Session["id"].ToString());
                cc.openConnection();
                SqlDataReader rdr2 = cc.getDDLResults();
                rdr2.Read();
                string name = rdr2["firstname"] + " " + rdr2["lastname"];
                string contact = rdr2["contact"].ToString();
                rdr2.Close();
                cc.closeConnection();
                if (Session["traveller"] != null && Session["alone"] != null)
                {
                    if(Session["alone"].ToString()=="no")
                    {
                        ArrayList adults = new ArrayList();
                        ArrayList children = new ArrayList();
                         for (int i = 0; i < ct_ad; i++)
                          {
                            int j = i + 1;
                            string input = ((TextBox)UpdatePanel1.FindControl("ph1").FindControl("adult_input" + j.ToString())).Text;
                            adults.Add(input);
                          }

                          for (int i = 0; i < ct_ch; i++)
                          {
                            int j = i + 1;
                            string input = ((TextBox)UpdatePanel1.FindControl("ph").FindControl("child_input" + j.ToString())).Text;
                            children.Add(input);
                          }

                        string et =System.DateTime.Today + Session["u_package_id"].ToString() + Session["id"].ToString();
                        cc.setCommand("insert into eticket(user_id,t_name,t_contact,eticket_id) values(@e,@r,@t,@y)");
                        cc.setParameter("@e", Session["id"].ToString());
                        cc.setParameter("@r", name);
                        cc.setParameter("@t",contact);
                        cc.setParameter("@y", et);
                        cc.openConnection();
                
                        int a = cc.getDMLResults();
                        cc.closeConnection();
                        if (a > 0)
                        {
                            int t = (ct_ad * adult_cost) + (ct_ch * child_cost) + adult_cost;
                            string total_cost = t.ToString();
                            string y = Session["u_package_id"].ToString();
                            string z = Session["id"].ToString();
                            ConnectClass cc1 = new ConnectClass();
                            cc1.setConnection();
                            string t_ct_ad = (ct_ad + 1).ToString();
                            cc1.setCommand("insert into booked_packages(p_id,user_id,eticket_id,adults,child,total_cost,status) values(@p_id,@user_id,@et,@adults,@child,@tc,@s1)");
                            cc1.setParameter("@p_id", y);
                            cc1.setParameter("@user_id",z);
                            cc1.setParameter("@et", et);
                            cc1.setParameter("@adults", t_ct_ad.ToString());
                            cc1.setParameter("@child",ct_ch.ToString());
                            cc1.setParameter("@tc", total_cost);
                            cc1.setParameter("@s1","booked");
                            cc1.openConnection();
                            int b = cc1.getDMLResults();
                            cc1.closeConnection();
                            if (b > 0)
                            {
                                int flag1 = 0;
                                for (int o = 0; o < ct_ad; o++)
                                {
                                    string x = adults[o].ToString();
                                    ConnectClass cc2 = new ConnectClass();
                                    cc2.setConnection();
                                    cc2.setCommand("insert into members(eticket_id,name,a_or_c) values(@eticket,@ne,@a_or_c)");
                                    cc2.setParameter("@eticket", et);
                                    cc2.setParameter("@ne", x);
                                    cc2.setParameter("@a_or_c", "adult");
                                    cc2.openConnection();
                                    int c = cc2.getDMLResults();
                                    cc2.closeConnection();
                                    if (c > 0)
                                    {
                                        flag1 = 0;
                                        continue;
                                    }
                                    else
                                    {
                                        flag1 = 1;
                                        break;
                                    }
                                }

                                if (flag1 == 1)
                                {
                                    //FAILURE
                                }
                                else
                                {
                                    flag1 = 0;

                                    for (int o = 0; o < ct_ch; o++)
                                    {
                                        ConnectClass cc3 = new ConnectClass();
                                        cc3.setConnection();
                                        string x = children[o].ToString();
                                        cc3.setCommand("insert into members(eticket_id,name,a_or_c) values(@et,@name,'child')");
                                        cc3.setParameter("@et", et);
                                        cc3.setParameter("@name", x);
                                        cc3.openConnection();
                                        int c = cc3.getDMLResults();
                                        cc3.closeConnection();
                                        if (c > 0)
                                        {
                                            flag1 = 0;
                                            continue;
                                        }
                                        else
                                        {
                                            flag1 = 1;
                                            break;
                                        }
                                    }
                                    if (flag1 == 1)
                                    {
                                        //FAILURE
                                    }
                                    else
                                    {
                                        //FINAL SUCCESS--------------------ALL ADDED
                                        old_traveller.Visible = false;
                                        final.Visible = true;
                                    }


                                }

                            }
                            else
                            {
                                //FAILURE
                            }

                        }
                        else
                        {
                            //FAILURE
                        }



                    }
                    else
                    {
                        
                        string et =System.DateTime.Today + Session["u_package_id"].ToString() + Session["id"].ToString();
                        cc.setCommand("insert into eticket(user_id,t_name,t_contact,eticket_id) values(@e,@r,@t,@y)");
                        cc.setParameter("@e", Session["id"].ToString());
                        cc.setParameter("@r", name);
                        cc.setParameter("@t", contact);
                        cc.setParameter("@y", et);
                        cc.openConnection();
                        int a = cc.getDMLResults();
                        cc.closeConnection();
                        if (a > 0)
                        {
                            string total_cost = adult_cost.ToString();
                            ConnectClass cc2 = new ConnectClass();
                            cc2.setConnection();
                            cc2.setCommand("insert into booked_packages(p_id,user_id,eticket_id,adults,child,total_cost,status) values(@p_id,@user_id,@et,@adults,@child,@tc,@s2)");
                            cc2.setParameter("@p_id", Session["u_package_id"].ToString());
                            cc2.setParameter("@user_id", Session["id"].ToString());
                            cc2.setParameter("@et", et);
                            cc2.setParameter("@adults", "1");
                            cc2.setParameter("@child", "0");
                            cc2.setParameter("@tc", total_cost);
                            cc2.setParameter("@s2","booked");
                            cc2.openConnection();
                            int b = cc2.getDMLResults();
                            cc2.closeConnection();
                            if (b > 0)
                            {
                                //SUCCESS
                                old_traveller.Visible = false;
                                final.Visible = true;
                            }
                            else
                            {
                                //FAILURE
                            }
                        }
                        else
                        {
                            //FAILURE
                        }



                    }

                }
                else
                {
                    Response.Redirect("home.aspx?m=Session timed Out. Try Again!");
                }
            }
        }

        public void back_btn_click(object sender,CommandEventArgs e)
        {
          if(e.CommandArgument.ToString() == "back2")
            {
                new_traveller.Visible = false;
                old_traveller.Visible = false;
                if(Session["alone"].ToString()=="yes")
                {
                    up.Visible = true;
                }
                else
                {
                    family.Visible = true;
                }
            }
          else
            {
                if(Session["alone"]!=null && Session["alone"].ToString()=="no")
                {
                    Session["count_adult"]=null;
                    Session["count_child"]= null;
                    family.Visible = false;
                    up.Visible = true;
                }
                else
                {
                    Session["count_adult"] = null;
                    Session["count_child"] = null;
                    up.Visible = false;
                    family.Visible = false;
                    select_div.Visible = true;
                }
            }
        }

        public void b3_click(object sender,EventArgs e)
        {
            string ad = ad_count.Text;
            string ch = ch_count.Text;
            ct_ad = Int32.Parse(ad);
            ct_ch = Int32.Parse(ch);

            Session["count_adult"] = ct_ad;
            Session["count_child"] = ct_ch;
            int value1 = Int32.Parse(ca.InnerText);
            int value2 = Int32.Parse(cc1.InnerText);
            int tot = (value1 * ct_ad) + (value2 * ct_ch) + value1;
            charges_old.InnerText = tot.ToString();
            if (Session["traveller"] != null && Session["traveller"].ToString() == "yes")
            {
                 for (int i = 0; i < ct_ad; i++)
                 {
                    Label lb = new Label();
                    lb.Text = "Adult"+(i+1);
                    lb.CssClass = "blue-text";
                    TextBox tb = new TextBox();
                    tb.ID = "adult_input"+(i+1);
                    tb.CssClass = "blue-text";
                    UpdatePanel1.ContentTemplateContainer.Controls.Add(lb);
                    UpdatePanel1.ContentTemplateContainer.Controls.Add(tb);
                    ph.Controls.Add(lb);
                    ph.Controls.Add(tb);        
                }


                 for (int i = 0; i < ct_ch; i++)
                 {
                    Label lb = new Label();
                    lb.Text = "Child" + (i + 1);
                    lb.CssClass = "blue-text";
                    TextBox tb = new TextBox();
                    tb.ID = "child_input" + (i + 1);
                    tb.CssClass = "blue-text";
                    UpdatePanel1.ContentTemplateContainer.Controls.Add(lb);
                    UpdatePanel1.ContentTemplateContainer.Controls.Add(tb);
                    ph.Controls.Add(lb);
                    ph.Controls.Add(tb);

                }
                old_traveller.Visible = true;
            }
            else if (Session["traveller"] != null && Session["traveller"].ToString() == "no")
            {
                int value3 = Int32.Parse(ca.InnerText);
                int value4 = Int32.Parse(cc1.InnerText);
                int tot1 = (value3 * ct_ad) + (value4 * ct_ch) + value3;
                charges_new.InnerText = tot1.ToString();

                for (int i = 0; i < ct_ad; i++)
                {
                    Label lb = new Label();
                    lb.Text = "Adult" + (i + 1);
                    lb.CssClass = "blue-text";
                    TextBox tb = new TextBox();
                    tb.ID = "adult_input" + (i + 1);
                    tb.CssClass = "blue-text";
                    UpdatePanel1.ContentTemplateContainer.Controls.Add(lb);
                    UpdatePanel1.ContentTemplateContainer.Controls.Add(tb);
                    ph1.Controls.Add(lb);
                    ph1.Controls.Add(tb);

                }


                for (int i = 0; i < ct_ch; i++)
                {
                    Label lb = new Label();
                    lb.Text = "Child" + (i + 1);
                    lb.CssClass = "blue-text";
                    TextBox tb = new TextBox();
                    tb.ID = "child_input" + (i + 1);
                    tb.CssClass = "blue-text";
                    UpdatePanel1.ContentTemplateContainer.Controls.Add(lb);
                    UpdatePanel1.ContentTemplateContainer.Controls.Add(tb);
                    ph1.Controls.Add(lb);
                    ph1.Controls.Add(tb);

                }
                new_traveller.Visible = true;
            }
            else
            {
                Response.Redirect("home.aspx?m=Session timed out.Try Again!");
            }

        }

        public void b1_click(object sender,EventArgs e)
        {
            string variable=traveler.Value;
           if(variable=="yes")
            {
                Session["traveller"]= "yes";
             //   old_traveller.Visible = true;
            }
          else  if(variable=="no")
            {
                Session["traveller"] = "no";
             
            }
            else
            {
                Response.Redirect("home.aspx?m=Provide your response correctly.Try Again!");
            }
            select_div.Visible = false;
            up.Visible = true;
        }


        public void b2_click(object sender, EventArgs e)
        {
            string v="";
           if(r1.Checked)
            {
                v = r1.Text;
            }
           else if (r2.Checked)
            {
                v= r2.Text;
            }

            if (v == "yes")
            {
                Session["alone"] = "yes";
            }
            else if (v == "no")
            {
                Session["alone"] = "no";
            }

            up.Visible = false;

            if(Session["alone"]!=null && Session["alone"].ToString()=="no")
            {
                Session["count_adult"] = null;
                Session["count_child"] = null;
                family.Visible = true;
            }
            else if(Session["alone"] != null && Session["alone"].ToString() == "yes")
            {
                if (Session["traveller"] != null && Session["traveller"].ToString() == "yes")
                {
                    Session["count_adult"] = "0";
                    Session["count_child"] = "0";
                    charges_old.InnerText = ca.InnerText;
                    old_traveller.Visible = true;
                }
                else if (Session["traveller"] != null && Session["traveller"].ToString() == "no")
                {
                    Session["count_adult"] = "0";
                    Session["count_child"] = "0";
                    charges_new.InnerText = ca.InnerText;
                    new_traveller.Visible = true;
                }
                else
                {
                    Response.Redirect("home.aspx?m=Session timed out.Try Again!");
                }
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"]==null)
            {
                Response.Redirect("index.aspx?m=Login First!!");
            }

           
           up.Visible= false;
            final.Visible = false;
            family.Visible = false;
            new_traveller.Visible = false;
            old_traveller.Visible = false;
            if (Session["u_package_id"]==null)
            {
                Response.Redirect("home.aspx?m=Select a package first");
            }


            user = Session["id"].ToString();
            package = Session["u_package_id"].ToString();


            if (Session["count_adult"] != null && Session["count_child"]!=null )
                {
                    ct_ad = Int32.Parse(Session["count_adult"].ToString());
                    ct_ch = Int32.Parse(Session["count_child"].ToString());

                    for (int i = 0; i < ct_ad; i++)
                    {
                        Label lb = new Label();
                        lb.Text = "Adult" + (i + 1);
                        lb.CssClass = "blue-text";
                        TextBox tb = new TextBox();
                        tb.ID = "adult_input" + (i + 1);
                        tb.CssClass = "blue-text";
                        UpdatePanel1.ContentTemplateContainer.Controls.Add(lb);
                        UpdatePanel1.ContentTemplateContainer.Controls.Add(tb);
                        ph.Controls.Add(lb);
                        ph.Controls.Add(tb);

                    }


                    for (int i = 0; i < ct_ch; i++)
                    {
                        Label lb = new Label();
                        lb.Text = "Child" + (i + 1);
                        lb.CssClass = "blue-text";
                        TextBox tb = new TextBox();
                        tb.ID = "child_input" + (i + 1);
                        tb.CssClass = "blue-text";
                        UpdatePanel1.ContentTemplateContainer.Controls.Add(lb);
                        UpdatePanel1.ContentTemplateContainer.Controls.Add(tb);
                        ph.Controls.Add(lb);
                        ph.Controls.Add(tb);

                    }

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

            r.Close();

            cc.setCommand("select * from starred where user_id=@user_id and p_id=@p_id");
            cc.setParameter("@user_id",Session["id"].ToString());
            cc.setParameter("@p_id",Session["u_package_id"].ToString());
            SqlDataReader r1 = cc.getDDLResults();

            if (r1.Read())
            {
                save = "none";
               
            }
            else
            {
                save = "";
       
            }
        }
    }
}