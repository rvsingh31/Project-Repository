<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="a_home.aspx.cs" Inherits="WebApplication2.admin.a_home" %>


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
       
        a:active{
               color: blue;
        }
        
       
    </style>
</head>
<body class="blue">
    <nav class="white">
        <ul>
            <li class="left"><a href="#!"><asp:Label ID="i_lbl" class="teal-text" runat="server" Text="Easy Travel"></asp:Label></a></li>
            <li class="center"><a href="#!"><asp:Label ID="Label1" class="teal-text" runat="server" Text="Admin Portal"></asp:Label></a></li> 
            <li class="right"><a href="#!" class="teal-text"><asp:Label ID="a_lbl" runat="server" Text=""></asp:Label></a>
            </li>
        </ul>
    </nav>
    <asp:Label runat="server" class="blue-text" id="error_lbl" ></asp:Label>
    <form id="f1" runat="server">
    <div class ="row">
        <br />
        <br />
        <div id="main">
            <div class="col s12 m1">
                <p></p>
            </div>
            <div class="card col s12 m4 blue-text center">
                <img src="agency.jpg" class="responsive-img circle" />
                <h6 class="teal-text"> AGENCY MANAGEMENT</h6>
                <br />
                <p>
                    Here you can delete the agency and also their packages as and when needed.
                </p>
                <p>
                    Also ,you can keep a track of all the bookings according to respective packages.
                </p>
                <br />
                <a href="#age_div" id="age_btn" class=" btn active right center white-text blue waves-effect waves-light right">Proceed &rarr;</a>
                <br/>
               </div>

            <div class="col s12 m2">
                <p></p>
            </div>

            <div class="card col s12 m4 blue-text center">
                <img src="user.jpg" class="responsive-img circle" style="width:40%;height:40%" />
                <h6  class="teal-text">USER MANAGEMENT</h6>
                <br />
                <p>Basically,here you can delete unwanted users as and when needed.</p>
                <p>Also , keep a track of all the packages booked by a particular user and its interaction with the agencies.</p>
                   <br />
            <a href="#use_div" id="use_btn" class="btn center white-text  blue waves-effect waves-light right">Proceed &rarr;</a>
                    <br />
                 </div>
            <div class="col s12 m1">
                <p></p>
            </div>
            

            
            
            
        </div>
      </div>

        <div class="row">

        <div class="col s12 m12 center" id ="display1" >

            
            <div id="age_div" style="display:none">

                    <div>
                           <button id="back1" class="white btn blue-text waves-effect waves-light right">BACK</button>
                        <br/>
                           <h6 class="center"><strong>Registered Agencies</strong></h6>
                        <br/>

                    </div>
                    <div id="reg_agency" class=" white-text">
                        <br/>
                        <div class="row">
                            <% if(agencies != "")
                               {
                                    %>
                                <div class="col m4">
                                    <p></p>
                                </div>    
                            
                            <%
                                for(q=0;q<ar1.Count;q++)
                                {
                                    %>
                              
                                    <div class="col s12 m4 card-panel hoverable">
                                        <br/>
                                       
                                            <a href="ag_reg_pack.aspx?id=<%=ar2[q]%>&name=<%=ar1[q] %>#age_div"><h6 class="blue-text center"><%= ar1[q] %></h6></a>
                                            <asp:Label ID="ag_name" runat="server" class="hide blue-text center" Text="" ></asp:Label>
                                            <asp:label ID="ag_id" runat="server" Class="hide blue-text center" Text='<%# Eval("ar2[q]") %>'></asp:label>
                                            <a href="delete_agency.aspx?id=<%=ar2[q]%>" class="btn blue white-text darken-1 right">Delete</a>
                                       <br />

                                    </div>
                                                
                                    <div class="col m4">
                                        <p></p>
                                    </div> 
                                   </div>   
                                    <div class="row">
                                        <p></p>
                                                                    
                                     <div class="col m4">
                                        <p></p>
                                    </div>  

                            <%    }
                                 %>    

                             <% }
                                     %>  
                            <% else {
                                    %>
                            <br/>
                               
                                <h6 class="white-text center ">No registered agencies to show</h6>
                                
                            <% } %>
                        </div>
                    </div>
                </div>

            <div id="use_div" style="display:none">

                <div>
                            <button id="back2" class="white btn blue-text waves-effect waves-light right">BACK</button>
                   
                   <br/>
                       <h6 class="center"><strong>All Users</strong></h6>
                   <br/>
                </div>
                <div id="disp_users" class="blue-text" >
                    <br/>
                    <div class="row">
                        <% if(users != "")
                            {
                            %>
                        <div class="col s5">
                                    <p></p>
                        </div>    
                        <%for(q=0;q<ar3.Count;q++)
                          {
                               %>
                              
                                    <div class="col s12 m4 card-panel white hoverable">
                                        <br/>
                                       
                                            <a href="disp_users.aspx?id=<%=ar4[q]%>&uname=<%=ar3[q] %>#use_div"><h6 class="blue-text center"><%=ar3[q] %></h6></a>
                                            <asp:Label ID="Label2" runat="server" class="hide blue-text center" Text="" ></asp:Label>
                                            <asp:label ID="Label3" runat="server" Class="hide blue-text center" Text='<%# Eval("ar2[q]") %>'></asp:label>
                                            <a href="delete_users.aspx?id=<%=ar4[q]%>&type=<%=ar5[q] %>" class="btn white-text blue white darken-1 right">Delete</a>
                                       <br />

                                    </div>
                                                
                                    <div class="col s1">
                                        <p></p>
                                    </div>    
                                    <div class="row">
                                        <p></p>
                                    </div>                                
                                     <div class="col s5">
                                        <p></p>
                                    </div>  

                            <%    }
                                 %>    

                             <% }
                                     %>  
                            <% else {
                                    %>
                            <br/>
                                <div class="col s3">
                                    <p></p>
                                </div>    

                                <h6 class="white-text center ">No users to show</h6>
                                
                            <% } %>
 
                    </div>
                </div>
            </div>

            <div id="pay_div" style="display:none">
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
        $('#age_btn').click(function () {
            if ($("#main").is(':visible')) {
                    $("#main").hide();
                }
            

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
            if ($("#main").is(':visible')) {
                $("#main").hide();
            }


            if ($("#display1").is(':visible')) {
                if ($("#age_div").is(':visible')) {
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

        $("#back1").click(function () {
            if ($("#age_div").is(':visible')) {
                $("#age_div").hide();
            }
            else if ($("#use_div").is(':visible')) {
                $("#use_div").hide();
            }
            $("#main").show();

        });

        $("#back2").click(function () {
            if ($("#age_div").is(':visible')) {
                $("#age_div").hide();
            }
            else if ($("#use_div").is(':visible')) {
                $("#use_div").hide();
            }
            $("#main").show();

        });

           </script>
</body>
</html>
