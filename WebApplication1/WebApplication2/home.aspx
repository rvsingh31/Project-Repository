<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HOME</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <style>
        
@media (min-width: 991px) {
    main {
        padding-left: 120px;
    }
}
    </style>
</head>
<body class="blue darken-1">
    <form runat="server">
        <div class="navbar-fixed">
  <nav class="white">
    <div class="nav-wrapper">
		<ul class="right">
			<li><a href="#" class="purple-text ">Easy travel</a></li>
		</ul>
		<a href="#" data-activates="mobile-demo" class="button-collapse purple-text"><i class="material-icons">menu</i></a>
      
	   <ul  class="side-nav fixed yellow purple-text"> 
       <li class="center">
        <h5 class="teal-text">Easy-Travel</h5>
       </li>
           <li><br /></li>
           <li class="center"><a class=" blue-text text-darken-1" href="#!"><%=vtr %></a></li>
            <li class="active li_home"><a class="home blue-text text-darken-1" href="#!">Home</a></li>
		<li class="li_search"> <a  class=" search blue-text text-darken-1"  href="#!">Search Packages</a></li>
        <li class="li_star"><a  class="star blue-text text-darken-1" href="#!">Starred Places</a></li>
        <li class="li_account"><a  class="account blue-text text-darken-1" href="#!">Account Settings</a></li>
		<li><a  class="blue-text text-darken-1" href="#!">Sign Out</a></li>
    </ul>
	
	 <ul id="mobile-demo" class="side-nav yellow purple-text">
    
    <li class="center">
        <h5 class="teal-text">Easy-Travel</h5>
       </li>
           <li><br /></li>
           <li class="center"><a class="blue-text text-darken-1" href="#!"><%=vtr %></a></li>
        <li class="active li_home"><a  class="home blue-text text-darken-1" href="#!">Home</a></li>
		<li class="li_search"><a  class="search blue-text text-darken-1"  href="#!">Search Packages</a></li>
        <li class="li_star"><a  class="star blue-text text-darken-1" href="#!">Starred Places</a></li>
        <li class="li_account"><a  class=" account blue-text text-darken-1" href="#!">Account Settings</a></li>
		<li><a  class="blue-text text-darken-1" href="#!">Sign Out</a></li>
    
	</ul>
    </div>
  </nav>
      </div>
    <main>
      
        <div class="section intro">
         
            <div class="container">
                <br />
                <div id="home" >
                            <h5 class="yellow-text header light">Best Deals for you!!</h5>
                    <br />
                    <div class="row">
                        <div class="col s12 m1"></div>
                        <% for (int y=0,z=0;y<ar2.Count;y=y+4,z++)
                            {
                                if (count==2)
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

                        

                            <div class="card white col s12 m5 ">
                                <div class="card-image" runat="server">
                                   
                                    <asp:Image ImageUrl="<%=ar4[z]%>"  runat="server" />                                  </div>
                                 <div class="card-content">
                                    <p class="blue-text"><%=ar2[y] %></p>
                                     <p class="blue-text"><%=ar2[y+1] %><br /><%=ar2[y+2] %><br /><%=ar2[y+3] %></p>
                                 </div>
                                 <div class="card-action">
                                    <a href="#">Book Now</a>
                                  </div>
                           </div>

                           

                       
                        <div class="col s12 m1"><p></p></div>

                         <% count++;      }
                                                 %>

                    </div>


                </div>
                <div id="account" style="display:none">
                          <h5 class="yellow-text header light">Edit your Profile</h5>
                            <br />   
                            <div class="row">
                                <div class="col s12 m5 card ">
                                    <br />
                                    <div>
                                        <span class="blue-text text-darken-1">Name : <span class="teal-text"><%=ar[0] %></span></span>
                                        &nbsp;
                                        <a id="ch_name_btn" class="btn right waves-effect waves-light yellow blue-text text-darken-1">Change</a>
                                        <br />
                                    </div>
                                    <div>
                                        <br />
                                        <span class="blue-text text-darken-1">UserName : <span class="teal-text"><%=ar[1] %></span></span>
                                        &nbsp;
                                        <a id="ch_username_btn" class="btn right  waves-effect waves-light yellow blue-text text-darken-1">Change</a>
                                        <br />
                                    </div>
                                    <div>
                                        <br />
                                        <span class="blue-text text-darken-1">Password : <span class="teal-text"><%=ar[2] %></span></span>
                                        &nbsp;
                                        <a id="ch_password_btn" class="btn right  waves-effect waves-light yellow blue-text text-darken-1">Change</a>
                                        <br />
                                    </div>
                                    <div>
                                        <br />
                                        <span class="blue-text text-darken-1">Contact : <span class="teal-text"><%=ar[3] %></span></span>
                                        &nbsp;
                                        <a id="ch_contact_btn" class="btn right  waves-effect waves-light yellow blue-text text-darken-1">Change</a>
                                           <br />
                                    </div>
                                    <div>
                                        <br />
                                        <span class="blue-text text-darken-1">Mail : <span class="teal-text"><%=ar[4] %></span></span>
                                        &nbsp;
                                        <a id="ch_mail_btn" class="btn right  waves-effect waves-light yellow blue-text text-darken-1">Change</a>
                                    
                                    </div>

                                    <br />
                                </div>
                                <div class="col s12 m1"> <p id="msg" style="display:none"><%=msg %></p></div>
                            
                               
                                    <div class="name_div col s12 m6 card-panel" style="display:none">
                                        <h6 class="teal-text center"><strong>Change your name</strong></h6>
                                        <br />
                                        <div class="row">
                                                <div class="col s12 m6 input-field">
                                                    <asp:TextBox ID="fname_input" runat="server" class="blue-text" ></asp:TextBox>
                                            <label for="fname_input">First Name</label>
                                                </div>
                                            <div class="col s12 m6 input-field">
                                                    <asp:TextBox ID="lname_input" runat="server" class="blue-text" ></asp:TextBox>
                                         <label for="lname_input">First Name</label>
                                            </div>
                                            <br />
                                            <div class="center">
                                            <asp:Button ID="name_bt" runat="server" OnCommand="Changes" CommandArgument="name" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
                                                &nbsp;
                                            <button type="reset" class="btn waves-effect waves-light yellow blue-text">CLEAR</button>
                                            </div>
                                                <br />
                                        </div>
                                    </div>
                                    <div class="username_div col s12 m6 card-panel" style="display:none">
                                        <h6 class="teal-text center"><strong>Change your username</strong></h6>
                                        <br />
                                        <asp:Label ID="u_lbl" runat="server" class="blue-text">New Username</asp:Label>
                                        <asp:TextBox ID="username_input" runat="server"></asp:TextBox>
                                        <br />
                                        <div class="center">
                                            <asp:Button ID="username_bt" runat="server" OnCommand="Changes" CommandArgument="username" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
                                                &nbsp;
                                            <button type="reset" class="btn waves-effect waves-light yellow blue-text">CLEAR</button>
                                            </div>
                                                <br />
                                    </div>
                                    <div class="password_div col s12 m6 card-panel" style="display:none">
                                        <h6 class="teal-text center"><strong>Change your password</strong></h6>
                                        <br />
                                        <asp:Label ID="Label1" runat="server" class="blue-text">New Password</asp:Label>
                                        <asp:TextBox ID="password_input" type="password" runat="server"></asp:TextBox>
                                        <br />
                                        <div class="center">
                                            <asp:Button ID="password_bt" runat="server" OnCommand="Changes" CommandArgument="password" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
                                                &nbsp;
                                            <button type="reset" class="btn waves-effect waves-light yellow blue-text">CLEAR</button>
                                            </div>
                                                <br />
                                    </div>
                                    <div class="contact_div col s12 m6 card-panel" style="display:none">
                                        <h6 class="teal-text center"><strong>Change your contact number</strong></h6>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" class="blue-text">New Contact</asp:Label>
                                        <asp:TextBox ID="contact_input" runat="server"></asp:TextBox>
                                        <br />
                                        <div class="center">
                                            <asp:Button ID="contact_bt" runat="server" OnCommand="Changes" CommandArgument="contact" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
                                                &nbsp;
                                            <button type="reset" class="btn waves-effect waves-light yellow blue-text">CLEAR</button>
                                            </div>
                                                <br />
                                    </div>
                                    <div class="mail_div col s12 m6 card-panel" style="display:none">
                                        <h6 class="teal-text center"><strong>Change your Email ID</strong></h6>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" class="blue-text">New ID</asp:Label>
                                        <asp:TextBox ID="email_input" runat="server"></asp:TextBox>
                                        <br />
                                        <div class="center">
                                            <asp:Button ID="email_bt" runat="server" OnCommand="Changes" CommandArgument="email" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
                                                &nbsp;
                                            <button type="reset" class="btn waves-effect waves-light yellow blue-text">CLEAR</button>
                                            </div>
                                                <br />
                                    </div>
                                 
                            </div>      
                </div>
                <div id="search" style="display:none">
                      <h6 class="yellow-text">Search Packages </h6>
                      
                </div>
                <div id="star" style="display:none">
                      <h6 class="yellow-text">Edit Your Profile</h6>
                      
                </div>
          
                </div>
                       
            </div>
      
          
    </main>
    </form>


     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script>


        var x = document.getElementById("msg").innerHTML;
        if (x != "") {
            Materialize.toast(x, 2000, 'rounded');
        }

        $(document).ready(function () {

            $(".button-collapse").sideNav();
        });

        $(document).on('click', '.home', function () {
          //  alert("in");
            clear_area();
            setTimeout(function () {
                $(".li_home").addClass('active');
                $("#home").fadeIn();
            },400);
        });

        $(document).on('click', '.star', function () {
            clear_area();
            setTimeout(function () {
                $(".li_star").addClass('active');
                $("#star").fadeIn();
            }, 400);
        });

        $(document).on('click', '.search', function () {
            clear_area();
            setTimeout(function () {
                $(".li_search").addClass('active');
                $("#search").fadeIn();
            }, 400);
        });

        $(document).on('click', '.account', function () {
            clear_area();
            setTimeout(function () {
                $(".li_account").addClass('active');
                $("#account").fadeIn();
            }, 400);
        });

        function clear_area()
        {
            $(document).ready(function () {

                if ($("#home").is(':visible')) {
                    $(".li_home").removeClass('active');
                    $("#home").fadeOut();
                }
                else if ($("#account").is(':visible')) {
                    $(".li_account").removeClass('active');
                    $("#account").fadeOut();
                }
                else if ($("#search").is(':visible')) {
                    $(".li_search").removeClass('active');
                    $("#search").fadeOut();
                }
                else if ($("#star").is(':visible')) {
                    $(".li_star").removeClass('active');
                    $("#star").fadeOut();
                }
               
            });

           
        }


        $(document).ready(function () {

            $("#ch_name_btn").click(function(){
                clear();
                setTimeout(function () { $(".name_div").fadeIn(); }, 500);
                
            });
            $("#ch_username_btn").click(function(){
                clear();
                setTimeout(function () { $(".username_div").fadeIn(); }, 500);
                
            });
            $("#ch_password_btn").click(function(){
                clear();
                setTimeout(function () { $(".password_div").fadeIn(); }, 500);
                
            });
            $("#ch_contact_btn").click(function(){
                clear();
                setTimeout(function () { $(".contact_div").fadeIn(); }, 500);
               
            });
            $("#ch_mail_btn").click(function () {
                clear();
                setTimeout(function () { $(".mail_div").fadeIn(); }, 500);
               
            });

        });

        function clear()
        {
            $(document).ready(function(){
                if($(".name_div").is(":visible"))
                {
                    $(".name_div").fadeOut();
                }
                else if($(".username_div").is(":visible"))
                {
                    $(".username_div").fadeOut();
                }
                else if($(".password_div").is(":visible"))
                {
                    $(".password_div").fadeOut();
                }
                else if($(".contact_div").is(":visible"))
                {
                    $(".contact_div").fadeOut();
                }
                else if($(".mail_div").is(":visible"))
                {
                    $(".mail_div").fadeOut();
                }

            });
        }
    </script>
       
    <script>
        alert(<%=ar4[0]%>);
    </script>
</body>
</html>
