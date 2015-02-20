<%@ Page Title="Manteniments Moduls Professionals" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MantenimentModuls.aspx.cs" Inherits="MantenimentModuls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="PanelMantenimentModuls" runat="server" CssClass="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Mòduls Professionals</h3>
        </div>
        <div class="panel-body">
            <div class="text-center">
                <asp:Label ID="LabelCicle" runat="server" Text="Cicle"></asp:Label>
                <asp:DropDownList ID="DropDownListCicles" runat="server" CssClass="dropdown-toggle"></asp:DropDownList>
                <asp:GridView ID="GridViewModuls" runat="server"></asp:GridView>
            </div>
            
            
        </div>
        <asp:EntityDataSource ID="EntityDataSourceCicles" runat="server"></asp:EntityDataSource>

    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" Runat="Server">
</asp:Content>

