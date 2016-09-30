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
    
  <nav class="white">
    <div class="nav-wrapper">
		<ul class="left">
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

    <main>
        <div class="section intro">
            <div class="container">
                <br />
                <div id="home">
                            <h5 class="yellow-text header light">Best Deals for you!!</h5>
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
                                        <button id="ch_name_btn" class="btn right waves-effect waves-light yellow blue-text text-darken-1">Change</button>
                                        <br />
                                    </div>
                                    <div>
                                        <br />
                                        <span class="blue-text text-darken-1">UserName : <span class="teal-text"><%=ar[1] %></span></span>
                                        &nbsp;
                                        <button id="ch_username_btn" class="btn right  waves-effect waves-light yellow blue-text text-darken-1">Change</button>
                                        <br />
                                    </div>
                                    <div>
                                        <br />
                                        <span class="blue-text text-darken-1">Password : <span class="teal-text"><%=ar[2] %></span></span>
                                        &nbsp;
                                        <button id="ch_password_btn" class="btn right  waves-effect waves-light yellow blue-text text-darken-1">Change</button>
                                        <br />
                                    </div>
                                    <div>
                                        <br />
                                        <span class="blue-text text-darken-1">Contact : <span class="teal-text"><%=ar[3] %></span></span>
                                        &nbsp;
                                        <button id="ch_contact_btn" class="btn right  waves-effect waves-light yellow blue-text text-darken-1">Change</button>
                                           <br />
                                    </div>
                                    <div>
                                        <br />
                                        <span class="blue-text text-darken-1">Mail : <span class="teal-text"><%=ar[4] %></span></span>
                                        &nbsp;
                                        <button id="ch_mail_btn" class="btn right  waves-effect waves-light yellow blue-text text-darken-1">Change</button>
                                    
                                    </div>

                                    <br />
                                </div>
                                <div class="col s12 m1"><p></p></div>
                            
                                <div class="col s12 m6 card-panel yellow change_div" style="display:none">
                                    <div class="name_div" style="display:none">
                                        
                                    </div>
                                    <div class="username_div" style="display:none">

                                    </div>
                                    <div class="password_div" style="display:none">

                                    </div>
                                    <div class="contact_div" style="display:none">

                                    </div>
                                    <div class="mail_div" style="display:none">

                                    </div>
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
    


     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    <script>
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
    </script>
       
</body>
</html>
