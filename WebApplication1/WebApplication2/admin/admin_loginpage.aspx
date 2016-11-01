<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_loginpage.aspx.cs" Inherits="WebApplication2.admin.admin_loginpage" %>

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

    <br/>
    <div class="row">
        <div class="col s12 m1">
           <p></p>
        </div>
        <div class="col s12 m5">
            <p></p>
        </div>
        <div class="col s12 m1">
            <p></p>
        </div>
        <div class="col s12 m4 card-panel yellow lighten-1">
            <div>
                <form runat="server">
                    <div class="row">
                        <div class="col s12 ">
                            <ul class="tabs yellow">
                                <li class="tab col s3"><a href="#login" class="active teal-text">Login</a></li>
                            </ul>
                        </div>
                    </div>

                    <div id="login" class="col s12">
                        <br/>
                        <asp:Panel id="loginpanel" DefaultButton="login_btn" runat="server">
                            <div class="input-field blue-text text-darken-2">
                                <asp:label ID="ulabel" runat="server"  Text="Username"></asp:label>
                                <asp:TextBox ID="uname" runat="server" ></asp:TextBox>
                            </div>
                            <div class="input-field blue-text text-darken-2">
                                <asp:Label ID="plabel" runat="server" Text="Password"></asp:Label>
                                <asp:TextBox ID="passwd" type="password" runat="server" ></asp:TextBox>
                            </div>
                            <br/>
                            <asp:Button ID="login_btn" runat="server" Text="Login" class="btn waves-effect waves-light blue darken-2 yellow-text" OnClick="login_btn_Click" />               
                        </asp:Panel>
                    </div>
                </form>
        </div>
            <div class="col s12 m1 yellow-text">
                <p></p>
                <asp:Label ID="hidden_lbl" runat="server" Text=""  ></asp:Label>
            </div>
        </div>
    </div>
  
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
    
        <script type="text/javascript">
            var str = document.getElementById("hidden_lbl").innerHTML;

            if (str != "")
            {
                Materialize.toast(str, 2000, 'rounded');
            }
        </script>
    </body>
</html>

    