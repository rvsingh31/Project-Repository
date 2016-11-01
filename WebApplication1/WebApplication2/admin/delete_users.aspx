<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="delete_users.aspx.cs" Inherits="WebApplication2.admin.delete_users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" class="teal-text text-lighten-4" id="error_lbl" Text=""></asp:Label>

     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/js/materialize.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
  
    <script type="text/javascript">
        var str = document.getElementById("error_lbl").innerHTML;

        if (str != "") {
            Materialize.toast(str, 2000, 'rounded');
        }
          </script>
    </div>
    </form>
</body>
</html>
