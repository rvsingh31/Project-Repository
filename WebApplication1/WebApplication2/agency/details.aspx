<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="WebApplication2.details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details of Registrations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>

      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
</head>
<body class="blue lighten-1"> 
    <nav class="white">
           <ul>
                <li class="left"><a href="#!"><asp:Label ID="i_lbl" class="blue-text" runat="server" Text="Easy Travel"></asp:Label></a></li> 
               <li class="right">
                   <a href="a_home.aspx" class="blue-text">Home</a>
               </li>
           </ul>
    </nav>
    <form id="form1" runat="server">
    <div class="row">
        <div class="col s12 m3">
            <p></p>
        </div>
                     <div class="col s12 m6 center">
                         <h6 class="white-text center">-- DETAILS --</h6>
                       <% for (int i = 0; i < ar1.Count; i=i+6)
                           {%>


                              <div class="col s12 card white lighten-2">
                                   <h6 class="blue-text">E-Ticket Id: &nbsp; <%=ar1[i+2] %></h6>
                                    <br />
                                       <h6 class="blue-text">Ticket is booked on the name of:&nbsp; <%=ar1[i] %></h6>
                                    <br />
                                  <h6 class="blue-text">Contact Number:&nbsp;<%=ar1[i+1] %></h6>
                                  <br />    
                                   <h6 class="blue-text">Adults:&nbsp; <%=ar1[i+3] %> and Children : &nbsp;<%=ar1[i+4] %></h6>     
                                    <br />
                                    <h6 class="blue-text">Total Charges:&nbsp;<%=ar1[i+5] %> </h6>
                                </div>


                      <%     } %>
                         
                         
                         </div>
        <div class="col s12 m3">
            <p></p>
        </div>
    </div>
    </form>
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="/js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    
</body>
</html>
