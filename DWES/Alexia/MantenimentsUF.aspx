<%@ Page Title="Manteniment Unitats Formatives" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MantenimentsUF.aspx.cs" Inherits="MantenimentsUF" enableEventValidation="false" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Panel ID="Panel1" runat="server" CssClass="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <asp:Button ID="ButtonNou" CssClass="btn btn-primary" runat="server" Text="Nou" />
                <asp:ModalPopupExtender ID="ButtonNou_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="ButtonNou" PopupControlID="PanelModalCrear">
                </asp:ModalPopupExtender>
            </h3>
        </div>
        <div class="panel-body">
            <asp:Panel ID="PanelMantenimentModuls" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Mòduls Professionals</h3>
                </div>
                <div class="panel-body">
                    <div class="text-center">

                    <asp:Label ID="LabelCicleModal" runat="server" Text="Cicle"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList2_CascadingDropDown" runat="server" Category="padreCicle" Enabled="True" ServiceMethod="GetDropDownContents" TargetControlID="DropDownList2" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <br />
                    <asp:Label ID="LabelCursModal" runat="server" Text="Curs"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList1_CascadingDropDown" runat="server" Category="hijoCicle" Enabled="True" ParentControlID="DropDownList2" ServiceMethod="GetDropDownContents2" TargetControlID="DropDownList1" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <br />
                        <asp:GridView ID="GridViewUF" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSourceUF" Width="100%" OnSelectedIndexChanged="GridViewUF_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" OnClick="LinkButton2_Click"></asp:LinkButton>
                                        <asp:ConfirmButtonExtender ID="LinkButton2_ConfirmButtonExtender" runat="server" ConfirmText="" DisplayModalPopupID="LinkButton2_ModalPopupExtender" Enabled="True" TargetControlID="LinkButton2">
                                        </asp:ConfirmButtonExtender>
                                        <asp:ModalPopupExtender ID="LinkButton2_ModalPopupExtender" runat="server" CancelControlID="btnCerrarEsborrar" Enabled="True" OkControlID="btnAceptarEsborrar" PopupControlID="PanelModalEsborrar" TargetControlID="LinkButton2">
                                        </asp:ModalPopupExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell" HeaderText="id" ReadOnly="True" SortExpression="id" >
                                <HeaderStyle CssClass="HideCell" />
                                <ItemStyle CssClass="HideCell" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="id_modul_prof" SortExpression="id_modul_prof">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_modul_prof") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("moduls_prof.nom") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                            </Columns>
                        </asp:GridView>
                    </div>
                  </div>
                </asp:Panel>

            <asp:Panel ID="PanelModalEsborrar" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Esborrar</h3>
                </div>
                <div class="panel-body">
                    <p class="text-center">Estàs segur de que vols esborrar el registre?</p>
                    <div class="row">
                        <div class="col-lg-1 col-centered">
                            <asp:Button ID="btnCerrarEsborrar" runat="server" CssClass="btn btn-danger" Text="Cancel·lar" />
                            <asp:Button ID="btnAceptarEsborrar" runat="server" CssClass="btn btn-success" Text="Aceptar" OnClick="btnAceptarEsborrar_Click" />
                        </div>
                     </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelModalCrear" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 id="titol_crear" class="panel-title"><asp:Label ID="LabelTitolModal" runat="server" Text="Crear"></asp:Label></h3>
                </div>
                <div class="panel-body">
                    
                    <asp:Label ID="LabelCicleModal0" runat="server" Text="Cicle"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList3_CascadingDropDown" runat="server" Category="padreCicle" Enabled="True" ServiceMethod="GetDropDownContents" TargetControlID="DropDownList3" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <asp:Label ID="LabelCursModal0" runat="server" Text="Curs"></asp:Label>
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList4_CascadingDropDown" runat="server" Category="hijoCicle" Enabled="True" ParentControlID="DropDownList3" ServiceMethod="GetDropDownContents2" TargetControlID="DropDownList4" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <asp:Label ID="LabelCursModal1" runat="server" Text="Modul Profesional"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList5" CssClass="error" ErrorMessage="Es necesari un Modul" ValidationGroup="popup"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList5_CascadingDropDown" runat="server" Category="hijoCurs" Enabled="True" ParentControlID="DropDownList4" ServiceMethod="GetDropDownContents3" TargetControlID="DropDownList5" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <asp:Label ID="Label2" runat="server" Text="Nom unitat formativa"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxNomUF" CssClass="error" ErrorMessage="Camp obligatori" ValidationGroup="popup"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="TextBoxNomUF" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="LabelErrorBD" runat="server" CssClass="error" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="LabelIdModificar" runat="server" Visible="False"></asp:Label>
                    <br />
                    <asp:Button ID="btnCerrarCrear" runat="server" CssClass="btn btn-danger" Text="Cancel·lar" CausesValidation="False" OnClick="btnCerrarCrear_Click" />
                    <asp:Button ID="btnAceptarCrear" runat="server" CssClass="btn btn-success" Text="Aceptar" OnClick="btnAceptarCrear_Click" ValidationGroup="popup" />
                </div>
            </asp:Panel>
            <!-- ModalPopupExtender -->
        </div>  

        <asp:EntityDataSource ID="EntityDataSourceUF" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="ufs" EntityTypeFilter="ufs" Include="moduls_prof">
        </asp:EntityDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:ModalPopupExtender ID="HiddenField1_ModalPopupExtender" runat="server" Enabled="True" PopupControlID="PanelModalEsborrar" TargetControlID="HiddenField1">
        </asp:ModalPopupExtender>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" Runat="Server">
</asp:Content>



