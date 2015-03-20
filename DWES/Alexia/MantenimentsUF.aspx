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
                    <h3 class="panel-title">Unitats Formatives</h3>
                </div>
                <div class="panel-body">
                    <div class="text-center">
                        <br />
                        <asp:Label ID="LabelCicleModal" runat="server" Text="Cicle"></asp:Label>
                        &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" CssClass="dropdown-toggle" DataSourceID="EntityDataSourceCursos" DataTextField="nom" DataValueField="id" Width="320px">
                        </asp:DropDownList>
                        <asp:CascadingDropDown ID="DropDownList2_CascadingDropDown" runat="server" Category="padreCicle" Enabled="True" ServiceMethod="GetDropDownContents" TargetControlID="DropDownList2" UseContextKey="True">
                        </asp:CascadingDropDown>
                        <br />
                        <br />
                        <asp:Label ID="LabelCursModal" runat="server" Text="Curs"></asp:Label>
                        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-toggle" Width="320px">
                        </asp:DropDownList>
                        <asp:CascadingDropDown ID="DropDownList1_CascadingDropDown" runat="server" Category="hijoCicle" Enabled="True" ParentControlID="DropDownList2" ServiceMethod="GetDropDownContents2" TargetControlID="DropDownList1" UseContextKey="True">
                        </asp:CascadingDropDown>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewUF" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSourceUF" Width="100%">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderStyle-CssClass="HideCell" ItemStyle-CssClass="HideCell" HeaderText="id" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                                <asp:BoundField DataField="id_modul_prof" HeaderText="id_modul_prof" SortExpression="id_modul_prof" />
                            </Columns>
                        </asp:GridView>
                    </div>
                  </div>
                </asp:Panel>

            <!-- ModalPopupExtender -->
        </div>  
        <asp:EntityDataSource ID="EntityDataSourceCursos" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableFlattening="False" EntitySetName="cursos" EntityTypeFilter="cursos"></asp:EntityDataSource>

        <asp:EntityDataSource ID="EntityDataSourceUF" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="ufs" EntityTypeFilter="ufs" Include="">
        </asp:EntityDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:ModalPopupExtender ID="HiddenField1_ModalPopupExtender" runat="server" Enabled="True" PopupControlID="PanelModalEsborrar" TargetControlID="HiddenField1">
        </asp:ModalPopupExtender>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" Runat="Server">
</asp:Content>



