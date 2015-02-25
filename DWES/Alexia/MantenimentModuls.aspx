<%@ Page Title="Manteniments Moduls Professionals" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MantenimentModuls.aspx.cs" Inherits="MantenimentModuls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" CssClass="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <asp:Button ID="ButtonNou" runat="server" Text="Nou" />
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
                        <asp:GridView ID="GridViewModuls" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSourceModulsProf" Width="100%">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:CommandField ShowSelectButton="True" />
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
            </asp:Panel>
            <asp:Panel ID="PanelPopupEliminar" runat="server" Width="125px" BackColor="yellow"> 
                Ventana emergente debida a la llamada del botón 
                <br /> 
                <asp:Button ID="Button2" runat="server" Text="OK" /> 
                <asp:Button ID="Button3" runat="server" Text="Cancel" /> 
            </asp:Panel> 
        </div>
        <asp:EntityDataSource ID="EntityDataSourceCursos" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="cursos" EntityTypeFilter="cursos"></asp:EntityDataSource>

        <asp:EntityDataSource ID="EntityDataSourceModulsProf" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="moduls_prof" EntityTypeFilter="moduls_prof" Include="cursos">
        </asp:EntityDataSource>

    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" Runat="Server">
</asp:Content>

