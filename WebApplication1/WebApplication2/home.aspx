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
    
     <!--  <nav class="yellow lighten-1">
           <ul>
                    <li class="left"><a href="#!"><asp:Label ID="i_lbl" class="blue-text text-darken-2" runat="server" Text="Easy Travel"></asp:Label></a></li> 
               <li class="right"><a href="#!"><asp:Label ID="u_lbl" class="blue-text text-darken-2" runat="server" Text=""></asp:Label></a></li>
           </ul>
       </nav>

    -->
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
           <li class="center"><a class=" blue-text text-darken-1" href="#!">NAME</a></li>
        <li class="active"><a class="home blue-text text-darken-1" href="#!">Home</a></li>
		<li><a  class=" search blue-text text-darken-1"  href="#!">Search Packages</a></li>
        <li><a  class="star blue-text text-darken-1" href="#!">Starred Places</a></li>
        <li><a  class="account blue-text text-darken-1" href="#!">Account Settings</a></li>
		<li><a  class="blue-text text-darken-1" href="#!">Sign Out</a></li>
    </ul>
	
	 <ul id="mobile-demo" class="side-nav yellow purple-text">
    
    <li class="center">
        <h5 class="teal-text">Easy-Travel</h5>
       </li>
           <li><br /></li>
           <li class="center"><a class="blue-text text-darken-1" href="#!">NAME</a></li>
        <li class="active"><a  class="home blue-text text-darken-1" href="#!">Home</a></li>
		<li><a  class="search blue-text text-darken-1"  href="#!">Search Packages</a></li>
        <li><a  class="star blue-text text-darken-1" href="#!">Starred Places</a></li>
        <li><a  class=" account blue-text text-darken-1" href="#!">Account Settings</a></li>
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
                      <h6 class="yellow-text">Edit Your Profile</h6>
                      
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
                $("#home").fadeIn();
            },400);
        });

        $(document).on('click', '.star', function () {
            clear_area();
            setTimeout(function () {
                $("#star").fadeIn();
            }, 400);
        });

        $(document).on('click', '.search', function () {
            clear_area();
            setTimeout(function () {
                $("#search").fadeIn();
            }, 400);
        });

        $(document).on('click', '.account', function () {
            clear_area();
            setTimeout(function () {
                $("#account").fadeIn();
            }, 400);
        });

        function clear_area()
        {
            $(document).ready(function () {

                if ($("#home").is(':visible')) {
                    $("#home").fadeOut();
                }
                else if ($("#account").is(':visible')) {
                    $("#account").fadeOut();
                }
                else if ($("#search").is(':visible')) {
                    $("#search").fadeOut();
                }
                else if ($("#star").is(':visible')) {
                    $("#star").fadeOut();
                }
               
            });

        }
    </script>
       
</body>
</html>
