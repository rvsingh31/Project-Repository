<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Easy Travel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body class="blue lighten-4">

  <nav class="yellow lighten-1">
  </nav>
   
    <br />
    <div class="row">
        <div class="col s12 m1">
            <p></p>
        </div>
        <div class="col s12 m5 card-panel yellow lighten-1">
            <p></p>
        </div>
        <div class="col s12 m1">
            <p></p>
        </div>
        <div class="col s12 m4 card-panel yellow lighten-1">
            <div>
                <form runat="server">
       
  <div class="row ">
    <div class="col s12 ">
      <ul class="tabs  yellow">
        <li class="tab col s3 "><a href="#login" class="active teal-text">Login</a></li>
        <li class="tab col s3 "><a class="teal-text" href="#register">Register</a></li>
       </ul>
    </div>
        

    <div id="login" class="col s12">
        
    <br />
            <asp:Panel id="loginPanel" DefaultButton="login_btn" Runat="Server">	
		           <div class="input-field">
                        <asp:Label ID="ulabel" runat="server" class="blue-text text-darken-2" Text="Username"></asp:Label>
                        <asp:TextBox ID="uname" runat="server" class="blue-text text-darken-2"></asp:TextBox>
                    </div>
                    <div class="input-field">
                        <asp:Label ID="plabel" runat="server" class="blue-text text-darken-2" Text="Password"></asp:Label>
                        <asp:TextBox ID="passwd" type="password" runat="server" class="blue-text text-darken-2"></asp:TextBox>
                    </div>
                    
                     <br />
        	
                   <asp:Button ID="login_btn" runat="server" Text="Login" display="none" class="btn waves-effect waves-light blue darken-2 yellow-text" OnClick="login_btn_Click" />               
            </asp:Panel>

     
    </div>
    <div id="register" class="col s12 teal-text">
       <br />
        <div class="input-field">
            <asp:Label ID="fnlbl" runat="server" class="blue-text text-darken-2" Text="First Name"></asp:Label>
            <asp:TextBox ID="fname" runat="server" class="blue-text text-darken-2"></asp:TextBox>
        </div>
                
        <div class="input-field">
            <asp:Label ID="lnlbl" runat="server" class="blue-text text-darken-2" Text="Last Name"></asp:Label>
            <asp:TextBox ID="lname" runat="server" class="blue-text text-darken-2"></asp:TextBox>
        </div>

        <div class="input-field">
            <asp:Label ID="unlbl" runat="server" class="blue-text text-darken-2" Text="UserName"></asp:Label>
            <asp:TextBox ID="uname_r" runat="server" class="blue-text text-darken-2"></asp:TextBox>
        </div>

        <div class="input-field">
            <asp:Label ID="passlbl" runat="server" class="blue-text text-darken-2" Text="Password"></asp:Label>
            <asp:TextBox ID="pass" Type="password" runat="server" class="blue-text text-darken-2"></asp:TextBox>
        </div>

        <div class="input-field">
            <asp:Label ID="repasslbl" runat="server" class="blue-text text-darken-2" Text="Password(Again)"></asp:Label>
            <asp:TextBox ID="repass" Type="password" runat="server" class="teal-text"></asp:TextBox>
        </div>

        <div class="input-field">
            <asp:Label ID="conlbl" runat="server" class="blue-text text-darken-2" Text="Contact"></asp:Label>
            <asp:TextBox ID="contact" runat="server" class="blue-text text-darken-2"></asp:TextBox>
        </div>

        <div class="input-field">
            <asp:Label ID="maillbl" runat="server" class="blue-text text-darken-2" Text="Mail-id"></asp:Label>
            <asp:TextBox ID="mail" runat="server" class="blue-text text-darken-2"></asp:TextBox>
        </div>



               <asp:Button ID="register_btn" runat="server" Text="Register" class="btn waves-effect waves-light blue darken-2 yellow-text" OnClick="register_btn_Click"/>
            
        </div>
        
        </div>
                    </form>
             </div>
        <div class="col s12 m1">
            <p></p>
            <asp:Label ID="hidden_lbl" runat="server" Text="" class="yellow-text" ></asp:Label>
            <asp:Label ID="register_lbl_hidden" runat="server" Text="" class="yellow-text" ></asp:Label>
        </div>
    </div>
   </div>
  
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    
        <script type="text/javascript">
            var str = document.getElementById("hidden_lbl").innerHTML;
            var str2 = document.getElementById("register_lbl_hidden").innerHTML;

            if (str != "")
            {
                Materialize.toast(str, 2000, 'rounded');
            }
            else if(str2!="")
            {
                Materialize.toast(str2, 2000, 'rounded');
            }
            </script>
 </body>
</html>
