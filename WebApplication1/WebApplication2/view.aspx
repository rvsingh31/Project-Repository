<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="WebApplication2.cancellation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Book Package </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
  <style>

      .dont-break-out {

  overflow-wrap: break-word;
  word-wrap: break-word;

  -ms-word-break: break-all;
  word-break: break-all;
  word-break: break-word;

  -ms-hyphens: auto;
  -moz-hyphens: auto;
  -webkit-hyphens: auto;
  hyphens: auto;

}
  </style>
</head>
<body class="blue darken-1">
    <form id="form1" runat="server">
    
   
   <div class="navbar-fixed">
        <nav class="yellow">
            <div class="nav-wrapper">
            <ul> 
                <li class="left"><a class="blue-text " href="#!">Easy Travel</a></li>
                <li class="right"><a class="blue-text " href="home.aspx">Home</a></li>
            </ul>
                </div>
        </nav>
</div>
    <div class="row">

        <div class="col s12 m3">
            <div class="row">


                <div class="card white">
                                <div class="card-image">
                                         <asp:Image runat="server" id="im1"></asp:Image>
                                 </div>
                                 <div class="card-content">
                                     <div class="row">
                                     <div class="col s12  center">
                                   
                                          <h6 class="teal-text dont-break-out"><strong id="pn" runat="server"></strong></h6>
                                       
                                      </div>
                
                                        <div class="col s12  center">
                                            <h6 class="teal-text"><strong>Duration:</strong></h6>
                                            <h6 class="blue-text" id="pdu" runat="server"></h6>
                                         </div>
                
                                         <div class="col s12 center">
                                             <h6 class="teal-text"><strong>Fees</strong></h6>
                                             <h6 class="blue-text"><span class="teal-text">ADULT:Rs </span><span id="ca" runat="server"></span></h6>
                                             <h6 class="blue-text"><span class="teal-text">CHILD:Rs </span><span id="cc1" runat="server"></span></h6>
                                          </div>
                                        <br />
                                     </div>
                                 </div>
                                 <div class="card-action yellow lighten-4">
                                  </div>
                           </div>
    
            </div>
        </div>
        
        <div class="col s12 m7">
            <div class="row">
                <div class="col s12 m4 card-panel">
                     <div class="col s12 center">
                            <h6 class="teal-text "><strong>Description:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="pd" runat="server"></h6>
                     </div>

                      <br />
                    <br />

                     <div class="col s12 center">
                            <h6 class="teal-text "><strong>Total Packages available:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="pl" runat="server"></h6>
                     </div>
                    <br />
                    <br />

                     <div class="col s12 center">
                            <h6 class="teal-text "><strong>Trip Date:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="pe" runat="server"></h6>
                     </div>
                    <br />
                    <br />
                     <div class="col s12 center">
                         <br />
                            <h6 class="teal-text "><strong>This Package is provided by:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="an" runat="server"></h6>
                       <br />
                            <h6 class="teal-text "><strong>Agency Description:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="ad" runat="server"></h6>
                   <br />
                            <h6 class="teal-text "><strong>Agency's Address:</strong></h6>
                            <h6 class="blue-text dont-break-out" id="aa" runat="server"></h6>
                 <br />

                            <h6 class="teal-text "><strong>Agency's Contact:</strong></h6>
                           <h6 class="blue-text dont-break-out" id="ac" runat="server"></h6>

                             
                     </div>
                    
                </div>
                <div class="col s12 m1">
                    <p></p>
                </div>
                <div class="col s12 m6">
                    <div class="row">
                                <div class="col s12 card-panel">
                                      <h6 class="blue-text">Details about your Booking</h6>                     
                                      <br />
                                       <h6 class="teal-text">E-Ticket Id: <span class="blue-text" id="eticket_span" runat="server"></span></h6>
                                    <br />
                                       <h6 class="teal-text">Ticket is booked on the name of: <span class="blue-text" id="main_traveller" runat="server"></span></h6>
                                    <br />
                                    <%if (members == "yes")
                                        {%>
                                                      <div id="adults_div" runat="server"></div>
                                    <br />  
                                                        <div id="child_div" runat="server"></div>
                                     <%    }
                                        else
                                        {
                                            %>
                                        <h6 class="teal-text"> No other Travellers!</h6>
                                    <%
                                        }
                                       %>
                                    <br />
                                    <h6 class="teal-text">Total Charges: <span class="blue-text" id="total_cost_span" runat="server"></span></h6>
                                </div>
                    </div>
                    <%if (cancel=="yes") {
                            %>

                     <div class="row">
                          
                        <div class="center">
                              <asp:Button href="#cancel_modal" class="btn modal-trigger white blue-text center waves-effect waves-light" runat="server" Text="Cancel Package"></asp:Button>
                        
                       </div>
                     </div>
                    


                  <%          } %>
                   <div class="row">
                        <br />
                        <div class="center">
                              <asp:Button runat="server" href="#!" class="btn white blue-text waves-effect waves-light" Text="Download E-Ticket"></asp:Button>
                        </div>
                     
                    </div>
                </div>
        </div>
            <div id="cancel_modal" class="modal">
                <div class="modal-content">
                    <h5 class="blue-text">Cancel Package?</h5>
                        <p class="teal-text"> If you delete your booking ,then all the details will be deleted from the system and the particular
                             agency will be notified of this action and the refund transaction will initiate once the agency acknowledges the cancellation 
                            procedure .You will be notified of the actions taken by the agency!!
                        </p>
                </div>
                    <div class="modal-footer">
                         <asp:Button  runat="server" OnClick="remove_click" class="red-text blue white-text modal-action modal-close waves-effect waves-blue btn-flat" Text="Proceed"></asp:Button>
                    </div>
             </div>
        <div class="col s12 m1">
            <p class="white-text" id="l" runat="server"></p>
        </div>

    </div>

   
        </div>
         
    </form>

      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
   
    <script>
        $(document).ready(function () {

            $('select').material_select();
            $('.modal-trigger').leanModal();
        });


     
    </script>
</body>
</html>
