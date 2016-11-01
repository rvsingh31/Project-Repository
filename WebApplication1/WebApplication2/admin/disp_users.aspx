<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="disp_users.aspx.cs" Inherits="WebApplication2.admin.disp_users" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Home - Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        .close_div{
            cursor:pointer;
        }
        #side-nav{
            position: fixed;
            height: 100%;
            overflow: auto;
        }
        #home_div{
            height:100%;
            overflow:auto;
        }
        a:active{
               color: blue;
        }
        
       
    </style>
</head>
<body>
    <nav class="red lighten-2">
        <ul>
            <li class="left"><a href="#!"><asp:Label ID="i_lbl" class="white-text" runat="server" Text="Easy Travel"></asp:Label></a></li>
            <li class="center"><a href="#!"><asp:Label ID="Label1" class="white-text" runat="server" Text="Admin Portal"></asp:Label></a></li> 
            <li class="right"><a href="#!" class="white-text"><asp:Label ID="a_lbl" runat="server" Text=""></asp:Label></a>
            </li>
        </ul>
    </nav>
    <asp:Label runat="server" class="teal-text text-lighten-4" id="error_lbl" ></asp:Label>
    <form id="f1" runat="server">
    <div class ="row">
         
        <div class="col s12 m12 l12" id ="display1" ><!-- teal panel added -->

            <div id="age_div" style="display:none">
                   <!-- <div class="col s12 m4"></div> -->
                    <div>
                        <br/>
                           <h6 class="center"><strong>Registered Agencies</strong></h6>
                        <br/>
                    </div>
                    <div id="reg_agency" class="blue-text">
                        <br/>
                        <div class="row">
                            <% if(agencies != "")
                               {
                                    %>
                                <div class="col m5">
                                    <p></p>
                                </div>    
                            
                            <%
                                for(q=0;q<ar1.Count;q++)
                                {
                                    %>
                              
                                    <div class="col s12 m4 card-panel blue hoverable">
                                        <br/>
                                       
                                            <a href="ag_reg_pack.aspx?id=<%=ar2[q]%>&name=<%=ar1[q] %>#age_div"><h6 class="white-text center"><%= ar1[q] %></h6></a>
                                            <asp:Label ID="ag_name" runat="server" class="hide white-text center" Text="" ></asp:Label>
                                            <asp:label ID="ag_id" runat="server" Class="hide white-text center" Text='<%# Eval("ar2[q]") %>'></asp:label>
                                            <a href="delete_agency.aspx?id=<%=ar2[q]%>" class="btn blue-text white darken-1 right">Delete</a>
                                       <br />
                                        <br />

                                    </div>
                                                
                                    <div class="col m1">
                                        <p></p>
                                    </div>    
                                    <div class="row">
                                        <p></p>
                                    </div>                                
                                     <div class="col m5">
                                        <p></p>
                                    </div>  

                            <%    }
                                 %>    

                             <% }
                                     %>  
                            <% else {
                                    %>
                            <br/>
                                <div class="col m3">
                                    <p></p>
                                </div>    

                                <h6 class="blue-text center ">No registered agencies to show</h6>
                                
                            <% } %>
                        </div>
                    </div>
                </div>

            <div id="use_div">
                <div>
                   <br/>
                       <a href='a_home#use_div' id="back_id" class="btn white-text blue right"><strong>Back</strong></a>
                       <h6 class="center"><strong>Information of <asp:label runat="server" id="uname_lbl" Text=""/></strong></h6>
                   <br/>
                </div>
                <div id="disp_users_info" class="blue-text">
                    <br/>
                    <h6 class="center">
                        <strong><span><strong>Name : </strong><asp:Label ID="full_lbl" class="blue-text" runat="server" Text=""></asp:Label></span></strong><br/>
                        <strong><span><strong>Contact number : </strong><asp:Label ID="contact_lbl" class="blue-text" runat="server" Text=""></asp:Label></span></strong><br/>
                        <strong><span><strong>Email-id : </strong><asp:Label ID="mail_lbl" class="blue-text" runat="server" Text=""></asp:Label></span></strong><br/>
                        <br/><strong class="black-text">Booked Packages:-</strong>
                    </h6>
                    <div class="row">
                        <div class="col s12 m3">
                                    <p></p>
                        </div>  
                        <% if(booked_pack != "") 
                           {
                               %>
                         <% 
                              for(q=0;q<ar3.Count;q++)
                              {
                                   if(count==2)
                                   {
                                        count = 0;
                                  
                                    %>      
                                </div> 
                                     <div class="row">
                                        <div class="col s12 m3">
                                            <p></p>
                                        </div>
                                                         
                                <% } %>
                               

                            <div class="col s12 m3 card-panel hoverable blue">
                                <br/>
                                <h6 class="white-text center"><%=ar3[q] %></h6>
                                <a href="../ticket.aspx?eticket_id=<%=ar5[q] %>" class="btn blue-text white darken-1 right">Download eticket</a> 
                                <br/>
                                <br />
                            </div>
                            <div class="col s12 m1">
                                <p></p>
                            </div>

                     <%    count++;
                              
                                }  
                        
                            }
                           
                           else
                           { %>
                           <h6 class="center blue-text">No booked packages</h6>    
                         <%  }
                            %>

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
        $('#home_btn').click( function () {
            if ($("#display1").is(':visible')) {
                if ($("#prof_div").is(':visible')) {
                    $("#prof_div").hide();
                }
                else if ($("#age_div").is(':visible')) {
                    $("#age_div").hide();
                }
                else if ($("#use_div").is(':visible')) {
                    $("#use_div").hide();
                }
                else if ($("#pay_div").is(':visible')) {
                    $("#pay_div").hide();
                }
                $("#home_div").show();
            }
        });
        $('#prof_btn').click( function () {
            if ($("#display1").is(':visible')) {
                if ($("#home_div").is(':visible')) {
                    $("#home_div").hide();
                }
                else if ($("#age_div").is(':visible')) {
                    $("#age_div").hide();
                }
                else if ($("#use_div").is(':visible')) {
                    $("#use_div").hide();
                }
                else if ($("#pay_div").is(':visible')) {
                    $("#pay_div").hide();
                }
                $("#prof_div").show();
            }
        });
        $('#age_btn').click( function () {
            if ($("#display1").is(':visible')) {
                if ($("#prof_div").is(':visible')) {
                    $("#prof_div").hide();
                }
                else if ($("#home_div").is(':visible')) {
                    $("#home_div").hide();
                }
                else if ($("#use_div").is(':visible')) {
                    $("#use_div").hide();
                }
                else if ($("#pay_div").is(':visible')) {
                    $("#pay_div").hide();
                }
                $("#age_div").show();
            }
        });
        $('#use_btn').click( function () {
            if ($("#display1").is(':visible')) {
                if ($("#prof_div").is(':visible')) {
                    $("#prof_div").hide();
                }
                else if ($("#age_div").is(':visible')) {
                    $("#age_div").hide();
                }
                else if ($("#home_div").is(':visible')) {
                    $("#home_div").hide();
                }
                else if ($("#pay_div").is(':visible')) {
                    $("#pay_div").hide();
                }
                $("#use_div").show();
            }
        });
        $('#pay_btn').click( function () {
            if ($("#display1").is(':visible')) {
                if ($("#prof_div").is(':visible')) {
                    $("#prof_div").hide();
                }
                else if ($("#age_div").is(':visible')) {
                    $("#age_div").hide();
                }
                else if ($("#use_div").is(':visible')) {
                    $("#use_div").hide();
                }
                else if ($("#home_div").is(':visible')) {
                    $("#home_div").hide();
                }
                $("#pay_div").show();
            }
        });
    </script>

                
</body>
</html>
