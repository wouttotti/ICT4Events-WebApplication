<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="ICT4Events_WebApplication.Feed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Content/feed.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="berichtplaatsen">
    <table>
        <tr><td><asp:Label cssclass="Label1" runat="server" Text="Titel:"></asp:Label></td><td><asp:TextBox cssclass="tbTitel" runat="server" Width="404px"></asp:TextBox>
            <asp:Label cssclass="lbCategorie" runat="server" Text="Categorie:"></asp:Label><asp:DropDownList cssclass="cbCategorie" runat="server" Height="30px" Width="120px">
            </asp:DropDownList>
            </td></tr>
        <tr><td><asp:Label cssclass="Label2" runat="server" Text="Bericht:"></asp:Label></td><td><asp:TextBox cssclass="tbBericht" runat="server" Height="81px" Width="600px" MaxLength="140" Rows="5" TextMode="MultiLine"></asp:TextBox></td></tr>
        <tr><td><asp:Label cssclass="Label3" runat="server" Text="Pad:"></asp:Label></td><td><asp:TextBox cssclass="tbPad" runat="server" Width="510px"></asp:TextBox>
            <asp:Button cssclass="btBrowse" runat="server" Height="30px" Text="Browse..." Width="85px" BackColor="#6E5A7A" />
            </td></tr>
        <tr><td></td><td><asp:RadioButton CssClass="RadioButtonSoort RadioButtonSoort1" GroupName="Radiobuttonsoortbericht" Checked="true" Text="Bericht" runat="server" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Video" runat="server" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Foto" runat="server" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Bestand" runat="server" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Event" runat="server" /><asp:Button cssclass="btPost" runat="server" Text="Post!" BackColor="#6E5A7A" /></td></tr>
    </table>
    </div>
    <div id="feed">

    </div>
    
</asp:Content>
