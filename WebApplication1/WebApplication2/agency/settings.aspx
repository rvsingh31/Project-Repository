<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="WebApplication2.agency.settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>

      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        .change{
            color:yellow;
           opacity:1;
           text-decoration:none;
           cursor:pointer;
        }
        .change:hover{
            opacity:0.6;
            color:white;
            transition:opacity 0.1s ease-in, color 0.2s linear;
            -webkit-transition:opacity 0.1s ease-in, color 0.2s linear; 
        }

 
        
@media (min-width: 991px) {
    main {
        padding-left: 120px;
    }
}
    </style>
 
</head>
<body class="blue lighten-4">

    <nav class="white">
    <div class="nav-wrapper">
		<ul class="right">
			<li><a href="a_home.aspx" class="blue-text ">Home</a></li>
            <li><a href="#" class="blue-text ">Easy travel</a></li>

		</ul>
		<a href="#" data-activates="mobile-demo" class="left button-collapse blue-text"><i class="material-icons">menu</i></a>
      
	   <ul  class="side-nav fixed blue darken-1 "> 
       <li class="center">
           <br />
        <h6 class="yellow-text">Make Changes</h6>
       </li>
           <li><br /></li>
                 <li class="active name_li"><a class="change name white-text">Name</a></li>
                 <li class="username_li"><a class="change white-text description">Username</a></li>
                 <li class="password_li"><a class="change cost white-text">Password</a></li>
                 <li class="contact_li"><a  class="change duration white-text">Contact Number</a></li>
                 <li class="email_li"><a  class="change limit white-text">Email</a></li>
                 
    </ul>
	
	 <ul id="mobile-demo" class="side-nav blue darken-1">
    
    <li class="center">
        <h6 class="yellow-text">Make Changes</h6>
       </li>
           <li><br /></li>
           <li class="center"><a class="blue-text text-darken-1" href="#!"><%=Session["package_name"] %></a></li>
         <li><br /></li>
                 <li class="active name_li"><a class="change name white-text">Name</a></li>
                 <li class="username_li"><a class="change white-text description">Username</a></li>
                 <li class="password_li"><a class="change cost white-text">Password</a></li>
                 <li class="contact_li"><a  class="change duration white-text">Contact Number</a></li>
                 <li class="email_li"><a  class="change limit white-text">Email</a></li>
                 
	</ul>
    </div>
  </nav>

    <main>
        
        <div class="container">
    <form id="form1" runat="server">
            <br /> <p id="msg" runat="server" class="blue-text text-lighten-4"></p>

        <br />
        <div class="row">
            
            <div class="col s12 m2">
                <p></p>
            </div>
            <div class="col s12 m8 blue darken-1" style="border-radius:1%;height:26em;overflow-y:auto;">
                       <div class="white-text" id="name">
                            <h6 class="white-text center text-lighten-1">Change your Name</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT NAME:</h6>
                            <span class="yellow-text"> <asp:Label ID="name_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                           <div class="row">
                               <div class="col s12 m6">
                                   <label  class="white-text">First Name</label>
                                <asp:TextBox runat="server" ID="new_fname" class="white-text"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="v1" ControlToValidate="new_fname" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                   <br />
                                   <asp:Button id="b1" OnCommand="b1_Command" CommandArgument="fname" UseSubmitBehavior="true" ValidationGroup="v1" runat="server" Text="Change" class="btn white waves-effect waves-light blue-text"></asp:Button>
                                   &nbsp;
                                   <button type="reset" class="btn white waves-effect waves-light blue-text">Clear</button>
                                </div>

                               <div class="col s12 m6">
                                   <label  class="white-text">Last Name</label>
                                <asp:TextBox runat="server" ID="new_lname" class="white-text"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="v2" ControlToValidate="new_lname" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
        
                                   <br />
                                   <asp:Button id="Button1" OnCommand="b1_Command" CommandArgument="lname" UseSubmitBehavior="true" ValidationGroup="v2" runat="server" Text="Change" class="btn white waves-effect waves-light blue-text"></asp:Button>
                                   &nbsp;
                                   <button type="reset" class="btn white waves-effect waves-light blue-text">Clear</button>
                                </div>
                           </div>
                            <br />
                        </div>

                        <div class="white-text" id="username" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Username</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT USERNAME:</h6>
                            <span class="yellow-text"> <asp:Label ID="username_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                              
                               <div>
                                   <label  class="white-text">UserName</label>
                                <asp:TextBox runat="server" ID="new_username" class="white-text"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="v3" ControlToValidate="new_username" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                               <br />
                                   <asp:Button id="Button3" runat="server" ValidationGroup="v3" OnCommand="b1_Command" CommandArgument="uname" UseSubmitBehavior="true" Text="Change" class="btn white waves-effect waves-light blue-text"></asp:Button>
                                   &nbsp;
                                   <button type="reset" class="btn white waves-effect waves-light blue-text">Clear</button>
                                </div>
                              <br />
                        </div>
                        
                     <div class="white-text" id="password"  style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Password</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT PASSWORD:</h6>
                            <span class="yellow-text"> <asp:Label ID="password_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                              
                               <div>
                                   <label  class="white-text">Password</label>
                                <asp:TextBox runat="server" ID="new_password" class="white-text"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="v4" ControlToValidate="new_password" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                               
                                   <br />
                                  <label  class="white-text">Enter Password again</label>
                                <asp:TextBox runat="server" ID="repass" class="white-text"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="v4" ControlToValidate="repass" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                   <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="v4" ControlToCompare="new_password" ControlToValidate="repass" ErrorMessage="Password Doesn't Match"></asp:CompareValidator>
                                   <br />
                                   <asp:Button id="Button2" runat="server" ValidationGroup="v4" OnCommand="b1_Command" CommandArgument="password" UseSubmitBehavior="true" Text="Change" class="btn white waves-effect waves-light blue-text"></asp:Button>
                                   &nbsp;
                                   <button type="reset" class="btn white waves-effect waves-light blue-text">Clear</button>
                                </div>
                              <br />
                        </div>

                       <div class="white-text" id="contact"  style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Contact</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT Contact Number:</h6>
                            <span class="yellow-text"> <asp:Label ID="contact_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                              
                               <div>
                                   <label  class="white-text">Contact Number</label>
                                <asp:TextBox runat="server" ID="new_contact" class="white-text"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="v5" ControlToValidate="new_contact" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="new_contact" ValidationGroup="v5" ValidationExpression="^\d+$" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
      
                                    <br />
                                   <asp:Button id="Button4" runat="server" OnCommand="b1_Command" CommandArgument="contact" ValidationGroup="v5" UseSubmitBehavior="true" Text="Change" class="btn white waves-effect waves-light blue-text"></asp:Button>
                                   &nbsp;
                                   <button type="reset" class="btn white waves-effect waves-light blue-text">Clear</button>
                                </div>
                              <br />
                        </div>
 
                       <div class="white-text" id="email"  style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Email-Address</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT Email:</h6>
                            <span class="yellow-text"> <asp:Label ID="email_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                              
                               <div>
                                   <label  class="white-text">Email-Address</label>
                                <asp:TextBox runat="server" ID="new_email" class="white-text"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="v6" ControlToValidate="new_email" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="new_email" ValidationGroup="v6" ValidationExpression="\w+([­+.']\w+)*@\w+([­.]\w+)*\.\w+([­.]\w+)*" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
    
                                   <br />
                                   <asp:Button id="Button5" runat="server"  OnCommand="b1_Command" CommandArgument="email" ValidationGroup="v6" UseSubmitBehavior="true" Text="Change" class="btn white waves-effect waves-light blue-text"></asp:Button>
                                   &nbsp;
                                   <button type="reset" class="btn white waves-effect waves-light blue-text">Clear</button>
                                </div>
                              <br />
                        </div>
 
            </div>
                                         



                   
            </div>

     

    </form>
            </div>
        </main>
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="/js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script>

     
        var x = document.getElementById("msg").innerHTML;
        if(x!="")
        {
            Materialize.toast(x,2000,'rounded');
        }

        $(document).ready(function () {

            $(".button-collapse").sideNav();
        });

        $(document).on('click', '.name_li', function () {
            clear_area();

            setTimeout(function () {
                $("#name").fadeIn();
                $(".name_li").addClass('active');
                }, 500);
        });

        $(document).on('click', '.username_li', function () {
            clear_area();

            setTimeout(function () {
                $("#username").fadeIn();
                $(".username_li").addClass('active');
            }, 500);
        });
        $(document).on('click', '.password_li', function () {
            clear_area();

            setTimeout(function () {
                $("#password").fadeIn();
                $(".password_li").addClass('active');
            }, 500);
        });
        $(document).on('click', '.contact_li', function () {
            clear_area();

            setTimeout(function () {
                $("#contact").fadeIn();
                $(".contact_li").addClass('active');
            }, 500);
        });
        $(document).on('click', '.email_li', function () {
            clear_area();

            setTimeout(function () {
                $("#email").fadeIn();
                $(".email_li").addClass('active');
            }, 500);
        });
        function clear_area() {
            $(document).ready(function () {

                if ($("#name").is(':visible')) {
                    $("#name").fadeOut();
                    $(".name_li").removeClass('active');
                }
                else if ($("#username").is(':visible')) {
                    $("#username").fadeOut();
                    $(".username_li").removeClass('active');

                }
                else if ($("#password").is(':visible')) {
                    $("#password").fadeOut();
                    $(".password_li").removeClass('active');

                }
                else if ($("#contact").is(':visible')) {
                    $("#contact").fadeOut();
                    $(".contact_li").removeClass('active');

                }
                else if ($("#email").is(':visible')) {
                    $("#email").fadeOut();
                    $(".email_li").removeClass('active');

                }
            });
            
        }
    </script>
</body>

</html>
