<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booking_userdetails.aspx.cs" Inherits="WebApplication2.booking.booking_userdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking_userdetails</title>
    <link href = "/Content/bootstrap.css" rel= "stylesheet"/>
    <link href = "/Content/bootstrap.min.css" rel= "stylesheet" type="text/css"/>
    <link href = "/Content/Site.css" rel= "stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css"/>
</head>
<body>
    <nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">EasyTravel</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="#">Home</a></li>
            <li class="align-right"><a href="#">Logout</a></li>
        </ul>
    </div>
    </nav>

    <style>
        h2 {
            font-family: Lobster, Monospace;
        }
        .txtbox
        {
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }
     </style>

    <div class="container-fluid">
      <h2 class="text-primary text-center">Travellers</h2>
    </div>


    <form id="paymentform" runat="server">
    <div>
        <p class=" text-primary">PRIMARY TRAVELLER NAME(Adult 1)</p>
    </div>
    <div class="row text-danger">
        <div class="col-md-1 col-sm-2 col-xs-2 make_relative hidden-xs">
            <span>
                <select id="travellertitle" class="form-control">
                    <option value="0" selected="selected">Mr.</option>
                    <option value="1">Miss</option>
                    <option value="2">Mrs</option>
                </select>
            </span>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
            <asp:table id="ftable" runat="server" width="50">
                <asp:tablerow><asp:tablecell>
            <asp:TextBox ID="fnametextbox" placeholder="First Name" CssClass="txtbox" runat="server"/></asp:tablecell></asp:tablerow>
                <asp:tablerow><asp:tablecell><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Please enter Firstname" ControlToValidate="fnametextbox" runat="server"/>
</asp:tablecell></asp:tablerow>
            </asp:table>
        </div>
        <div class="col-md-3 col-sm-5 col-xs-10">
            <table>
                <tr><td>
            <asp:TextBox ID="lnametextbox" placeholder="Last Name" CssClass="txtbox" runat="server"/></td></tr>
                <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Please enter Lastname" ControlToValidate="lnametextbox" runat="server"/>
</td></tr>
            </table>
        </div>
    </div>
    <p class="text-primary">
        CONTACT DETAILS
    </p>
    <p class="light_grey append_bottom8">
        Your voucher and booking details shall be sent on the below email address and mobile number
    </p>
    <div class="text-danger">
        <asp:TextBox ID="emailtextbox" placeholder="Email Address" CssClass="txtbox" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Please enter Email Address" ControlToValidate="emailtextbox" runat="server"/>
    </div>
    <div class="text-danger">
        <asp:TextBox ID="mobnotextbox" placeholder="Mobile Number" CssClass="txtbox" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Please enter Mobile Number" ControlToValidate="mobnotextbox" runat="server"/>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
        <button class="btn btn-block btn-lg btn-primary-red" type="submit" onclick="payment_button">Continue To Payment</button>
    </div>
    </form>
</body>
</html>
