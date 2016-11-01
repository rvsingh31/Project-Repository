<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication2.agency.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Easy Travel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>

      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
     <style>
        img:hover {
  -webkit-filter: grayscale(0%);
  -webkit-transition: .5s ease-in-out;
  -moz-filter: grayscale(0%);
  -moz-transition: .5s ease-in-out;
  -o-transition: .5s ease-in-out;
} 

img {
  -webkit-filter: grayscale(100%);
  -webkit-transition: .5s ease-in-out;
  -moz-filter: grayscale(100%); 
  -moz-transition: .5s ease-in-out;
  -o-transition: .5s ease-in-out;
}
    </style>
</head>
<body class="blue lighten-4">

  <nav class="blue lighten-1">
      <ul class="white-text right">
          <li>EASY-TRAVEL</li>
      </ul>
  </nav>
        <form runat="server">
       
    <br />
    <div class="row">
        <div class="col s12 m12 card-panel yellow">
            <br />
                <h5 class="purple-text center">HOW IT WORKS</h5>
                <br />
                
  <div class="row">
      <div class="col s12 m3">
          <p></p>
      </div>
    <div class="col s12 m6">
      <ul class="tabs yellow">
        <li class="tab col s6"><a class="purple-text active" href="#traveller">FOR TRAVELLERS</a></li>
        <li class="tab col s6"><a class="purple-text" href="#agency">FOR AGENCIES</a></li>
       </ul>
    </div>
        <div class="col s12 m3">
          <p></p>
      </div>
    <div id="traveller" class="col s12 purple-text">
         <br />
         <br />
        <div class="row">
        <div class="col s12 l4 step">
			<div class="col l12 s3 center">
				<img class="responsive-image circle" src="../1.png" alt="Binoculars icon 41eab3bec08f44282d44354bf3ed4085b8830c156f3eb1c6548e8fde85134ce9" />
			</div>
			<div class="col l12 s9 center">
				<h5>Discover</h5>
				<p>
					Search Package listings from our tied-up agencies and get where you need to go.
				</p>
			</div>
		</div>

		<div class="col s12 l4 step">
           
			<div class="col l12 s3 center">
				<img class="responsive-image circle" src="../2.png" alt="Calendar icon c0ab1b5c4f18cb04e0d90804477cea002260e77ab98e55766672dff931e37685" />
			</div>

			<div class="col l12 s9 center">
				<h5>Book it</h5>
				<p>
					Connect with agencies, confirm arrangements, and pay – all through our secure services.
				</p>
			</div>
		</div>

		<div class="col s12 l4 step">
			<div class="col l12 s3 center">
				<img class="responsive-image circle" src="../3.png" alt="Car icon 672ac5eba7a39fe922ad9a0c39e58b65ff08f44ca6125c3a7ca6b02dfad53c97" />
			</div>

			<div class="col l12 s9 center">
				<h5>Go Somewhere</h5>
					<p>Enjoy the trip, make some new friends, and safely arrive at your destination.</p>
			</div>
		</div>
        </div>

        <div class="row">
            <br />
            <a href="../index.aspx" class="right waves-effect waves-light purple-text" ><u>Join the Travellers Group &rarr;</u></a>
        </div>
    </div>
    <div id="agency" class="col s12 purple-text">
        <br />
        <br />
        <div class="row">
        <div class="col s12 l4 step">
		<div class="col l12 s3 center">
			<img class="responsive-image circle" src="../4.png" alt="Laptop icon 96f04c991819410ae7ae49356a211d0ec6967f1f8b0b904b1c705cb037a325ed" />
		</div>
		<div class="col l12 s9 center">
			<h5>Post Your Trip</h5>
			<p>Plan your trip, name a price, and list it for travellers throughout the country to discover.</p>
		</div>
	</div>
	
	<div class="col s12 l4 step">
		<div class="col l12 s3 center">
			<img class="responsive-image circle" src="../5.png" alt="Handshake icon 31021deb195b747746306f1247a6fa4a03e8ce98ee250d071e1a4f567b02d479" />
		</div>
		<div class="col l12 s9 center">
			<h5>Book Passengers</h5>
			<p>Approve or deny potential passengers based upon their ratings or travel accommodations</p>
		</div>
	</div>
	
	<div class="col s12 l4 step">
		<div class="col l12 s3 center">
			<img class="responsive-image circle" src="../6.png" alt="Card icon 8a10ac9f2bdf6e4f65fb3704b0fabb44396e4eec3240efafb11736213d23eba6" />
		</div>
		<div class="col l12 s9 center">
			<h5>Keep a Track</h5>
			<p>Easy Management of E-Tickets and travellers who have registered for your triplings.</p>
		</div>
	</div>
            </div>
        
    </div>
  </div>
        
            <br />
        </div>
    </div>
    
    <div class="row">
        <div class="col s12 m1">
            <p></p>
        </div>
        <div class="col s12 m5 card-panel blue lighten-1">
          <h5 class="yellow-text center">Our Team</h5>
            <br />
            <div class="divider teal lighten-4" ></div>
            <br />
            
            <div class="row">
                <div class="col s12 m6">
                    <img src="../my_image.jpg" class="responsive-image circle" style="height:70%;width:70%" />
                </div>
                <div class="col s12 m6 yellow-text">
                   <h6 class="white-text center">Ravinder Singh</h6>
                    <ol type="disc">
                       <li>B.TECH<sup>*</sup>(Computer) 3<sup>rd</sup> Year.</li>
                       <li>Web-Developer.</li>
                       <li>From Ahmedabad,Gujarat.</li>
                        <li>ravindersingh3104.rs@gmail.com</li>
                       <li>+91-8460348865.</li>
                   </ol>
                </div>
            </div>
            
            <div class="divider teal lighten-4" ></div>
            <br />
            <div class="row">
                <div class="col s12 m6">
                    <img src="../IMG_3233.JPG" class="responsive-image circle" style="height:65%;width:65%" />
                </div>
                <div class="col s12 m6 yellow-text">
                   <h6 class="white-text center">Sagar Patel</h6>
                    <ol type="disc">
                       <li>B.TECH<sup>*</sup>(Computer) 3<sup>rd</sup> Year.</li>
                       <li>Web-Developer.</li>
                       <li>From Bharuch,Gujarat.</li>
                        <li>sampatel3636@gmail.com</li>
                       <li>+91-7990040590.</li>
                   </ol>

                </div>
            </div>
        
        </div>
        <div class="col s12 m1">
            <p></p>
        </div>
        <div class="col s12 m4 card-panel blue lighten-1">
            <div>
           
  <div class="row ">
    <div class="col s12 ">
      <ul class="tabs  blue lighten-1">
        <li class="tab col s3 "><a href="#login" class="active white-text">Login</a></li>
        <li class="tab col s3 "><a class="white-text" href="#register">Register</a></li>
       </ul>
    </div>
        

    <div id="login" class="col s12">
        
    <br />
            <asp:Panel id="loginPanel" DefaultButton="login_btn" Runat="Server">	
		           <div class="input-field">
                        <asp:Label ID="ulabel" runat="server" class="white-text text-darken-2" Text="Username"></asp:Label>
                        <asp:TextBox ID="uname" runat="server" class="white-text text-darken-2"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="uname" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr1"></asp:RequiredFieldValidator> 
                   </div>
                    <div class="input-field">
                        <asp:Label ID="plabel" runat="server" class="white-text text-darken-2" Text="Password"></asp:Label>
                        <asp:TextBox ID="passwd" type="password" runat="server" class="white-text text-darken-2"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="passwd" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr1"></asp:RequiredFieldValidator> 
             
                    </div>
                    <a href="../reset.aspx" class="yellow-text right">Forgot Password?</a>
                <br />   
            
                     <br />
        	
                   <asp:Button ID="login_btn" runat="server" UseSubmitBehavior="true" ValidationGroup="vgr1" Text="Login" display="none" class="btn waves-effect waves-light white darken-2 blue-text" OnClick="login_btn_Click" />               
            </asp:Panel>

     
    </div>
    <div id="register" class="col s12 teal-text">
       <br />
        <div class="input-field">
            <asp:Label ID="fnlbl" runat="server" class="white-text text-darken-2" Text="First Name"></asp:Label>
            <asp:TextBox ID="fname" runat="server" class="white-text text-darken-2"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="fname" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr2"></asp:RequiredFieldValidator> 
             
        </div>
                
        <div class="input-field">
            <asp:Label ID="lnlbl" runat="server" class="white-text text-darken-2" Text="Last Name"></asp:Label>
            <asp:TextBox ID="lname" runat="server" class="white-text text-darken-2"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="lname" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr2"></asp:RequiredFieldValidator> 
        
        </div>

        <div class="input-field">
            <asp:Label ID="unlbl" runat="server" class="white-text text-darken-2" Text="UserName"></asp:Label>
            <asp:TextBox ID="uname_r" runat="server" class="white-text text-darken-2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="uname_r" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr2"></asp:RequiredFieldValidator> 
  </div>

        <div class="input-field">
            <asp:Label ID="passlbl" runat="server" class="white-text text-darken-2" Text="Password"></asp:Label>
            <asp:TextBox ID="pass" Type="password" runat="server" class="white-text text-darken-2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="pass" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr2"></asp:RequiredFieldValidator> 
        </div>

        <div class="input-field">
            <asp:Label ID="repasslbl" runat="server" class="white-text text-darken-2" Text="Password(Again)"></asp:Label>
            <asp:TextBox ID="repass" Type="password" runat="server" class="teal-text"></asp:TextBox>
               
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="repass" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr2"></asp:RequiredFieldValidator> 
            <asp:CompareValidator ID="CompareValidator1" ValidationGroup="vgr2" ControlToValidate="repass" ControlToCompare="pass" runat="server" ErrorMessage="Password doesn't match"></asp:CompareValidator>
        </div>

        <div class="input-field">
            <asp:Label ID="conlbl" runat="server" class="white-text text-darken-2" Text="Contact"></asp:Label>
            <asp:TextBox ID="contact" runat="server" class="white-text text-darken-2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="contact" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr2"></asp:RequiredFieldValidator> 
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="contact" ValidationGroup="vgr2" ValidationExpression="^\d+$" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
      
        </div>

        <div class="input-field">
            <asp:Label ID="maillbl" runat="server" class="white-text text-darken-2" Text="Mail-id"></asp:Label>
            <asp:TextBox ID="mail" runat="server" class="white-text text-darken-2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="mail" runat="server" ErrorMessage="Required Field" ValidationGroup="vgr2"></asp:RequiredFieldValidator>  
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="mail" ValidationGroup="vgr2" ValidationExpression="\w+([­+.']\w+)*@\w+([­.]\w+)*\.\w+([­.]\w+)*" runat="server" ErrorMessage="Entered field is not a number"></asp:RegularExpressionValidator>
    
        </div>



               <asp:Button ID="register_btn" runat="server" ValidationGroup="vgr2" UseSubmitBehavior="true" Text="Register" class="btn waves-effect waves-light white darken-2 blue-text" OnClick="register_btn_Click"/>
            
        </div>
        
        </div>
             </div>
        <div class="col s12 m1">
            <p></p>
            <asp:Label ID="hidden_lbl" runat="server" Text="" class="blue-text text-lighten-1" ></asp:Label>
            <asp:Label ID="register_lbl_hidden" runat="server" Text="" class="blue-text text-lighten-1" ></asp:Label>
        </div>
    </div>
   </div>
  
      <footer class="page-footer purple lighten-1">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="yellow-text">Drop A Line</h5>
                <p class="yellow-text text-lighten-2">Leave us any kind of improvements or queries whichever may concern you regarding our web-app.It will definitely help us to improve our product.</p>
              
                  <div class="input-field">
                            <textarea class="materialize-textarea white-text" id="improve" onfocus="ho()" runat="server"></textarea>
                  <br />
                      <asp:Button runat="server" OnClick="send_btn_Click" class="btn waves-effect waves-light yellow purple-text" Text="Send"  ID="send_btn"></asp:Button>
                  </div>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="yellow-text">Sign-Up for News-Letter</h5>
                
              </div>
            </div>
          </div>
          <div class="footer-copyright purple">
            <div class="container yellow-text">
            © All Rights Reserved.<span class="blue-text text-lighten-3">2016</span>
            <a class="white-text right" href="#!">Developed by <span class="blue-text text-lighten-3">Ravinder Singh & Sagar Patel</span></a>
            </div>
          </div>
        </footer>
      
                </form>
        

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="/js/materialize.min.js"></script>
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



            function ho() {
                var str = "Please specify your name and contact number as well!";
                Materialize.toast(str, 2000, 'rounded');
            }
            </script>
 </body>
</html>
