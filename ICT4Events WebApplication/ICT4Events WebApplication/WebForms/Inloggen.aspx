<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inloggen.aspx.cs" Inherits="ICT4Events_WebApplication.Inloggen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <asp:Label ID="Label3" runat="server" Text="Gebruikersnaam:"></asp:Label>
        <br />
        <asp:TextBox ID="TbGebruikersnaam" runat="server"  style="display:inline-block"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Wachtwoord:"></asp:Label>
        <br />
        <asp:TextBox ID="TbWachtwoord" runat="server"  style="display:inline-block"></asp:TextBox>
    </div>
</asp:Content>
