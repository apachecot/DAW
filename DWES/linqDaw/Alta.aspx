<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Alta.aspx.cs" Inherits="Alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="miEstilo.css" rel="stylesheet" />
    <%--<link href="Content/bootstrap.cyborg.min.css" rel="stylesheet" />--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Panel ID="Panel1" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Alta curso</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Id" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBoxId" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorId" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="TextBoxId" CssClass="label label-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Codi"  CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBoxCodi" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Descripció" CssClass="col-md-2 control-label"></asp:Label>
                         <div class="col-md-10">
                            <asp:TextBox ID="TextBoxDescripcio" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Ciclo" CssClass="col-md-2 control-label"></asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList CssClass="form-control" ID="DropDownListCiclos" runat="server" DataSourceID="EntityDataSourceCicles" DataTextField="codi" DataValueField="id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button CssClass="btn btn-primary" ID="ButtonAlta" runat="server" OnClick="ButtonAlta_Click" Text="Alta" />
                        <asp:Label ID="LabelMensaje" runat="server" CssClass="label label-danger"></asp:Label>
                </div>
                <asp:EntityDataSource ID="EntityDataSourceCicles" runat="server" ConnectionString="name=aulacepEntities" DefaultContainerName="aulacepEntities" EnableFlattening="False" EntitySetName="cicles">
                </asp:EntityDataSource>
                <br />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
