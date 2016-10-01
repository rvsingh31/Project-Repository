<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="file_test.aspx.cs" Inherits="WebApplication2.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="f1" runat="server" />
        <asp:Button runat="server" ID="b1" OnClick="b1_Click"></asp:Button>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button runat="server" ID="b2" OnClick="b2_Click" Text="show image"></asp:Button>
        
    </div>
        <br />
        <div>
            <asp:Image ID="Image1" ImageUrl="<%=t %>" runat="server" />

<!--            <img src="<%=t %>" runat="server"/>
            -->
        </div>
    </form>
</body>
</html>
