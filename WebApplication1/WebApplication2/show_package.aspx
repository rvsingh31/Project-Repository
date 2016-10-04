<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show_package.aspx.cs" Inherits="WebApplication2.WebForm6" %>

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
    <div>
    
   
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
                                           <br />
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
                <div class="col s12 m7 card-panel" >
                    <h6 class="teal-text center"><strong>BOOK NOW</strong></h6>
                    <br />
                 <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">              
                 <ContentTemplate>    
              
                    <div id="select_div" runat="server" class="col s12 m12 input-field">
                       <asp:Label id="l1" runat="server" class="blue-text" Text="Are you going to travel?(or booking for someone else!)"></asp:Label>
                       <select id="traveler" runat="server" class="blue-text">
                           <option runat="server" value="yes">YES</option>
                           <option runat="server" value="no">NO</option>
                       </select>
                       <asp:Button id="b1" OnClick="b1_click" runat="server" class="btn waves-effect waves-light yellow blue-text" Text="Proceed"></asp:Button>
                    </div>
                    <br />
                  <div class="col s12 m12" id="new_traveller" runat="server" >
                        <asp:Label runat="server" ID="l2" Text="Name of Traveller" class="blue-text"></asp:Label>
                        <asp:TextBox runat="server" ID="traveller_name" class="blue-text"></asp:TextBox>
                    </div>

                    <div  class="col s12 m12" id="old_traveller" runat="server" >
                        <p>OLD Traveller</p>
                    </div>
       </ContentTemplate>
                    </asp:UpdatePanel>
               
            </div>
        </div>

        <div class="col s12 m1">
            <p></p>
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
        });


     
    </script>
</body>
</html>
