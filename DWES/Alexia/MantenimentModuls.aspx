<%@ Page Title="Manteniments Moduls Professionals" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MantenimentModuls.aspx.cs" Inherits="MantenimentModuls" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Panel ID="Panel1" runat="server" CssClass="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <asp:Button ID="ButtonNou" CssClass="btn-primary" runat="server" Text="Nou" />
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
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("cursos.codi") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="codi" HeaderText="codi" SortExpression="codi" />
                                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                                <asp:BoundField DataField="hores" HeaderText="hores" SortExpression="hores" Visible="False" />
                                <asp:BoundField DataField="hores_lliures" HeaderText="hores_lliures" SortExpression="hores_lliures" Visible="False" />
                                <asp:BoundField DataField="id_professor" HeaderText="id_professor" SortExpression="id_professor" Visible="False" />
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
                    <asp:Button ID="btnCerrarEsborrar" runat="server" Text="Cancel·lar" />
                    <asp:Button ID="btnAceptarEsborrar" runat="server" Text="Aceptar" OnClick="btnAceptarEsborrar_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelModalCrear" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 id="titol_crear" class="panel-title">Crear</h3>
                </div>
                <div class="panel-body">
                    <asp:Label ID="LabelCicleModal" runat="server" Text="Cicle"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="EntityDataSourceCursos" DataTextField="nom" DataValueField="id">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="LabelCursModal" runat="server" Text="Curs"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="LabelModalCodi" runat="server" Text="Codi"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBoxModalCodi" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="LabelModalNom" runat="server" Text="Nom"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBoxModalNom" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="LabelModalHores" runat="server" Text="Hores"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBoxModalHores" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="LabelModalHoresLliures" runat="server" Text="Hores lliure elecció"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBoxModalHoresLliures" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="LabelModalProfesor" runat="server" Text="Profesor"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="EntityDataSourceProfessor" DataTextField="nom" DataValueField="id">
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="btnCerrarCrear" runat="server" Text="Cancel·lar" />
                    <asp:Button ID="btnAceptarCrear" runat="server" Text="Aceptar" />
                </div>
            </asp:Panel>
            <!-- ModalPopupExtender -->
        </div>  
        <asp:EntityDataSource ID="EntityDataSourceCursos" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="cursos" EntityTypeFilter="cursos"></asp:EntityDataSource>

        <asp:EntityDataSource ID="EntityDataSourceModulsProf" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="moduls_prof" EntityTypeFilter="moduls_prof" Include="cursos">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSourceProfessor" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="professors" EntityTypeFilter="professors">
        </asp:EntityDataSource>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" Runat="Server">
</asp:Content>

