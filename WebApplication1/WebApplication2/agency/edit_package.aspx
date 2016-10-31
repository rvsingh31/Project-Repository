<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_package.aspx.cs" Inherits="WebApplication2.agency.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Package</title>
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
           <li class="center"><a class=" yellow-text text-darken-1" href="#!"><%=Session["package_name"] %></a></li>
           <li><br /></li>
            <li class="active name_li"><a class="change name white-text">Name of Package</a></li>
                 <li class="description_li"><a class="change white-text description">Description of Package</a></li>
                 <li class="cost_li"><a class="change cost white-text">Cost of Package</a></li>
                 <li class="duration_li"><a  class="change duration white-text">Package's Duration</a></li>
                 <li class="limit_li"><a  class="change limit white-text">Limit of Customers</a></li>
                 <li class="expiry_li"><a  class="change expiry white-text"> Trip Date</a></li>
                 <li class="location_li"><a  class="change location white-text">Location</a></li>
                <li class="image_li"><a  class="change image white-text">Image</a></li>
                
    </ul>
	
	 <ul id="mobile-demo" class="side-nav blue darken-1">
    
    <li class="center">
        <h6 class="yellow-text">Make Changes</h6>
       </li>
           <li><br /></li>
           <li class="center"><a class="blue-text text-darken-1" href="#!"><%=Session["package_name"] %></a></li>
         <li><br /></li>
               <li class="active name_li"><a class="change name white-text">Name of Package</a></li>
                 <li class="description_li"><a  class="change description white-text">Description of Package</a></li>
                 <li class="cost_li"><a  class="change cost white-text">Cost of Package</a></li>
                 <li class="duration_li"><a  class="change duration white-text">Package's Duration</a></li>
                 <li class="limit_li"><a  class="change limit white-text">Limit of Customers</a></li>
                 <li class="expiry_li"><a  class="change expiry white-text"> Trip Date</a></li>
                 <li class="location_li"><a  class="change location white-text">Location</a></li>
                <li class="image_li"><a  class="change image white-text">Image</a></li>             
    
	</ul>
    </div>
  </nav>

    <main>
        <div class="container">
    <form id="form1" runat="server">
            <br />
        <br />
        <div class="row">
            <div class="col s12 m2" style="border-radius:1%">
               <p id="msg" style="display:none"><%=msg %></p>
            </div>

            <div class="col s12 m2">
                <p></p>
            </div>
            <div class="col s12 m8 blue darken-1" style="border-radius:1%;height:26em;overflow-y:auto;">
                       <div class="white-text" id="name">
                            <h6 class="white-text center text-lighten-1">Change your Package name</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT NAME:</h6>
                            <span class="yellow-text"> <asp:Label ID="name_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Name"></asp:Label>
                                <asp:TextBox id="name_field" runat="server" class="white-text"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="g1" ControlToValidate="name_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                            </div>   
                            <br />
                            <asp:Button ID="name_btn" ValidationGroup="g1" UseSubmitBehavior="true" OnCommand="Update_Event" CommandArgument="name_div" runat="server" class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />
                        </div>

                        <div class="" id="description" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Description</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT DESCRIPTION:</h6>
                            <span class="yellow-text"> <asp:Label ID="desc_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Description"></asp:Label>
                                <asp:TextBox id="desc_field" runat="server" class="white-text"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="g2" ControlToValidate="desc_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                   
                            </div>   
                            <br />
                            <asp:Button ID="desc_btn" runat="server" ValidationGroup="g2" UseSubmitBehavior="true" OnCommand="Update_Event" CommandArgument="description_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />

                        </div>

                        <div class="" id="cost" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Cost</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT COST:</h6>
                            <span class="yellow-text"> <asp:Label ID="cost_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Cost"></asp:Label>
                                        
                                <div class="row">
                                        <div class="input-field col s6 ">
                                            <asp:TextBox ID="adult_field" runat="server" placeholder="ADULT" class="white-text"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="g3" ControlToValidate="adult_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                   
                                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="adult_field" ValidationGroup="g3" ValidationExpression="^\d+$" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
 
                                        </div>
                                       <div class="input-field col s6 ">
                                           <asp:TextBox ID="child_field" runat="server" placeholder="CHILD"  class="white-text"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="g3" ControlToValidate="child_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                   
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="child_field" ValidationGroup="g3" ValidationExpression="^\d+$" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
 
                                       </div>
                                </div>
                                
                              </div>   
                            <br />
                            <asp:Button ID="contact_btn" runat="server" ValidationGroup="g3" UseSubmitBehavior="true" OnCommand="Update_Event" CommandArgument="cost_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />   
                        </div>

                        <div class="" id="duration"  style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Duration</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT DURATION:</h6>
                            <span class="yellow-text"> <asp:Label ID="duration_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Duration"></asp:Label>
                                <div class="row">
                                        <div class="input-field col s6 ">
                                            <asp:TextBox ID="days_field" runat="server" placeholder="Days" class="white-text"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="g4" ControlToValidate="days_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                   
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="days_field" ValidationGroup="g4" ValidationExpression="^\d+$" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
          
                                             </div>
                                       <div class="input-field col s6 ">
                                           <asp:TextBox ID="nights_field" runat="server" placeholder="Nights"  class="white-text"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="g4" ControlToValidate="nights_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                   
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="nights_field" ValidationGroup="g4" ValidationExpression="^\d+$" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
 
                                                         </div>
                                  </div>    
                            
                            </div>   
                            <br />
                            <asp:Button ID="duration_btn" runat="server" ValidationGroup="g4" UseSubmitBehavior="true" OnCommand="Update_Event" CommandArgument="duration_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />                   
                        </div>

                        <div class="" id="limit"  style="display:none">
                        <h6 class="white-text center text-lighten-1">Change your Package Limit</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT LIMIT:</h6>
                            <span class="yellow-text"> <asp:Label ID="limit_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Limit"></asp:Label>
                                <asp:TextBox id="limit_field" runat="server" class="white-text"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="g5" ControlToValidate="limit_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="limit_field" ValidationGroup="g5" ValidationExpression="^\d+$" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
 
                                        </div>   
                            <br />
                            <asp:Button ID="limit_btn" runat="server" ValidationGroup="g5" UseSubmitBehavior="true" OnCommand="Update_Event" CommandArgument="limit_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />
                        </div>
                        <div class="" id="expiry" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Trip Date</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT VALUE:</h6>
                            <span class="yellow-text">  <asp:Label ID="expiry_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Date"></asp:Label>
                                <asp:TextBox id="expiry_field" runat="server" class="white-text datepicker"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="g6" ControlToValidate="expiry_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                   
                            </div>   
                            <br />
                            <asp:Button ID="date_btn" runat="server" ValidationGroup="g6" UseSubmitBehavior="true" OnCommand="Update_Event" CommandArgument="expiry_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />                            
                        </div>

                        <div class="" id="location" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Location</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT Location:</h6>
                            <span class="yellow-text"> <asp:Label ID="location_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Location"></asp:Label>
                                <asp:TextBox id="location_field" runat="server" class="white-text"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="g7" ControlToValidate="location_field" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>      
                   

                            </div>   
                            <br />
                            <asp:Button ID="location_btn" runat="server" ValidationGroup="g7" UseSubmitBehavior="true" OnCommand="Update_Event" CommandArgument="location_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />                        
                        </div>
                    
                    <div class="" id="image" style="display:none">
                        <h6 class="white-text center text-lighten-1">Change your Package Image</h6>                    
                               <br />
                        <div class="row">
                        <div class="col s12 m6">
                            <img id="current_image"  src="<%=img_link %>" />
                                
                        </div>
                            <br />
                             <div class="col s12 m6 ">
                              <asp:Label runat="server" Text="Upload New Image (Only JPEG accepted)" class="white-text"></asp:Label>
                              <br />
                            <asp:FileUpload runat="server" ID="f1" ></asp:FileUpload>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="g8" ControlToValidate="f1" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                           
                                  <br />
                              <br />
                              </div>
                                <br />
                            <asp:Button ID="Button1" runat="server" ValidationGroup="g8" UseSubmitBehavior="true" OnCommand="Update_Event" CommandArgument="image_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />  
                            </div>

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


            $('.datepicker').pickadate({
                selectMonths: true,
                selectYears: 15,
                format: 'dd/mm/yyyy'
            });

        });

        $(document).ready(function () {

            $(".button-collapse").sideNav();
        });

        $(document).on('click', '.name', function () {
            clear_area();

            setTimeout(function () {
                $("#name").fadeIn();
                $(".name_li").addClass('active');
                }, 500);
                    });
        $(document).on('click', '.description', function () {
            clear_area();
            setTimeout(function () {
                $("#description").fadeIn();
                $(".description_li").addClass('active');
            }, 500);
        });
        $(document).on('click', '.cost', function () {
            clear_area();
            setTimeout(function () {
                $("#cost").fadeIn();
                $(".cost_li").addClass('active');
            }, 500);
        });
        $(document).on('click', '.duration', function () {
            clear_area();
            setTimeout(function () {
                $("#duration").fadeIn();
                $(".duration_li").addClass('active');
            }, 500);
        });
        $(document).on('click', '.limit', function () {
            clear_area();
            setTimeout(function () {
                $("#limit").fadeIn();
                $(".limit_li").addClass('active');
            }, 500);
        });
        $(document).on('click', '.expiry', function () {
            clear_area();
            setTimeout(function () {
                $("#expiry").fadeIn();
                $(".expiry_li").addClass('active');
            }, 500);
        });
        $(document).on('click', '.location', function () {
            clear_area();
            setTimeout(function () {
                $("#location").fadeIn();
                $(".location_li").addClass('active');
            }, 500);
        });

        $(document).on('click', '.image', function () {
            clear_area();
            setTimeout(function () {
                $("#image").fadeIn();
                $(".image_li").addClass('active');
            }, 500);
        });


        function clear_area() {
            $(document).ready(function () {

                if ($("#name").is(':visible')) {
                    $("#name").fadeOut();
                    $(".name_li").removeClass('active');
                }
                else if ($("#description").is(':visible')) {
                    $("#description").fadeOut();
                    $(".description_li").removeClass('active');

                }
                else if ($("#cost").is(':visible')) {
                    $("#cost").fadeOut();
                    $(".cost_li").removeClass('active');

                }
                else if ($("#duration").is(':visible')) {
                    $("#duration").fadeOut();
                    $(".duration_li").removeClass('active');

                }
                else if ($("#limit").is(':visible')) {
                    $("#limit").fadeOut();
                    $(".limit_li").removeClass('active');

                }
                else if ($("#expiry").is(':visible')) {
                    $("#expiry").fadeOut();
                    $(".expiry_li").removeClass('active');

                }
                else if ($("#location").is(':visible')) {
                    $("#location").fadeOut();
                    $(".location_li").removeClass('active');

                }
                else if ($("#image").is(':visible')) {
                    $("#image").fadeOut();
                    $(".image_li").removeClass('active');

                }

            });
            
        }
    </script>
</body>
</html>
