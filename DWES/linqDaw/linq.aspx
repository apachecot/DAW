<%@ Page Language="C#" AutoEventWireup="true" CodeFile="linq.aspx.cs" Inherits="linq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.cyborg.min.css" rel="stylesheet" />
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="Content/bootstrap.spacelab.min.css" rel="stylesheet" />--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownListCicles" runat="server" Width="177px">
        </asp:DropDownList>
&nbsp;<asp:DropDownList ID="DropDownListCicles2" runat="server" DataSourceID="EntityDataSourceCicles" DataTextField="codi" DataValueField="id" Height="20px" Width="230px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSourceCursos" AllowPaging="True" PageSize="3" CssClass="table table-striped table-hover ">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="codi" SortExpression="codi">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("codi") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" CssClass="control-label" Text='<%# Bind("codi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="descripcio" SortExpression="descripcio">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("descripcio") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text='<%# Bind("descripcio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="id_cicle" SortExpression="id_cicle">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSourceCicles" DataTextField="codi" DataValueField="id" SelectedValue='<%# Bind("id_cicle") %>' CssClass="form-control">
                        </asp:DropDownList>
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("cicles.codi") %>' CssClass="control-label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="LabelMensaje" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSourceCicles" OnRowDeleted="GridView2_RowDeleted">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="codi" HeaderText="codi" SortExpression="codi" />
                <asp:BoundField DataField="descripcio" HeaderText="descripcio" SortExpression="descripcio" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <asp:EntityDataSource ID="EntityDataSourceCursos" runat="server" ConnectionString="name=aulacepEntities" DefaultContainerName="aulacepEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="cursos" Include="cicles">
        </asp:EntityDataSource>
        <br />
        <asp:EntityDataSource ID="EntityDataSourceCicles" runat="server" ConnectionString="name=aulacepEntities" DefaultContainerName="aulacepEntities" EnableFlattening="False" EntitySetName="cicles" OrderBy="it.codi desc" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:EntityDataSource>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
