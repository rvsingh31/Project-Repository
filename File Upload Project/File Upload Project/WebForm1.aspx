<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="File_Upload_Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>WebForm1</title>
	</head>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server" enctype="multipart/form-data">
			<asp:Textbox id="filUpload" style="Z-INDEX: 101; LEFT: 32px; POSITION: absolute; TOP: 32px" type="file" name="filUpload" runat="server"></asp:Textbox>
			<asp:Button id="btnUpload" style="Z-INDEX: 102; LEFT: 176px; POSITION: absolute; TOP: 64px" runat="server" Text="Upload" Width="96px" Height="48px"></asp:Button>
			<asp:Image id="imgPicture" style="Z-INDEX: 103; LEFT: 32px; POSITION: absolute; TOP: 136px" runat="server" Width="160px" Height="120px"></asp:Image>
			<asp:Label id="lblOutput" style="Z-INDEX: 104; LEFT: 32px; POSITION: absolute; TOP: 272px" runat="server" Width="240px" Height="112px"></asp:Label>
		</form>
	</body></html>
