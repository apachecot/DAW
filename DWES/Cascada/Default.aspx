<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:DropDownList ID="DropDownListCicles" runat="server" Height="20px" Width="257px">
        </asp:DropDownList>
        <asp:CascadingDropDown ID="DropDownListCicles_CascadingDropDown" runat="server" Category="ciclos" Enabled="True" ServiceMethod="GetDropDownContents" TargetControlID="DropDownListCicles" UseContextKey="True" PromptText="Escoge un ciclo">
        </asp:CascadingDropDown>
        <br />
        <br />
        <asp:DropDownList ID="DropDownListCursos" runat="server" Height="20px" Width="254px">
        </asp:DropDownList>
        <asp:CascadingDropDown ID="DropDownListCursos_CascadingDropDown" runat="server" Category="cursos" Enabled="True" ParentControlID="DropDownListCicles" ServiceMethod="GetDropDownContents2" TargetControlID="DropDownListCursos" UseContextKey="True" EmptyText="No hay cursos" PromptText="Escoge un curso">
        </asp:CascadingDropDown>
    
        <br />
        <br />
        <br />
        <asp:Image ID="ImageFotos" runat="server" Height="200px" Width="200px" />
        <asp:SlideShowExtender ID="ImageFotos_SlideShowExtender" runat="server" Enabled="True" NextButtonID="ButtonPosterior" PlayButtonID="ButtonPlay" PlayButtonText="Play" PreviousButtonID="ButtonAnterior" SlideShowServiceMethod="GetSlides" SlideShowServicePath="" StopButtonText="Stop" TargetControlID="ImageFotos" UseContextKey="True">
        </asp:SlideShowExtender>
        <br />
        <br />
        <asp:Button ID="ButtonAnterior" runat="server" Text="Anterior" />
        <asp:Button ID="ButtonPlay" runat="server" Text="Play" />
        <asp:Button ID="ButtonPosterior" runat="server" Text="Posterior" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
