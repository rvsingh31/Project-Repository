<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="a_home.aspx.cs" Inherits="WebApplication2.agency.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - Agency</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>

      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        .close_div{
            cursor:pointer;
        }
    </style>
</head>
<body class="blue lighten-4">
    <nav class="blue lighten-1">
        <a href="#!"><asp:Label ID="i_lbl" class="white-text left" runat="server" Text="Easy Travel"></asp:Label></a>   
        <ul class="right">
                <li>
                        <a href="#!" class="white-text"><asp:Label ID="a_lbl" runat="server" Text=""></asp:Label></a>
                 
                </li>
               <li>
                  <a href="logout.aspx" class="white-text">Log Out</a>
                 
               </li>
           </ul>
    </nav>
           <asp:Label runat="server" class="blue-text text-lighten-4" id="error_lbl" Text=""></asp:Label>

    <br />
    <br />
    <form id="form1" runat="server">
         <div class="row">
            

             <div class="col s12 m12 card-panel"  style="background:url('agency2.jpg')" >

                 <br />
                 <div class="row" >
                     <div class="col m7 s12">
                     </div>
                     <div runat="server"  class="col m4 s12 card-panel" id="new_agency" style="border-radius:.5%">
                          <h6 class="teal-text center"><strong>It's time to get to know each other!</strong></h6>

                         <br />
                              <div class="input-field">
                                    <asp:Label ID="n_lbl" runat="server" class="blue-text text-darken-2" Text="Agency's Name"></asp:Label>
                                    <asp:TextBox ID="a_name" runat="server" class="blue-text text-darken-2"></asp:TextBox>
                              </div>
                              <div class="input-field">
                                    <asp:Label ID="d_lbl" runat="server" class="blue-text text-darken-2" Text="Agency's Description"></asp:Label>
                                    <asp:TextBox ID="desc" runat="server" class="blue-text text-darken-2"></asp:TextBox>
                              </div>
                    
            
                              <div class="input-field">
                                    <asp:Label ID="add_lbl" runat="server" class="blue-text text-darken-2" Text="Agency's Address"></asp:Label>
                                    <asp:TextBox ID="address" runat="server" class="blue-text text-darken-2"></asp:TextBox>
                              </div>
            
                         
                              <div class="input-field">
                                    <asp:Label ID="c_lbl" runat="server" class="blue-text text-darken-2" Text="Agency's Contact"></asp:Label>
                                    <asp:TextBox ID="a_contact" runat="server" class="blue-text text-darken-2"></asp:TextBox>
                              </div>

                           <asp:Button ID="details_btn" class="btn waves-effect waves-light right blue darken-1 white-text" runat="server" Text="Save Details" OnClick="details_btn_Click" /> 
                                <br />
                         <br />                     
                    </div>
                     <div class="col s12 m3 card-panel" id="slide_div" runat="server" style="position:absolute;right:17.3%;display:none">
                                  
                                    <div id="name_div" style="display:none">
                                        <span class="left red-text close_div">CLOSE</span>
                                        <h6 class="teal-text center"><strong>Change your Agency's Name !</strong></h6>
                                          <br />
                                            <h6 class="teal-text">
                                                <strong>Current :</strong>
                                                <span>
                                                    <asp:Label ID="current_name" class="blue-text" runat="server" Text=""></asp:Label>
                                                </span>
                                            </h6>
                                        <br />
                                          <div class="input-field">
                                              <asp:Label ID="ch_n_lbl" runat="server" class="blue-text " Text="New Name"></asp:Label> 
                                              <asp:TextBox ID="new_name" class="blue-text" runat="server"></asp:TextBox>
                                          </div>
                                      
                                        <div>
                                                <asp:Button ID="save_name" class="btn blue lighten-1 white-text" runat="server" Text="Update"  OnClick="Save_Name_Click"/>
                                       &nbsp;&nbsp;  
                                             <button id="reset_name" class="btn blue lighten-1 white-text" type="reset">Cancel</button>
                             
                                        </div>
                                        <br />
                                        </div>
                                 
                                    <div id="address_div" style="display:none;"> 
                                        <span class="left red-text close_div">CLOSE</span>
                                          <h6 class="teal-text center"><strong>Change your Agency's Address !</strong></h6>
                                          <br />
                                            <h6 class="teal-text">
                                                <strong>Current :</strong>
                                                <span>
                                                    <asp:Label ID="current_address" class="blue-text" runat="server" Text=""></asp:Label>
                                                </span>
                                            </h6>
                                        <br />
                                          <div class="input-field">
                                              <asp:Label ID="ch_a_lbl" runat="server" class="blue-text " Text="New Address"></asp:Label> 
                                              <asp:TextBox ID="new_address" class="blue-text" runat="server"></asp:TextBox>
                                          </div>
                                     
                                        <div>
                                                <asp:Button ID="Button1" class="btn blue lighten-1 white-text " runat="server" Text="Update"  OnClick="Save_Address_Click"/>
                                         &nbsp;&nbsp;  
                                                    <button id="reset_address" class="btn blue lighten-1 white-text " type="reset">Cancel</button>
                             
                                        </div>
                                       <br />
                                        

                                    </div>
                                    <div id="contact_div" style="display:none;"> 
                                        <span class="left red-text close_div">CLOSE</span>
                                        <h6 class="teal-text center"><strong>Change your Agency's Contact !</strong></h6>
                                          <br />
                                            <h6 class="teal-text">
                                                <strong>Current :</strong>
                                                <span>
                                                    <asp:Label ID="current_contact" runat="server"  class="blue-text" Text=""></asp:Label>
                                                </span>
                                            </h6>
                                        <br />
                                          <div class="input-field">
                                              <asp:Label ID="ch_c_lbl" runat="server" class="blue-text " Text="New Contact"></asp:Label> 
                                              <asp:TextBox ID="new_contact" class="blue-text" runat="server"></asp:TextBox>
                                          </div>
                                 
                                        <div>
                                                <asp:Button ID="Button2" class="btn blue lighten-1 white-text " runat="server" Text="Update"  OnClick="Save_Contact_Click" />
                                             &nbsp;&nbsp;      
                                            <button id="reset_contact" class="btn blue lighten-1 white-text " type="reset">Cancel</button>
                             
                                        </div>
                                        <br />
                                    </div>
                                    <div id="description_div" style="display:none;">
                                        <span class="left red-text close_div">CLOSE</span>
                                        <h6 class="teal-text center"><strong>Change your Agency's Description !</strong></h6>
                                          <br />
                                            <h6 class="teal-text">
                                                <strong>Current :</strong>
                                                <span>
                                                    <asp:Label ID="current_description" runat="server" class="blue-text" Text=""></asp:Label>
                                                </span>
                                            </h6>
                                        <br />
                                          <div class="input-field">
                                              <asp:Label ID="ch_de_lbl" runat="server" class="blue-text " Text="New Description"></asp:Label> 
                                              <asp:TextBox ID="new_description" class="blue-text" runat="server"></asp:TextBox>
                                          </div>
                                     
                                        <div>
                                                <asp:Button ID="Button3" class="btn blue lighten-1 white-text " runat="server" Text="Update"  OnClick="Save_Description_Click"/>
                                             &nbsp;&nbsp;      
                                            <button id="reset_description" class="btn blue lighten-1 white-text " type="reset">Cancel</button>
                             
                                        </div>
                                        <br />
                                    </div>
                     
                           </div>

                           
                      
                           <div runat="server" class="col m3 s12 card-panel" id="old_agency" style="position:relative">
                             <div>  
                               <h6 class="teal-text"><strong>Edit Your Agency Details</strong></h6>
                               <br />

                               <a href="#name_div" id="name_btn" class="btn blue lighten-1 white-text waves-effect waves-light">Name</a>
                               <br />
                               <br />
                               <a href="#address_div" id="address_btn" class="btn blue lighten-1 white-text waves-effect waves-light">Address</a>
                               <br />
                               <br />
                               <a href="#contact_div" id="contact_btn"  class="btn blue lighten-1 white-text waves-effect waves-light">Contact</a>
                               <br />
                               <br />
                               <a href="#description_div" id="desc_btn" class="btn blue lighten-1 white-text waves-effect waves-light">Description</a>
                               <br />
                               <br />
                              </div>

                             
                           </div>
                           
                           
                        <div class="col s12 m1" id="temp_div" runat="server">
                         <p></p>
                     </div>
                           
                 </div>         




             </div>

         </div>
        <br />
        <div class="row"  id="pm"  runat="server">
              <div class="col s12 m8 blue darken-1 ">
                
                  <div class="row">
                        <div class="col s12 ">
                            <ul class="tabs blue darken-1">
                                <li class="tab col s3 "><a href="#add" class="active white-text">Add New Package</a></li>
                                <li class="tab col s3 "><a class="white-text" href="#edit">Edit Packages</a></li>
                             </ul>
                         </div>
        

                         <div id="add" class="col s12  white-text" style="height:20em;overflow-y:auto">
                         <div class="row">   

                          <div class="col s12 m6">    
                             <div class="input-field col s12">
                                <asp:Label ID="pname_lbl" runat="server" class="white-text" Text="Package Name"></asp:Label>
                                <asp:TextBox ID="pname" runat="server" class="white-text"></asp:TextBox>
                            </div>
                             <div class="input-field col s12">
                                <asp:Label ID="p_desc_lbl" runat="server" class="white-text" Text="Package Description"></asp:Label>
                                <asp:TextBox ID="pdesc" runat="server" class="white-text"></asp:TextBox>
                            </div>
                              <div class="input-field col s12">
                                <asp:Label ID="cost_a_lbl" runat="server" class="white-text" Text="Charges(Per Adult)"></asp:Label>
                                <asp:TextBox ID="a_cost" runat="server" class="white-text"></asp:TextBox>
                            </div>
                              <div class="input-field col s12">
                                <asp:Label ID="cost_c_lbl" runat="server" class="white-text" Text="Charges(Per Child)"></asp:Label>
                                <asp:TextBox ID="c_cost" runat="server" class="white-text"></asp:TextBox>
                            </div>
                              <div class="input-field col s12">
                                <asp:Label ID="limit_lbl" runat="server" class="white-text" Text="Limit of Users"></asp:Label>
                                <asp:TextBox ID="limit" runat="server" class="white-text"></asp:TextBox>
                            </div>
                              <div class="input-field col s12">
                                <asp:Label ID="venue_lbl" runat="server" class="white-text" Text="Location"></asp:Label>
                                <asp:TextBox ID="location" runat="server" class="white-text"></asp:TextBox>
                            </div>
                              <div class="col s12">
                                <asp:Label ID="duration_lbl" runat="server" class="white-text" Text="Package Duration"></asp:Label>
                                  <div class="row">
                                        <div class="input-field col s6 ">
                                            <asp:TextBox ID="days" runat="server" placeholder="Days" class="white-text"></asp:TextBox>
                                       </div>
                                       <div class="input-field col s6 ">
                                           <asp:TextBox ID="nights" runat="server" placeholder="Nights"  class="white-text"></asp:TextBox>
                                       </div>
                                  </div>
                              </div>
                              <div class="input-field col s12">
                                <asp:Label ID="exp_lbl" runat="server" class="white-text" Text="Trip Date"></asp:Label>
                                  <asp:TextBox ID="expiry_date" class="datepicker" runat="server"></asp:TextBox>
                            </div>
                              <br />
                              <div class="col s12 ">
                              <asp:Label runat="server" Text="Upload Image (Only JPEG accepted)" class="white-text"></asp:Label>
                              <br />
                            <asp:FileUpload runat="server" ID="f1" ></asp:FileUpload>
                              
                                  <br />
                              <br />
                              </div>
                                  <asp:Button ID="add_package_btn" class="btn white blue-text waves-effect waves-light" runat="server" Text="Add" OnClick="Add_Package_Click" />
                              <br />
                           </div>


                          </div>  
     
                         </div>
                         <div id="edit" class="col s12 white-text" style="height:20em;overflow-y:auto">
                             <br />
                               <h6 class="yellow-text center"><strong>Below listed packages are the ones which you uploaded!</strong></h6>                             
                               <div class="row">
                                   
                                   <%    if (packages != "")
                                       {
                                         %>  
                                        
                                    <div class="col s12 m1">
                                        <p></p>
                                    </div>

                                       <% 


                                            // while (r.Read())
                                          for(q=0;q<ar1.Count;q++)
                                           {
                                               if(count==2)
                                               {
                                                   count = 0;   %>

                                        <div class="col s12 m1">
											<p></p>
											</div>
										</div>
										
											<div class="row">
												<div class="col s12 m1">
												<p></p>
												</div>
                                   <% 
                                           }
                                            %>

                                       
                                    <div class="col s12 m4 card-panel  hoverable">
                                        <br />
                                        <a href="intr_sess.aspx?id=<%=ar2[q] %>&name=<%=ar1[q] %>"><h6 class="blue-text center"><%= ar1[q] %></h6></a>
                                        <h6 class="red-text darken-1 right">Remove</h6>
                                    </div>
                                    
                                   <div class="col s12 m1 ">
                                        <p></p>
                                    </div>

                                   <% count++;      }
                                                } %>
                                   <% else { %>
                                    <br />
                                           <h6 class="white-text center">No packages to show!</h6>

                                   <%  } %>

                               </div>
                         </div>
                    </div>
                  </div>
            <div class="col s12 m1">
                <p></p>
            </div>
            <div class="col s12 m3 blue darken-1 white-text" style="height:20em;overflow-y:auto">
                <h6 class="white-text center"><strong>Enquiries</strong></h6>
                <br /> 
                <div class="divider orange lighten-4"></div>
                <div class="white-text" runat="server" id="inquiries_div">

                </div>    
            </div>

       </div>

        <br />
        <div class="row" runat="server" id="pm2"> 
            <div class="col s12 m12 card-panel blue" style="background:url('b2.jpg') no-repeat;height:22em">
                <div class="row">
                    <div class="col s12 m6 right">
                        <div class="row">
                            <div class="col s12">
                                  <ul class="tabs blue">
                                     
                                     <li class="tab col s3 "><a href="#booking" class="white-text">Bookings</a></li>
                                     <li class="tab col s3"><a href="#cancel" class="white-text">Cancellations <span class="yellow-text">[<%=ar4.Count/3 %>]</span></a></li>
                                    </ul>
                           </div>
                            <div id="booking" class="col s12" style="overflow-y:auto;height:18em">
                                <h6 class="yellow-text center">Respective Bookings for Packages!</h6>
                                <br />
                                <div class="collection" style="border:none;">
                                    <% if (ar3.Count != 0)
                                                        {
                                                            for (int i = 0; i < ar3.Count; i = i + 3)
                                                            {%>
                                        
                                            <a href="intr_sess.aspx?type=show&p_id=<%=ar3[i + 1] %>" style="background:#2196F3" class="collection-item white-text">
                                                Package-Name : &nbsp;
                                                <span class="yellow-text">
                                                    <%=ar3[i] %>
                                                </span>
                                                <br />
                                                Total Registrations: &nbsp;
                                                <span class="yellow-text">
                                                    <%=ar3[i + 2] %>
                                                </span>
                                            </a>            

                                     <%       }
                                                        }
                                                        else
                                                        {  %>
                                                        <h6 class="yellow-text center">No Bookings Yet !!</h6>
                                                    <%    } %>
                                </div>
                            </div>
                            <div id="cancel" class="col s12">
                                    <h6 class="yellow-text center">Cancellations and Refunds!</h6>
                                     <br />
                                <div >
                                    <% if (ar4.Count != 0)
                                                        {
                                                            for (int i = 0; i < ar4.Count; i = i + 3)
                                                            {%>
                                                   <div>
                                                       <div class="row">
                                                           <div class="col s12 m6 white-text left">
                                                               Package-Name :<%=ar4[i+1] %>
                                                               <br />
                                                               User: <%=ar4[i] %>
                                                           </div>
                                                           <div class="col s12 m6 right">
                                                               <a href="refund.aspx?<%=ar4[i+2] %>" class="btn modal-trigger white blue-text waves-effect waves-light" >REFUND COMPLETE ?</a>
                                                           </div>
                                                           
                                                       </div>
                                                   </div>
                                                

                                                    <div class="divider white lighten-1"></div>
                                                     <br />
                                                <%   }
                                                        }
                                                        else
                                                        {  %>

                                                        <h6 class="yellow-text center">No Cancellations Yet !!</h6>
                                      
                                                  <%    } %>

                                                  
                                         </div>

                                <br />
                            </div>
                         </div>

                    </div>
                </div> 
            </div>  
        </div>
    </form>
    
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="/js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    
   <script type="text/javascript">

       var str = document.getElementById("error_lbl").innerHTML;
      
       if (str != "") {
           Materialize.toast(str, 2000, 'rounded');
       }
          </script>

    <script>
        $(document).ready(function () {


            $('.datepicker').pickadate({
                selectMonths: true,
                selectYears: 15,
                format: 'dd/mm/yyyy'
            });
            $('.modal-trigger').leanModal();
            $('ul.tabs').tabs();

            $('#name_btn').click(function () {

                if ($("#slide_div").is(':visible')) {
                    $("#slide_div").animate({ 'right': '240px' });
                 //   $('#slide_div').fadeOut();

                  
                    if ($("#address_div").is(':visible')) {
                        $("#address_div").fadeOut();
                    }
                    else if ($("#contact_div").is(':visible')) {
                        $("#contact_div").fadeOut();
                    }
                    else if ($("#description_div").is(':visible')) {
                        $("#description_div").fadeOut();
                    }

                }

                if ($("#name_div").is(':visible')) {
                    $("#name_div").fadeOut();
                    $("#slide_div").animate({ 'right': '240px' });
                    $('#slide_div').fadeOut();

                }
                else {


                    setTimeout(function () {

                        $('#name_div').fadeIn();
                       $('#slide_div').fadeIn();
                        $("#slide_div").animate({ 'right': '560px' });


                    }, 650);
                }
            });


            $('#address_btn').click(function () {

                if($("#slide_div").is(':visible'))
                {
                    $("#slide_div").animate({ 'right': '240px' });
                  //  $('#slide_div').fadeOut();

                    if($("#name_div").is(':visible')){
                        $("#name_div").fadeOut();
                    }
                    else if ($("#contact_div").is(':visible')) {
                        $("#contact_div").fadeOut();
                    }
                    else if ($("#description_div").is(':visible')) {
                        $("#description_div").fadeOut();
                    }

                }

                if ($("#address_div").is(':visible')) {
                    $("#address_div").fadeOut();
                    $("#slide_div").animate({ 'right': '240px' });
                    $('#slide_div').fadeOut();

                }
                else {

                    setTimeout(function () {
                        $('#address_div').fadeIn();
                       $('#slide_div').fadeIn();
                        $("#slide_div").animate({ 'right': '560px' });


                    }, 650);
                }
            });


            $('#contact_btn').click(function () {

                if ($("#slide_div").is(':visible')) {
                    $("#slide_div").animate({ 'right': '240px' });
                //    $('#slide_div').fadeOut();

                    if ($("#name_div").is(':visible')) {
                        $("#name_div").fadeOut();
                    }
                    else if ($("#address_div").is(':visible')) {
                        $("#address_div").fadeOut();
                    }
                    else if ($("#description_div").is(':visible')) {
                        $("#description_div").fadeOut();
                    }

                }

                if ($("#contact_div").is(':visible')) {
                    $("#contact_div").fadeOut();
                    $("#slide_div").animate({ 'right': '240px' });
                    $('#slide_div').fadeOut();

                }
                else {

                    setTimeout(function () {
                        $('#contact_div').fadeIn();
                      $('#slide_div').fadeIn();
                        $("#slide_div").animate({ 'right': '560px' });


                    }, 650);
                }
               });



            $('#desc_btn').click(function () {

                if ($("#slide_div").is(':visible')) {
                    $("#slide_div").animate({ 'right': '240px' });
                //   $('#slide_div').fadeOut();

                    if ($("#name_div").is(':visible')) {
                        $("#name_div").fadeOut();
                    }
                    else if ($("#contact_div").is(':visible')) {
                        $("#contact_div").fadeOut();
                    }
                    else if ($("#address_div").is(':visible')) {
                        $("#address_div").fadeOut();
                    }

                }
                if ($("#description_div").is(':visible')) {
                    $("#description_div").fadeOut();
                    $("#slide_div").animate({ 'right': '240px' });
                    $('#slide_div').fadeOut();

                }
                else {
                    setTimeout(function () {
                        $('#description_div').fadeIn();
                        $('#slide_div').fadeIn();
                        $("#slide_div").animate({ 'right': '560px' });


                    }, 650);
                }
            });

           

        });

        $(document).on('click', '.close_div', function () {

            $("#slide_div").animate({ 'right': '230px' });
            $("#slide_div").fadeOut;

            if ($("#name_div").is(':visible')) {
                $("#name_div").fadeOut();
            }
            else if ($("#description_div").is(':visible')) {
                $("#description_div").fadeOut();
            }
            else if ($("#contact_div").is(':visible')) {
                $("#contact_div").fadeOut();
            }
            else if ($("#address_div").is(':visible')) {
                $("#address_div").fadeOut();
            }


        });

    </script>
</body>
</html>
