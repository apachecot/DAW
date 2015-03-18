<%@ Page Title="Manteniments Moduls Professionals" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MantenimentModuls.aspx.cs" Inherits="MantenimentModuls" enableEventValidation="false" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Panel ID="Panel1" runat="server" CssClass="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <asp:Button ID="ButtonNou" CssClass="btn btn-primary" runat="server" Text="Nou" OnClick="ButtonNou_Click" />
                <asp:ModalPopupExtender ID="ButtonNou_ModalPopupExtender" runat="server" DynamicServicePath="" Enabled="True" TargetControlID="ButtonNou" PopupControlID="PanelModalCrear">
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
                        <asp:Label ID="LabelCicle" runat="server" Text="Cicle"></asp:Label>
                        <asp:DropDownList ID="DropDownListCicles" runat="server" CssClass="dropdown-toggle" AutoPostBack="True" DataSourceID="EntityDataSourceCursos" DataTextField="nom" DataValueField="id" OnSelectedIndexChanged="DropDownListCicles_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewModuls" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSourceModulsProf" Width="100%" OnSelectedIndexChanged="GridViewModuls_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" OnClick="LinkButton2_Click"></asp:LinkButton>
                                        <asp:ConfirmButtonExtender ID="LinkButton2_ConfirmButtonExtender" runat="server" ConfirmText="" DisplayModalPopupID="LinkButton2_ModalPopupExtender" Enabled="True" TargetControlID="LinkButton2">
                                        </asp:ConfirmButtonExtender>
                                        <asp:ModalPopupExtender ID="LinkButton2_ModalPopupExtender" runat="server" CancelControlID="btnCerrarEsborrar" DynamicServicePath="" Enabled="True" OkControlID="btnAceptarEsborrar" PopupControlID="PanelModalEsborrar" TargetControlID="LinkButton2">
                                        </asp:ModalPopupExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="id_curs" SortExpression="id_curs">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_curs") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelCodiGrid" runat="server" Text='<%# Eval("cursos.codi") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell" HeaderText="id" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="codi" HeaderText="codi" SortExpression="codi" />
                                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                                <asp:BoundField DataField="hores" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell"  HeaderText="hores" SortExpression="hores"/>
                                <asp:BoundField DataField="hores_lliures" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell" HeaderText="hores_lliures" SortExpression="hores_lliures" />
                                <asp:BoundField DataField="id_professor" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell" HeaderText="id_professor" SortExpression="id_professor" />
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
                    Estàs segur de que vols esborrar el registre?<br />
                    <asp:Button ID="btnCerrarEsborrar" runat="server" CssClass="btn btn-danger" Text="Cancel·lar" />
                    <asp:Button ID="btnAceptarEsborrar" runat="server" CssClass="btn btn-success" Text="Aceptar" OnClick="btnAceptarEsborrar_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelModalCrear" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 id="titol_crear" class="panel-title"><asp:Label ID="LabelTitolModal" runat="server" Text="Crear"></asp:Label></h3>
                </div>
                <div class="panel-body">
                    <asp:Label ID="LabelCicleModal" runat="server" Text="Cicle"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="EntityDataSourceCursos" DataTextField="nom" DataValueField="id">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList2_CascadingDropDown" runat="server" Category="padreCicle" Enabled="True" ServiceMethod="GetDropDownContents" TargetControlID="DropDownList2" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <br />
                    <asp:Label ID="LabelCursModal" runat="server" Text="Curs"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                    <asp:CascadingDropDown ID="DropDownList1_CascadingDropDown" runat="server" Category="hijoCicle" Enabled="True" ParentControlID="DropDownList2" ServiceMethod="GetDropDownContents2" TargetControlID="DropDownList1" UseContextKey="True">
                    </asp:CascadingDropDown>
                    <br />
                    <asp:Label ID="LabelModalCodi" runat="server" Text="Codi"></asp:Label>
                    <asp:TextBox ID="TextBoxModalCodi" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCodi" runat="server" ControlToValidate="TextBoxModalCodi" ErrorMessage="Camp obligatori"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="LabelModalNom" runat="server" Text="Nom"></asp:Label>
                    <asp:TextBox ID="TextBoxModalNom" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNom" runat="server" ControlToValidate="TextBoxModalNom" ErrorMessage="Camp obligatori"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="LabelModalHores" runat="server" Text="Hores"></asp:Label>
                    <asp:TextBox ID="TextBoxModalHores" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorHores" runat="server" ControlToValidate="TextBoxModalHores" ErrorMessage="Camp obligatori"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="LabelModalHoresLliures" runat="server" Text="Hores lliure elecció"></asp:Label>
                    <asp:TextBox ID="TextBoxModalHoresLliures" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorHores_lliures" runat="server" ControlToValidate="TextBoxModalHoresLliures" ErrorMessage="Camp obligatori"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="LabelModalProfesor" runat="server" Text="Profesor"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownListProfesor" CssClass="form-control" runat="server" DataSourceID="EntityDataSourceProfessor" DataTextField="nom" DataValueField="id">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="btnCerrarCrear" runat="server" CssClass="btn btn-danger" Text="Cancel·lar" CausesValidation="False" />
                    <asp:Button ID="btnAceptarCrear" runat="server" CssClass="btn btn-success" Text="Aceptar" OnClick="btnAceptarCrear_Click" />
                </div>
            </asp:Panel>
            <!-- ModalPopupExtender -->
        </div>  
        <asp:EntityDataSource ID="EntityDataSourceCursos" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="cursos" EntityTypeFilter="cursos"></asp:EntityDataSource>

        <asp:EntityDataSource ID="EntityDataSourceModulsProf" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="moduls_prof" EntityTypeFilter="moduls_prof" Include="cursos">
        </asp:EntityDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:ModalPopupExtender ID="HiddenField1_ModalPopupExtender" runat="server" DynamicServicePath="" Enabled="True" PopupControlID="PanelModalEsborrar" TargetControlID="HiddenField1">
        </asp:ModalPopupExtender>
        <asp:EntityDataSource ID="EntityDataSourceProfessor" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="professors" EntityTypeFilter="professors">
        </asp:EntityDataSource>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" Runat="Server">
</asp:Content>

