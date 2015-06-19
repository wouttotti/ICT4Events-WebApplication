<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inloggen.aspx.cs" Inherits="ICT4Events_WebApplication.Inloggen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Inloggen" Font-Size="X-Large" ForeColor="#999999" Font-Bold="False" Font-Names="Consolas"></asp:Label>
    <div align="center">
        <br />
        <asp:Label ID="Label3" runat="server" Text="Gebruikersnaam:"></asp:Label>
        <br />
        <asp:TextBox ID="TbGebruikersnaam" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Wachtwoord:"></asp:Label>
        <br />
        <asp:TextBox ID="TbWachtwoord" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="BtnLogin" runat="server" Text="Inloggen" OnClick="BtnLogin_Click"/>
        <br />
        <asp:Label ID="LbError" runat="server" Text="Error"></asp:Label>
    </div>
    
</asp:Content>
