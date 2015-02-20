<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="Server" />
    <asp:TextBox
            ID="txtComments"
            TextMode="MultiLine"
            Columns="60"
            Rows="8"
            runat="server" />
 
    <asp:HtmlEditorExtender
            TargetControlID="txtComments"
            runat="server" />
    </div>
    </form>
</body>
</html>
