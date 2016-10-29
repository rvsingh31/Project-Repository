<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reset.aspx.cs" Inherits="WebApplication2.reset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Reset Your Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css" />
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body class="blue darken-1">
    <nav class="yellow">

    </nav>
    <form id="form1" runat="server">
    <div class="row">
        <br />
        <br />
            <div class="col s12 m4">
                 <p></p>
            </div>
        <div class="col s12 m4 card yellow">
             <asp:ScriptManager EnablePartialRendering="true" EnablePageMethods="true" ID="ScriptManager1" runat="server" />
             
            <div  style="padding:2%">
                 <h6 class="blue-text center text-darken-1">Reset Your password</h6>
            </div>
            <br />
             <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">              
                 <ContentTemplate>    
              
            <div id="step1_div" runat="server">
                  <h6 class="teal-text"> 
                    <strong>
                        NOTE: &nbsp; &nbsp; You will be sent a mail for password recovery. Enter the 
                            code over here to change your password.
                    </strong>
                </h6>
                <br />
                <br />

                   <div class="input-field" >
                       <asp:Label ID="kd" class="purple-text" Text="Enter Your Username" runat="server"></asp:Label>
                   <asp:TextBox ID="un" runat="server" class="purple-text"></asp:TextBox>  
                     </div>
                <br />
                <asp:Button id="st1_click" class="btn waves-effect waves-light purple yellow-text"  OnClick="st1_Click" runat="server" Text="Send Mail"></asp:Button>      
               <br />
              </div>
                      <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                          
                                  <h6 class="center purple-text">Loading...</h6> 
                          
                        </ProgressTemplate>
                    </asp:UpdateProgress> 

               <div id="step2_div"  runat="server">
                  <h6 class="purple-text">
                     We have sent you a recovery-mail . Check your mail-box .<br />
                       Enter the <i>code</i> mentioned in the mail here to reset your password.
                      <br />
                     
                  </h6>
                   <br />
                     <div class="input-field" >
                       <asp:Label ID="Label1" class="purple-text" Text="Enter the 6-digit Code" runat="server"></asp:Label>
                   <asp:TextBox id="code_ck" runat="server" class="purple-text"></asp:TextBox> 
                         <asp:Label ID="err" Text="" runat="server"></asp:Label>
                     </div>
                <br />     
                   <asp:Button ID="s2_btn" runat="server"  onClick="step2_Click" class="btn waves-effect waves-light purple yellow-text" Text="Verify"></asp:Button>
              <br />
               </div>

                <div id="step3_div" runat="server">
                    <h6>Enter your new Password </h6>
                      
                    <div id="pass_tb" runat="server">
                        <asp:Label ID="l1" runat="server" Text="New Password" class="purple-text"></asp:Label>
                        <asp:TextBox ID="pass1_tb" runat="server" Type="password" class="purple-text"></asp:TextBox>
                    <br />
                        <asp:Label ID="Label2" runat="server" Text="New Password" class="purple-text"></asp:Label>
                        <asp:TextBox ID="pass2_tb" runat="server" Type="password" class="purple-text"></asp:TextBox>
                 
                    </div>
                    <br />
                    <asp:Button id="final" OnClick="final_Click" class="btn waves-effect waves-light purple yellow-text" Text="Change" runat="server"></asp:Button>
                    <br />
                    <asp:Label id="err2" Text="" runat="server"></asp:Label>
                </div>
            </ContentTemplate>
                 </asp:UpdatePanel>
           </div>
        <div class="col s12 m4">
            <p></p>
        </div>
    </div>
    </form>
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
       
</body>
</html>
