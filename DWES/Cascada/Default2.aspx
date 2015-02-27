<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div>
    <asp:image ID="Image1" runat="server" Height="200px" Width="200px"></asp:image>
        <asp:SlideShowExtender ID="Image1_SlideShowExtender" runat="server" AutoPlay="True" Enabled="True" Loop="True" NextButtonID="ButtonSiguiente" PlayButtonID="ButtonPlay" PlayButtonText="Play" PreviousButtonID="ButtonAnterior" SlideShowServiceMethod="GetSlides" SlideShowServicePath="" StopButtonText="Stop" TargetControlID="Image1" UseContextKey="True">
        </asp:SlideShowExtender>
        <br />
        <br />
        <asp:Button ID="ButtonAnterior" runat="server" Text="Anterior" />
        <asp:Button ID="ButtonPlay" runat="server" Text="Play" />
        <asp:Button ID="ButtonSiguiente" runat="server" Text="Siguiente" />
    </div>
    </form>
</body>
</html>
