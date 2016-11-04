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
    <link href="Scripts/pageguide.min.css" rel="stylesheet" />


    <style>
        .wrap_text {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

       


      @media (min-width: 991px) {
    main {
        padding-left: 150px;
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
			<li><a href="#" class="purple-text">Easy travel</a></li>
		</ul>
		<a href="#" data-activates="mobile-demo" class="button-collapse purple-text"><i class="material-icons">menu</i></a>
      
	   <ul  class="side-nav fixed yellow purple-text"> 
       <li class="center">
        <h5 class="teal-text">Easy-Travel</h5>
       </li>
           <li><br /></li>
           <li class="one center"><a class=" blue-text text-darken-1" href="#!"><%=vtr %></a></li>
            <li class="two active li_home"><a class="home blue-text text-darken-1" href="#!">Home</a></li>
		<li class="three li_search"> <a  class=" search blue-text text-darken-1"  href="#!">Search Packages</a></li>
        <li class="four li_star"><a  class="star blue-text text-darken-1" href="#!">History</a></li>
        <li class="five li_account"><a  class="account blue-text text-darken-1" href="#!">Account Settings</a></li>
		<li><a  class="blue-text text-darken-1" href="logout.aspx">Sign Out</a></li>
    </ul>
	
	 <ul id="mobile-demo" class="side-nav yellow purple-text">
    
    <li class="center">
        <h5 class="teal-text">Easy-Travel</h5>
       </li>
           <li><br /></li>
           <li class="center"><a class="blue-text text-darken-1" href="#!"><%=vtr %></a></li>
        <li class="active li_home"><a  class="home blue-text text-darken-1" href="#!">Home</a></li>
		<li class="li_search"><a  class="search blue-text text-darken-1"  href="#!">Search Packages</a></li>
        <li class="li_star"><a  class="star blue-text text-darken-1" href="#!">History</a></li>
        <li class="li_account"><a  class=" account blue-text text-darken-1" href="#!">Account Settings</a></li>
		<li><a  class="blue-text text-darken-1" href="logout.aspx">Sign Out</a></li>
    
	</ul>
    </div>
  </nav>
      </div>
    <main>
      
        <div class="section intro">
         
            <div class="container">
                <br />
                <div><a href="inquiry.aspx" class="btn waves-effect right waves-light yellow blue-text">Leave an Inquiry</a></div>
                    <br />
                <div id="home" >
                            <h5 class="yellow-text header light"><span>Best Deals for you!!</span></h5>
                    <br />
                    
                    <div class="row">
                        <div class="col s12 m1"></div>
                        <% for (y=0; y<ar2.Count;y=y+6)
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

                        
                        <div class=" col s12 m5 ">
                            <div class="card white">
                                <div class="card-image">
                                 <img src="<%=ar2[y+5] %>"/> 
                                 </div>
                                 <div class="card-content">
                                    <h6 class="teal-text"><%=ar2[y+1] %></h6>
                                     <p class="wrap_text blue-text"><span class="teal-text">Description:</span> <%=ar2[y+2] %>
                                         <br />
                                        <span class="teal-text">Package Duration</span>  :<%=ar2[y+4] %>
                                         <br />
                                        <span class="teal-text">Rs</span>  <%=ar2[y+3] %> 
                                        
                                     </p>
                                 </div>
                                 <div class="card-action">
                                    <a href="intr_show_package.aspx?id=<%=ar2[y] %>">VIEW PACKAGE</a>
                                   
                                  </div>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="fname_input" ValidationGroup="vl1" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                                    <label for="fname_input">First Name</label>
                                                </div>
                                            <div class="col s12 m6 input-field">
                                                    <asp:TextBox ID="lname_input" runat="server" class="blue-text" ></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="lname_input" ValidationGroup="vl1" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                                   
                                                <label for="lname_input">Last Name</label>
                                            </div>
                                            <br />
                                            <div class="center">
                                            <asp:Button ID="name_bt" runat="server" ValidationGroup="vl1" UseSubmitBehavior="true" OnCommand="Changes" CommandArgument="name" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
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
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="username_input" ValidationGroup="vl2" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                        <br />
                                        <div class="center">
                                            <asp:Button ID="username_bt" ValidationGroup="vl2" UseSubmitBehavior="true" runat="server" OnCommand="Changes" CommandArgument="username" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
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
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="password_input" ValidationGroup="vl3" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                           <br />
                                        <div class="center">
                                            <asp:Button ID="password_bt" runat="server" OnCommand="Changes" ValidationGroup="vl3" UseSubmitBehavior="true" CommandArgument="password" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
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
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="contact_input" ValidationGroup="vl4" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="contact_input" ValidationGroup="vl4" ValidationExpression="^\d+$" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
                                          <br />
                                        <div class="center">
                                            <asp:Button ID="contact_bt" runat="server" OnCommand="Changes" UseSubmitBehavior="true" ValidationGroup="vl4" CommandArgument="contact" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="email_input" ValidationGroup="vl5" runat="server" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="email_input" ValidationGroup="vl5"  ValidationExpression="\w+([­+.']\w+)*@\w+([­.]\w+)*\.\w+([­.]\w+)*" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
                                         <br />
                                        <div class="center">
                                            <asp:Button ID="email_bt" runat="server" UseSubmitBehavior="true" ValidationGroup="vl5" OnCommand="Changes" CommandArgument="email" class="btn waves-effect waves-light yellow blue-text" Text="Change"></asp:Button>
                                                &nbsp;
                                            <button type="reset" class="btn waves-effect waves-light yellow blue-text">CLEAR</button>
                                            </div>
                                                <br />
                                    </div>
                                 
                            </div>      
                </div>
                <div id="search" style="display:none">
                      <h5 class="yellow-text">Search Packages </h5>
             <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">              
                 <ContentTemplate>    
                      <div class="row">
                        <div class="col s12 m12 input-field">
                            <asp:TextBox ID="search_input" runat="server" class="white-text"></asp:TextBox>
                            <label class="yellow-text" for="search_input"></label>
                            &nbsp; <asp:Button runat="server" class="btn waves-effect waves-light yellow blue-text" OnClick="searchb_click" Text="Search"></asp:Button>
                        </div>
                        <br />
                       <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                          
                                  <h6 class="center yellow-text">Loading...</h6> 
                          
                        </ProgressTemplate>
                    </asp:UpdateProgress>    
               
                      </div>

                            <div class="row">
                        <div class="col s12 m1"></div>
                        <% if (ar3.Count > 0)
                                 {
                                     for (y = 0; y < ar3.Count; y = y + 6)
                                     {
                                         if (count == 2)
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

                        
                        <div class=" col s12 m5 ">
                            <div class="card white">
                                <div class="card-image">
                                 <img src="<%=ar3[y + 5] %>"/> 
                                 </div>
                                 <div class="card-content">
                                    <h6 class="teal-text"><%=ar3[y + 1] %></h6>
                                     <p class="wrap_text blue-text"><span class="teal-text">Description:</span> <%=ar3[y + 2] %>
                                         <br />
                                        <span class="teal-text">Package Duration</span>  :<%=ar3[y + 4] %>
                                         <br />
                                        <span class="teal-text">Rs</span>  <%=ar3[y + 3] %> 
                                        
                                     </p>
                                 </div>
                                 <div class="card-action">
                                    <a href="intr_show_package.aspx?id=<%=ar3[y] %>">VIEW PACKAGE</a>
                                  </div>
                           </div>

                       </div>

                       
                        <div class="col s12 m1"><p></p></div>

                         <% count++;
                                     }
                                 }

                                 else
                                 {
                                 %>
                                               <br />
                                                <h6 class="white-text center">No packages to show!! <a class="yellow-text" href="inquiry.aspx">Leave an inquiry here</a></h6>
                               <%    
                                 }  %>

                    </div>

                     
                     
                       </ContentTemplate>

                 </asp:UpdatePanel>
                      
                </div>
                <div id="star" style="display:none">
                      <h6 class="yellow-text">Here you'll see your history of trips and also the packages that you have starred!</h6>
                      <h6 class="yellow-text"><i>NOTE</i>: If a particular package which you have recently booked and it qualifies for cancellation,then only the <i>cancellation button</i> will be enabled!</h6>

                      <br />

                    <div class="row">
                        <div class="card-panel col s12 m5 white">
                            <h5 class="blue-text center">History</h5>
                            <div class="divider blue"></div>
                            <br />
                            <%if(ar4.Count!=0)
                                { 

                                for (int e = 0; e < ar4.Count; e = e + 3)
                                {%>
                                <fieldset>
                                    <legend class="blue-text"><%=ar4[e+1] %></legend>
                                    <a href="intr_cancel.aspx?view=yes&p_id=<%=ar4[e] %>" class="left btn waves-effect waves-light yellow blue-text">VIEW</a>
                                    <%if (ar4[e + 2].ToString() == "")
                                        {  %>
                                                  <a class="right btn waves-effect waves-light yellow blue-text" style="<%=ar4[e+2] %>" href="intr_cancel.aspx?p_id=<%=ar4[e] %>">Cancellation</a>
                                   <%     }
                                      %>

                                </fieldset>
                           <%   }
                               }
                               else
                               {%>
                                   <h6 class="blue-text">No Packages to show!</h6>
                            <%   }
                               %>
                            <br />
                        </div>
                        <div class="col s12 m1">
                            <p></p>
                        </div>
                        <div class="card-panel col s12 m5 white">
                            <h5 class="blue-text center">Starred Places</h5>
                            <div class="divider blue"></div>
                            <div class="collection" id="starred_div" runat="server">
                            </div>
                            <br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 m2">
                            <p></p>
                        </div>
                        <div class="col s12 m8 card-panel">
                            <h6 class="blue-text center">Cancellation Status!</h6>
                         <br />
                            <p class="teal-text"><i>NOTE:</i> The following packages have been already cancelled and displayed here only because the refund is being processed.
                                As soon as the refund is complete, the corresponding package's cancellation process will be complete .
                            </p>
                            <p class="teal-text">
                                A package cancellation can only be possible if the difference of current date and trip date is minimum one month.
                            </p>
                            <br />
                            <div class="collection">
                            <% if (ar5.Count != 0)
                                {
                                    for(int r=0;r<ar5.Count;r=r+2)
                                    {
                                        %>
                                  <a href="#!" id="<%=ar5[r+1] %>" class="collection-item blue-text"><%=ar5[r] %><br /> <span class="teal-text">Status:</span> &nbsp; Refund in Progress!</a>  
                                    
                              <%      }
                                } %>
                        </div>
                        </div>

                        <div class="col s12 m2">
                            <p></p>
                        </div>

                    </div>
                </div>
          
                </div>
                       
            </div>
     
          
    </main>
    </form>

     <ul id="tlyPageGuide" class="pg1" data-tourtitle="How the Website Works">
      <li class="tlypageguide_right" data-tourtarget=".one">
        <div>
          Welcome to our Web-App, take this tour to be familirized with it.There are various sections in our Website. Let's explore them one by one.
        </div>
      </li>
      <li class="tlypageguide_right" data-tourtarget=".two">
        <div>
         HOME- This section is where you'll get a display of various tour packages provided by various agencies , which are new and shown to you according to their availability.
        </div>
      </li>
      <li class="tlypageguide_right" data-tourtarget=".three">
        <div>
         SEARCH- We know it may be tiresome work to dig the tour which you are interested so here is a search section which allows you to search your desired package on the basis of the place which you want to visit.
        </div>
      </li>
      <li class="tlypageguide_right" data-tourtarget=".four">
        <div>
        HISTORY-  This section is where your booked package details and the cancellation details (if any) are displayed ,so you can keep a track of trips which you have made or are about to make!
                There are three sub sections : History,Starred Places,Cancellations.
                In History ,your current booked packages are shown which can be cancelled accordingly.
                In Starred Places,are the packages which you have saved while browsing through packages.
                In Cancelleations, a block is live only till you get your refund and then that live block is deleted.
        </div>
      </li>
       <li class="tlypageguide_right" data-tourtarget=".five">
        <div>
        ACCOUNT SETTINGS-  This section is where you can change your account details as in name,username,password etc.
        </div>
      </li>
       
    </ul>

     

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
                {    $(".contact_div").fadeOut();
                }
                else if($(".mail_div").is(":visible"))
                {
                    $(".mail_div").fadeOut();
                }

            });
        }



    </script>
    <script src="Scripts/pageguide.min.js"></script>
                
    <script>
        jQuery(document).ready(function () {
          var pageguide=  tl.pg.init();
        });
    </script>

       
   
</body>
</html>
