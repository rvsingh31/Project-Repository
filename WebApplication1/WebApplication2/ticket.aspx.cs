using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;
using System.Web.SessionState;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Connect;
using System.Collections;
using System.Drawing;

namespace WebApplication2
{
    public partial class ticket : System.Web.UI.Page
    {
        private static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, BaseColor color)
        {
                         
            PdfContentByte contentByte = writer.DirectContent;
            contentByte.SetColorStroke(color);
            contentByte.MoveTo(x1, y1);
            contentByte.LineTo(x2, y2);
            contentByte.Stroke();
        }
        private static PdfPCell PhraseCell(Phrase phrase, int align)
        {
            PdfPCell cell = new PdfPCell(phrase);
            cell.BorderColor = iTextSharp.text.BaseColor.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 2f;
            cell.PaddingTop = 0f;
            return cell;
        }
        private static PdfPCell ImageCell(string path, float scale, int align)
        {
            iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(path));
            image.ScalePercent(scale);
            PdfPCell cell = new PdfPCell(image);
            cell.BorderColor = iTextSharp.text.BaseColor.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 0f;
            cell.PaddingTop = 0f;
            return cell;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["eticket_id"]==null || Session["id"]==null)
            {
                Response.Redirect("home.aspx?m=Select a booked package to show its e-ticket .");
            }
            
            ConnectClass cc = new ConnectClass();
            cc.setConnection();
            cc.setCommand("select a_name,a_contact,p_name,eticket_id,adults,child,total_cost,expiry_date,duration from (package_details join agency_details on (package_details.a_id=agency_details.a_id) join booked_packages on (package_details.p_id=booked_packages.p_id)) where eticket_id=@ticket");
            cc.setParameter("@ticket",Request.QueryString["eticket_id"].ToString());
            cc.openConnection();
            SqlDataReader r = cc.getDDLResults();
            r.Read();
            string agency_name = r["a_name"].ToString();
            string agency_contact = r["a_contact"].ToString();
            string package_name = r["p_name"].ToString();
            string eticket_id = r["eticket_id"].ToString();
            int adults = Int32.Parse(r["adults"].ToString());
            int child = Int32.Parse(r["child"].ToString());
            string total_cost = r["total_cost"].ToString();
            string trip_date = r["expiry_date"].ToString();
            string duration = r["duration"].ToString();
            r.Close();
            ArrayList adult_names = new ArrayList();
            ArrayList child_names = new ArrayList();
            if (adults>1 || child >0)
            {
                cc.setCommand("select name,a_or_c from members where eticket_id=@t");
                cc.setParameter("@t", Request.QueryString["eticket_id"].ToString());
                SqlDataReader r1 = cc.getDDLResults();
                while (r1.Read())
                {
                    if(r1["a_or_c"].ToString()=="child")
                    {
                        child_names.Add(r1["name"]);
                    }
                    else
                    {
                        adult_names.Add(r1["name"]);
                    }
                }
                r1.Close();
            }
            cc.setCommand("select t_name,t_contact from eticket where eticket_id=@t2");
            cc.setParameter("@t2", Request.QueryString["eticket_id"].ToString());
            SqlDataReader r2 = cc.getDDLResults();
            r2.Read();
            string t_name = r2["t_name"].ToString();
            string t_contact = r2["t_contact"].ToString();


            //------------------------ETICKET_GENERATION STARTS----------------------------

            Document document = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
            iTextSharp.text.Font NormalFont = FontFactory.GetFont("Arial", 12, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
            using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
            {
                PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                Phrase phrase = null;
                PdfPCell cell = null;
                PdfPTable table = null;
                BaseColor color;

                document.Open();

                //Header Table
                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });

                //Company Name and Address
                phrase = new Phrase();
                phrase.Add(new Chunk("Easy-Travel", FontFactory.GetFont("Arial", 22, iTextSharp.text.Font.BOLD, BaseColor.RED)));
               cell = PhraseCell(phrase, PdfPCell.ALIGN_CENTER);
                cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                table.AddCell(cell);

                //Separater Line
                color = new BaseColor(169, 169, 169);
                DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
                DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);
                document.Add(table);
                
                          table = new PdfPTable(1);
                          table.TotalWidth = 500f;
                           table.LockedWidth = true;
                            table.SetWidths(new float[] { 0.7f });
                         table.SpacingBefore = 90f;

                       //Package and Agency Details
                       cell = PhraseCell(new Phrase("Package and Agency Details\n", FontFactory.GetFont("Arial", 12, iTextSharp.text.Font.UNDERLINE, BaseColor.RED)), PdfPCell.ALIGN_CENTER);
                       table.AddCell(cell);
                       cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);
                       
                    table.AddCell(cell);
                document.Add(table);

                //    DrawLine(writer, 160f, 80f, 160f, 690f, BaseColor.BLACK);
                     //  DrawLine(writer, 115f, document.Top - 200f, document.PageSize.Width - 100f, document.Top - 200f, BaseColor.BLACK);


                   
                       //Package_name
                     table = new PdfPTable(1);
                          table.TotalWidth = 500f;
                           table.LockedWidth = true;
                            table.SetWidths(new float[] { 0.7f });
                         table.SpacingBefore = 20f;

                 
                       cell = PhraseCell(new Phrase("Package Name:"+package_name+"\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                       table.AddCell(cell);
                       cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);
                       
                    table.AddCell(cell);
                document.Add(table);


                //Trip Date

                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

               
                cell = PhraseCell(new Phrase("Trip-Date:" + trip_date + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);


                //Duration

                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

                
                cell = PhraseCell(new Phrase("Duration of Trip:" + duration + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);


                //Agency_name

                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

                
                cell = PhraseCell(new Phrase("Agency which provides the package:" + agency_name + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);


                //Agency_Contact

                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

             
                cell = PhraseCell(new Phrase("Contact the agency here :" + agency_contact + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);


              //Ticket Details
             table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

               
                cell = PhraseCell(new Phrase("Ticket Details\n", FontFactory.GetFont("Arial", 12, iTextSharp.text.Font.UNDERLINE, BaseColor.RED)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);

                //Eticket_Id
                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

                cell = PhraseCell(new Phrase("E-Ticket ID:" + eticket_id + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);

                //Main Traveller 
                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

              
                cell = PhraseCell(new Phrase("Ticket booked in the name of:" + t_name + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);

                //T_Contact
                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

               
                cell = PhraseCell(new Phrase("Contact Number:" + t_contact + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);
                if (adult_names.Count!=0 || child_names.Count!=0)
                       {
                    //Family_members
                    table = new PdfPTable(1);
                    table.TotalWidth = 500f;
                    table.LockedWidth = true;
                    table.SetWidths(new float[] { 0.7f });
                    table.SpacingBefore = 20f;

                    
                    cell = PhraseCell(new Phrase("Family Members\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.UNDERLINE, BaseColor.RED)), PdfPCell.ALIGN_CENTER);
                    table.AddCell(cell);
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                    table.AddCell(cell);
                    document.Add(table);


                    if (adult_names.Count!=0)
                           {
                               string s="";
                               for(int i=0;i<adult_names.Count;i++)
                               {
                                   s += adult_names[i].ToString();
                                   s += ", ";
                               }
                        //adults
                        table = new PdfPTable(1);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.7f });
                        table.SpacingBefore = 20f;

                        cell = PhraseCell(new Phrase("Adults:" + s + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                        table.AddCell(cell);
                        cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                        table.AddCell(cell);
                        document.Add(table);


                    }

                    if (child_names.Count != 0)
                           {
                               string s = "";
                               for (int i = 0; i < child_names.Count; i++)
                               {
                                   s += child_names[i].ToString();
                                   s += ", ";
                               }
                        //children
                        table = new PdfPTable(1);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.7f });
                        table.SpacingBefore = 20f;

                       
                        cell = PhraseCell(new Phrase("Children:" + s + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                        table.AddCell(cell);
                        cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                        table.AddCell(cell);
                        document.Add(table);


                    }

                }
                       else
                       {
                    //No members
                    table = new PdfPTable(1);
                    table.TotalWidth = 500f;
                    table.LockedWidth = true;
                    table.SetWidths(new float[] { 0.7f });
                    table.SpacingBefore = 20f;

                   
                    cell = PhraseCell(new Phrase("Family Members:NONE\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.UNDERLINE, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                    table.AddCell(cell);
                    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                    table.AddCell(cell);
                    document.Add(table);



                }

                //Total Cost
                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f });
                table.SpacingBefore = 20f;

             
                cell = PhraseCell(new Phrase("Total Cost:" + total_cost + "\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_LEFT);

                table.AddCell(cell);
                document.Add(table);




                //Addtional Information

                table = new PdfPTable(1);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.7f});

                //Company Name and Address
                phrase = new Phrase();
                phrase.Add(new Chunk("For Any Kind of Queries , you may contact : +91-8460348865\n", FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.BOLD, BaseColor.RED)));
                cell = PhraseCell(phrase, PdfPCell.ALIGN_CENTER);
                cell.PaddingTop = 20f;
                cell.VerticalAlignment = PdfPCell.ALIGN_BOTTOM;
                table.AddCell(cell);
                document.Add(table);
                document.Close();
                byte[] bytes = memoryStream.ToArray();
                memoryStream.Close();
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=ETicket.pdf");
                Response.ContentType = "application/pdf";
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.End();
                Response.Close();
            }
        }
    }
}