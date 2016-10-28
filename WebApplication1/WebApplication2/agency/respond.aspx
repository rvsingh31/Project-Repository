<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="respond.aspx.cs" Inherits="WebApplication2.agency.respond" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Respond to an Inquiry</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>

      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
<body class="blue lighten-2">
    <form id="form1" runat="server">
<nav class="blue lighten-1">
        <a href="#!"><asp:Label ID="i_lbl" class="white-text left" runat="server" Text="Easy Travel"></asp:Label></a>   
        <ul class="right">
               <li>
                  <a href="a_home.aspx" class="white-text">Home</a>
                 
               </li>
           </ul>
    </nav>
            
   <div class="row">
    <br />
       <div class="col s12 m1">
           <p></p>
       </div>
       <div class="col s12 m5 card-panel blue-text">
           <h6 class="center">--Inquiry--</h6>
                <br />
           <h6>Name of the person who enquired: <span class="teal-text" id="name" runat="server"></span></h6>
           <br />
            <h6>Desired Location: <span class="teal-text" id="location" runat="server"></span></h6>
           <br /> 
           <h6>Suggested Budget: <span class="teal-text" id="budget" runat="server"></span></h6>
           <br /> 
           <h6>Additional Information : <span class="teal-text dont-break-out" id="description" runat="server"></span></h6>
            
       </div>
       <div class="col s12 m1">
           <p></p>
       </div>
       <div class="col s12 m4 card-panel blue-text">
           <h6 class="center">Provide a Response</h6>
           <br />
           <div class="input-field col s12 m12">
               <asp:Label ID="lds" runat="server" class="blue-text" Text="Mail the details to the customer"></asp:Label>
               <textarea id="mail" runat="server" class="teal-text materialize-textarea" ></textarea>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="g9" ControlToValidate="mail" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                       
           </div>
           <br />
           <asp:Button runat="server" ID="mail_btn" ValidationGroup="g9" UseSubmitBehavior="true" OnClick="mail_btn_Click" CssClass="btn waves-effect waves-light blue white-text" Text="Send Mail"></asp:Button>
        <br />
           <br />
       </div>
       <div class="col s12 m1">
           <p></p>
       </div>
    </div>
    </form>

       <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="/js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
   <script>
       $(document).ready(function () {

           $('mail').trigger('autoresize');
       });
   </script>
</body>
</html>
