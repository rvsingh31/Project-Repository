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
            color:white;
           opacity:1;
           text-decoration:none;
           cursor:pointer;
        }
        .change:hover{
            opacity:0.6;
            color:blue;
            transition:opacity 0.1s ease-in, color 0.2s linear;
            -webkit-transition:opacity 0.1s ease-in, color 0.2s linear; 
        }

 
    </style>
</head>
<body class="blue lighten-4">
    <nav class="blue lighten-1">
        <div class="nav-wrapper">
            <a href="#!" class="white-text">Easy Travel</a>
            <a href="#" data-activates="mobile-demo" class="button-collapse white-text"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="a_home.aspx" class="white-text">Home</a></li>
        <li><a href="#!" class="white-text"><%=Session["package_name"] %></a></li>
      </ul>
      <ul class="side-nav" id="mobile-demo">
        <li><a href="a_home.aspx" class="blue-text">Home</a></li>
        <li><a href="#!" class="blue-text"><%=Session["package_name"] %></a></li>
      </ul>
    </div>
  </nav>


    <form id="form1" runat="server">
            <br />
        <br />
        <div class="row">
            <div class="col s12 m2 red lighten-3 center" style="border-radius:1%">
                <br />
                  <h6 class="change name">Name of Package</h6>
                  <br />
                   <h6 class="change description">Description of Package</h6>
                  <br />
                 <h6 class="change cost">Cost of Package</h6>
                  <br />
                 <h6 class="change duration">Package's Duration</h6>
                  <br />
                 <h6 class="change limit">Limit of Customers</h6>
                  <br />
                 <h6 class="change expiry">Package's Expiration Date</h6>
                  <br />
                 <h6 class="change location">Location</h6>
                  <br />
            </div>

            <div class="col s12 m2">
                <p></p>
            </div>
            <div class="col s12 m8 red lighten-3" style="border-radius:1%;height:26em;overflow-y:auto;">
                <div class="row">
                    <div class="col s12 m5">
                        <div class="white-text" id="name">
                            <h6 class="white-text center text-lighten-1">Change your Package name</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT NAME:</h6>
                            <span class="teal-text"> <asp:Label ID="name_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Name"></asp:Label>
                                <asp:TextBox id="name_field" runat="server" class="white-text"></asp:TextBox>
                            </div>   
                            <br />
                            <asp:Button ID="name_btn" OnCommand="Update_Event" CommandArgument="name_div" runat="server" class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />
                        </div>

                        <div class="" id="description" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Description</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT DESCRIPTION:</h6>
                            <span class="teal-text"> <asp:Label ID="desc_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Description"></asp:Label>
                                <asp:TextBox id="desc_field" runat="server" class="white-text"></asp:TextBox>
                            </div>   
                            <br />
                            <asp:Button ID="desc_btn" runat="server" OnCommand="Update_Event" CommandArgument="description_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />

                        </div>

                        <div class="" id="cost" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Cost</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT COST:</h6>
                            <span class="teal-text"> <asp:Label ID="cost_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Cost"></asp:Label>
                                        
                                <div class="row">
                                        <div class="input-field col s6 ">
                                            <asp:TextBox ID="adult_field" runat="server" placeholder="ADULT" class="white-text"></asp:TextBox>
                                       </div>
                                       <div class="input-field col s6 ">
                                           <asp:TextBox ID="child_field" runat="server" placeholder="CHILD"  class="white-text"></asp:TextBox>
                                       </div>
                                </div>
                                
                              </div>   
                            <br />
                            <asp:Button ID="contact_btn" runat="server" OnCommand="Update_Event" CommandArgument="cost_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />   
                        </div>

                        <div class="" id="duration"  style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Duration</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT DURATION:</h6>
                            <span class="teal-text"> <asp:Label ID="duration_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Duration"></asp:Label>
                                <div class="row">
                                        <div class="input-field col s6 ">
                                            <asp:TextBox ID="days_field" runat="server" placeholder="Days" class="white-text"></asp:TextBox>
                                       </div>
                                       <div class="input-field col s6 ">
                                           <asp:TextBox ID="nights_field" runat="server" placeholder="Nights"  class="white-text"></asp:TextBox>
                                       </div>
                                  </div>    
                            
                            </div>   
                            <br />
                            <asp:Button ID="duration_btn" runat="server" OnCommand="Update_Event" CommandArgument="duration_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />                   
                        </div>

                        <div class="" id="limit"  style="display:none">
                        <h6 class="white-text center text-lighten-1">Change your Package Limit</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT LIMIT:</h6>
                            <span class="teal-text"> <asp:Label ID="limit_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Limit"></asp:Label>
                                <asp:TextBox id="limit_field" runat="server" class="white-text"></asp:TextBox>
                            </div>   
                            <br />
                            <asp:Button ID="limit_btn" runat="server" OnCommand="Update_Event" CommandArgument="limit_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />
                        </div>
                        <div class="" id="expiry" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Expiration Date</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT VALUE:</h6>
                            <span class="teal-text">  <asp:Label ID="expiry_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Date"></asp:Label>
                                <asp:TextBox id="expiry_field" runat="server" class="white-text datepicker"></asp:TextBox>
                            </div>   
                            <br />
                            <asp:Button ID="date_btn" runat="server" OnCommand="Update_Event" CommandArgument="expiry_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />                            
                        </div>

                        <div class="" id="location" style="display:none">
                            <h6 class="white-text center text-lighten-1">Change your Package Location</h6>                    
                               <br />
                            <h6 class="white-text">CURRENT Location:</h6>
                            <span class="teal-text"> <asp:Label ID="location_lbl" runat="server" Text=""></asp:Label></span>
                            <br />
                            <div class="input-field">
                                <asp:Label runat="server" class="white-text" Text="New Location"></asp:Label>
                                <asp:TextBox id="location_field" runat="server" class="white-text"></asp:TextBox>
                            </div>   
                            <br />
                            <asp:Button ID="location_btn" runat="server" OnCommand="Update_Event" CommandArgument="location_div"  class="btn waves-effect waves-light white teal-text" Text="Change"></asp:Button>
                               &nbsp;
                            <button type="reset" class="btn waves-effect waves-light white teal-text">CLEAR</button>
                            <br />                        
                        </div>

                    </div>
                    <div class="col s12 m2"><p id="msg" style="display:none"><%=msg %></p></div>
                    <div class="col s12 m2">
                        <p>ANIMATED DIV</p>
                    </div>
                </div>
            </div>

        </div>

    </form>

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
                }, 500);
                    });
        $(document).on('click', '.description', function () {
            clear_area();
            setTimeout(function () {
                $("#description").fadeIn();
            }, 500);
        });
        $(document).on('click', '.cost', function () {
            clear_area();
            setTimeout(function () {
                $("#cost").fadeIn();
            }, 500);
        });
        $(document).on('click', '.duration', function () {
            clear_area();
            setTimeout(function () {
                $("#duration").fadeIn();
            }, 500);
        });
        $(document).on('click', '.limit', function () {
            clear_area();
            setTimeout(function () {
                $("#limit").fadeIn();
            }, 500);
        });
        $(document).on('click', '.expiry', function () {
            clear_area();
            setTimeout(function () {
                $("#expiry").fadeIn();
            }, 500);
        });
        $(document).on('click', '.location', function () {
            clear_area();
            setTimeout(function () {
                $("#location").fadeIn();
            }, 500);
        });

        function clear_area() {
            $(document).ready(function () {

                if ($("#name").is(':visible')) {
                    $("#name").fadeOut();
                }
                else if ($("#description").is(':visible')) {
                    $("#description").fadeOut();
                }
                else if ($("#cost").is(':visible')) {
                    $("#cost").fadeOut();
                }
                else if ($("#duration").is(':visible')) {
                    $("#duration").fadeOut();
                }
                else if ($("#limit").is(':visible')) {
                    $("#limit").fadeOut();
                }
                else if ($("#expiry").is(':visible')) {
                    $("#expiry").fadeOut();
                }
                else if ($("#location").is(':visible')) {
                    $("#location").fadeOut();
                }
            });
            
        }
    </script>
</body>
</html>
