<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ag_reg_pack.aspx.cs" Inherits="WebApplication2.admin.ag_reg_pack" %>

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
      
       
    </style>
</head>
<body>
    <nav class="red lighten-2">
        <ul>
            <li class="left"><a href="#!"><asp:Label ID="i_lbl" class="white-text" runat="server" Text="Easy Travel"></asp:Label></a></li>
            <li class="center-align"><a href="#!"><asp:Label ID="Label1" class="white-text" runat="server" Text="Admin Portal"></asp:Label></a></li> 
            <li class="right"><a href="#!" class="white-text"><asp:Label ID="a_lbl" runat="server" Text=""></asp:Label></a>
            </li>
        </ul>
    </nav>
    <asp:Label runat="server" class="teal-text text-lighten-4" id="error_lbl"></asp:Label>
    <form id="f1" runat="server">
    <div class ="row">
       
        
        <div class="col s12 m12" id ="display1" >
            <div id="age_div" class="active"  >
                  
                    <div>
                        <br/>
                           <a href='a_home.aspx#age_div' id="back_id" class="btn blue white-text right"><strong>Back</strong></a>
                           <h6 class="center"><strong>Packages of <asp:label runat="server" id="ag_name_lbl" Text=""/></strong></h6>
                        <br/>
                    </div>
                    <div id="reg_packages" class=" white-text">
                        <br/>
                        <div class="row">
                            <% if(packages != "")
                               {
                                    %>
                                <div class="col m4">
                                    <p></p>
                                </div>    
                            
                            <%
                                for(q=0;q<ar1.Count;q++)
                                {
                                    %>
                              
                                    <div class="col s12 m4 card-panel blue hoverable">
                                        <br/>
                                       
                                            <h6 class="white-text center"><%=ar1[q] %></h6>
                                            <a href="delete_packages.aspx?id=<%=ar2[q]%>" class="btn blue-text white darken-1 right">Delete</a>
                                       

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
                              
                                <h6 class="blue-text center ">No packages to show</h6>
                                
                            <% } %>
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
       
    </script>
</body>
</html>

