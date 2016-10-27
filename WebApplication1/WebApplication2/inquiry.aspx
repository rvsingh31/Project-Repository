<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inquiry.aspx.cs" Inherits="WebApplication2.inquiry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Leave an Inquiry</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    

</head>
<body>
    <nav class="yellow">
        <a  href="#!" class="left blue-text" >EASY-TRAVEL</a>
        <ul class="right">
			<li><a href="home.aspx" class="right blue-text ">HOME</a></li>
		</ul>
    </nav>
    <br />
    <form id="form1" runat="server">
    <div class="row"> 
        <div class="col s12 m1">
            <p>
            </p>
        </div>
        <div class="card-panel blue col s12 m5 yellow-text">
            <h6 class="center">What does an Inquiry Form do?</h6>
        </div>
        <div class="col s12 m1">
            <p>
            </p>
        </div>
        <div class="card-panel blue col s12 m4 yellow-text">
            <h6 class="center">Inquiry Form</h6>
            <br />
            <div class="input-field">
                <asp:Label ID="l1" runat="server" class="white-text" Text="Desired Location"></asp:Label>
                <asp:TextBox ID="location" runat="server" class="yellow-text"></asp:TextBox>
            </div>
            <br />
            <div class="input-field">
                <asp:Label ID="l2" runat="server" class="white-text" Text="Description"></asp:Label>
                <asp:TextBox ID="description" runat="server" class="yellow-text"></asp:TextBox>
            </div>
            <br />
             <div class="input-field">
                <asp:Label ID="l3" runat="server" class="white-text" Text="Budget(Approximate)"></asp:Label>
                <asp:TextBox ID="budget" runat="server" class="yellow-text"></asp:TextBox>
            </div>
            <br />
            <asp:Button id="enq_button" runat="server" OnClick="enq_submit" class="btn waves-effect waves-light yellow blue-text" Text="Submit"></asp:Button>
            <br />
            <br />
        </div>
        <div class="col s12 m1">
            <p></p>
        </div>
    </div>
    </form>

    
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    
</body>
</html>
