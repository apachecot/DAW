﻿<%@ Page Title="Introducció de Notes" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IntroduccioNotes.aspx.cs" Inherits="IntroduccioNotes" enableEventValidation="false" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Panel ID="Panel1" runat="server" CssClass="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                Introducció Notes</h3>
        </div>
        <div class="panel-body">
            <asp:Label ID="LabelCicleModal0" runat="server" Text="Cicle"></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:CascadingDropDown ID="DropDownList3_CascadingDropDown" runat="server" Category="padreCicle" Enabled="True" LoadingText="Carregant" ServiceMethod="GetDropDownContents" TargetControlID="DropDownList3" UseContextKey="True">
            </asp:CascadingDropDown>
            <asp:Label ID="LabelCursModal0" runat="server" Text="Curs"></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:CascadingDropDown ID="DropDownList4_CascadingDropDown" runat="server" Category="hijoCicle" EmptyText="No existeixen cursos" Enabled="True" LoadingText="Carregant" ParentControlID="DropDownList3" ServiceMethod="GetDropDownContents2" TargetControlID="DropDownList4" UseContextKey="True">
            </asp:CascadingDropDown>
            <asp:Label ID="LabelCursModal1" runat="server" Text="Modul Profesional"></asp:Label>
            <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:CascadingDropDown ID="DropDownList5_CascadingDropDown" runat="server" Category="hijoCurs" EmptyText="No existeixen moduls" Enabled="True" LoadingText="Carregant" ParentControlID="DropDownList4" ServiceMethod="GetDropDownContents3" TargetControlID="DropDownList5" UseContextKey="True">
            </asp:CascadingDropDown>
            <asp:Label ID="LabelCursModal2" runat="server" Text="Unitat Formativa"></asp:Label>
            <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:CascadingDropDown ID="DropDownList6_CascadingDropDown" runat="server" Category="hijoModul" EmptyText="No existeixen moduls" Enabled="True" LoadingText="Carregant" ParentControlID="DropDownList5" ServiceMethod="GetDropDownContents4" TargetControlID="DropDownList6" UseContextKey="True" PromptText="Selecciona una Unitat Formativa">
            </asp:CascadingDropDown>
            <asp:Label ID="LabelCursModal3" runat="server" Text="Avaluació"></asp:Label>
            <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:CascadingDropDown ID="DropDownList7_CascadingDropDown" runat="server" Category="hijoUF" EmptyText="No existeixen moduls" Enabled="True" LoadingText="Carregant" ParentControlID="DropDownList6" ServiceMethod="GetDropDownContents5" TargetControlID="DropDownList7" UseContextKey="True" PromptText="Selecciona una avaluació">
            </asp:CascadingDropDown>
           </div>
        <div class="panel-body">
            <asp:Panel ID="PanelMantenimentModuls" runat="server" CssClass="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Alumnes</h3>
                </div>
                <div class="panel-body">
                    <div class="text-center">
                        <asp:GridView ID="GridViewAlumnes" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSourceAlumnes" Width="100%" DataKeyNames="id" OnRowUpdating="GridViewAlumnes_RowUpdating">
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:BoundField DataField="id" HeaderStyle-CssClass="HideCell" HeaderText="id" ItemStyle-CssClass="HideCell" ReadOnly="True" SortExpression="id">
                                <HeaderStyle CssClass="HideCell" />
                                <ItemStyle CssClass="HideCell" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Cognom 1" SortExpression="persones">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("persones.cognom1") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cognom2" SortExpression="persones">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("persones.cognom2") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nom" SortExpression="persones">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("persones.nom") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Notes">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxNotes" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelNota" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="LabelMensajeGridError" runat="server" CssClass="error"></asp:Label>
                    </div>
                </div>
            </asp:Panel>
            <!-- ModalPopupExtender -->
        </div>
        <asp:EntityDataSource ID="EntityDataSourceAlumnes" runat="server" ConnectionString="name=alexiaEntities" DefaultContainerName="alexiaEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="alumnes" Include="persones,avaluar">
        </asp:EntityDataSource>
        <br>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" Runat="Server">
</asp:Content>


