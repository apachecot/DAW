<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hoteles.aspx.cs" Inherits="Hoteles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/metro-bootstrap.min.css" rel="stylesheet" />
    <%--<link href="Content/bootstrap.simplex.min.css" rel="stylesheet" />--%>
    <%--<link href="Content/bootstrap.spacelab.min.css" rel="stylesheet" />--%>
  <%--  <link href="Content/bootstrap.cosmo.min.css" rel="stylesheet" />--%>
    <%--<link href="Content/bootstrap.sandstone.min.css" rel="stylesheet" />--%>
    <link href="Content/miEstilo.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">

        <div class="container">
            <asp:Panel ID="PanelHotel" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Alta hotel</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Ciudad" CssClass="col-lg-2 col-md-2 control-label"></asp:Label>
                        <div class="col-lg-10 col-md-10">
                            <asp:DropDownList ID="DropDownListCiudades" runat="server" CssClass="form-control" DataSourceID="EntityDataSourceCiudades" DataTextField="nombre" DataValueField="id_ciudad"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Nombre" CssClass="col-lg-2 col-md-2 control-label"></asp:Label>
                        <div class="col-lg-10 col-md-10">
                            <asp:TextBox ID="TextBoxNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ErrorMessage="* Campo obligatorio" ControlToValidate="TextBoxNombre" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Categoria" CssClass="col-lg-2 col-md-2 control-label"></asp:Label>
                        <div class="col-lg-10 col-md-10">
                            <asp:TextBox ID="TextBoxCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoria" runat="server" ErrorMessage="* Campo obligatorio" ControlToValidate="TextBoxCategoria" CssClass="text-danger"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBoxCategoria" CssClass="text-danger" ErrorMessage="La catergoria debe estar entre 1 y 5" MaximumValue="5" MinimumValue="1"></asp:RangeValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Dirección" CssClass="col-lg-2 col-md-2 control-label"></asp:Label>
                        <div class="col-lg-10 col-md-10">
                            <asp:TextBox ID="TextBoxDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion" runat="server" ErrorMessage="* Campo obligatorio" ControlToValidate="TextBoxDireccion" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Teléfono" CssClass="col-lg-2 col-md-2 control-label"></asp:Label>
                        <div class="col-lg-10 col-md-10">
                            <asp:TextBox ID="TextBoxTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefono" runat="server" ErrorMessage="* Campo obigatorio" ControlToValidate="TextBoxTelefono" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label6" runat="server" Text="Tipo" CssClass="col-lg-2 col-md-2 control-label"></asp:Label>
                        <div class="col-lg-10 col-md-10">
                            <asp:DropDownList ID="DropDownListTipo" runat="server" CssClass="form-control">
                                <asp:ListItem>Playa</asp:ListItem>
                                <asp:ListItem>Montaña</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label7" runat="server" Text="Cadena" CssClass="col-lg-2 col-md-2 control-label"></asp:Label>
                        <div class="col-lg-10 col-md-10">
                            <asp:DropDownList ID="DropDownListCadenas" runat="server" CssClass="form-control" DataSourceID="EntityDataSourceCadenas" DataTextField="nombre" DataValueField="cif"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <asp:Button ID="ButtonCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default" OnClick="ButtonCancelar_Click" CausesValidation="False" />
                            <asp:Button ID="ButtonAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="ButtonAceptar_Click" />
                            <asp:Label ID="LabelMensajesHot" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <%--<asp:Panel ID="PanelMensaje" runat="server" CssClass="panel panel-primary">
                <asp:Panel ID="Panel3" runat="server" CssClass="panel-heading">
                    <h3 class="panel-title">Mensaje</h3>
                </asp:Panel>
                <asp:Panel ID="Panel4" runat="server" CssClass="panel-body">
                    <asp:Label ID="LabelMensaje" runat="server" Text="¿Estás seguro que quieres borrar el hotel?"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Panel5" runat="server" CssClass="panel-footer">
                    <asp:Button ID="Button2" runat="server" Text="No" CssClass="btn btn-default" />
                    <asp:Button ID="Button3" runat="server" Text="Si" CssClass="btn btn-primary" />
                </asp:Panel>
            </asp:Panel>--%>
            <asp:Panel ID="PanelGrid" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Hoteles</h3>
                </div>
                <div class="panel-body">
                    <asp:Button ID="ButtonAlta" runat="server" Text="Alta hotel" CssClass="btn btn-primary" OnClick="ButtonAlta_Click" />
                    <asp:Label ID="LabelMensajeGrid" runat="server" CssClass="text-danger"></asp:Label>

                    <div class="form-group">
                        <asp:Label ID="Label8" runat="server" Text="Ciudad" CssClass="col-lg-2 control-label"></asp:Label>
                        <div class="col-lg-10">
                            <asp:DropDownList ID="DropDownListCiudadesBus" runat="server" CssClass="form-control" DataSourceID="EntityDataSourceCiudades" DataTextField="nombre" DataValueField="id_ciudad" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCiudadesBus_SelectedIndexChanged">
                                <asp:ListItem Value="0">(Todas)</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:GridView ID="GridViewHoteles" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_ciudad,nombre" DataSourceID="EntityDataSourceHoteles" CssClass="table table-striped table-hover " OnRowDeleted="GridViewHoteles_RowDeleted" OnRowUpdating="GridViewHoteles_RowUpdating">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="Ciudad" SortExpression="id_ciudad">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ciudades.nombre") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ciudades.nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre" SortExpression="nombre">
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Categoria" SortExpression="categoria">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("categoria") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="text-danger" Display="Dynamic" ErrorMessage="* Campo obligatorio"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox1" CssClass="text-danger" Display="Dynamic" ErrorMessage="La categoría debe estar entre 1 y 5" MaximumValue="5" MinimumValue="1"></asp:RangeValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("categoria") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dirección" SortExpression="direccion">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("direccion") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Campo obligatorio" ControlToValidate="TextBox2" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("direccion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Teléfono" SortExpression="telefono">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("telefono") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" CssClass="text-danger" Display="Dynamic" ErrorMessage="* Campo obligatorio"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("telefono") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo" SortExpression="tipo">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" SelectedValue='<%# Bind("tipo") %>'>
                                        <asp:ListItem>PLAYA</asp:ListItem>
                                        <asp:ListItem>MONTAÑA</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("tipo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cadena" SortExpression="cadenas.nombre">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="EntityDataSourceCadenas" DataTextField="nombre" DataValueField="cif" SelectedValue='<%# Bind("cif") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("cadenas.nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>
        </div>
        <asp:EntityDataSource ID="EntityDataSourceHoteles" runat="server" ConnectionString="name=hoteles_basicoEntities" DefaultContainerName="hoteles_basicoEntities" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="hoteles" Include="ciudades, cadenas"></asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceCiudades" runat="server" ConnectionString="name=hoteles_basicoEntities" DefaultContainerName="hoteles_basicoEntities" EnableFlattening="False" EntitySetName="ciudades">
        </asp:EntityDataSource>

        <asp:EntityDataSource ID="EntityDataSourceCadenas" runat="server" ConnectionString="name=hoteles_basicoEntities" DefaultContainerName="hoteles_basicoEntities" EnableFlattening="False" EntitySetName="cadenas">
        </asp:EntityDataSource>

    </form>
</body>
</html>
