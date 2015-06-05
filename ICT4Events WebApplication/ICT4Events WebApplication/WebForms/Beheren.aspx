<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Beheren.aspx.cs" Inherits="ICT4Events_WebApplication.Beheren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="Gebruikers" style="width:250px; height: 450px; float: left; margin-left:100px; display:block">
        <asp:Label ID="LbGebruiker" runat="server" Text="Gebruikers"></asp:Label>
        <br />
        <asp:ListBox ID="LbGebruikers" runat="server" Height="400px" Width="250px"></asp:ListBox>

    </div>
    <div style="float:left; margin-left:20px; margin-right:20px; margin-top:20px; height:450px; display:inline-block" align="center">
        <asp:Button ID="btnAanpassen" runat="server" Text="Aanpassen"/>
        <br />
        <asp:Button ID="btnLaatzien" runat="server" Text="Laat zien"/>
        <br />
        <asp:CheckBox ID="cbAanwezig" runat="server" Text="Aanwezig" />
    </div>
    <div id="Persoons Gegevens" style="width:350px; height:450px; float:left; display:inline-block">
        <asp:Label ID="LbPersoonsGegevens" runat="server" Text="Persoons Gegevens"></asp:Label>
        <br />
        <asp:Label ID="lbGebruikersnaam" runat="server" Text="Gebruikersnaam:"></asp:Label>
        <asp:TextBox ID="tbGebruikersnaam" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="lbNaam" runat="server" Text="Naam:"></asp:Label>
        <asp:TextBox ID="tbNaam" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="lbWachtwoord" runat="server" Text="Wachtwoord:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:CheckBox ID="cbAdmin" runat="server" Text="Admin:" TextAlign="Left" />
        <br />
        <asp:Button ID="btnAanmaken" runat="server" Text="Aanmaken" />
        <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" />
        <br />
        <asp:Label ID="lbBetaalstatus" runat="server" Text="Betaalstatus" Visible="False"></asp:Label>
        <br />
        <asp:Button ID="btnChkStatus" runat="server" Text="Check betaal status" />
        <asp:DropDownList ID="dplBetaalStatus" runat="server"></asp:DropDownList>
        <br />
        <asp:Label ID="lbInchecken" runat="server" Text="Inchecken"></asp:Label>
        <br />
        <asp:Label ID="lbBarcode" runat="server" Text="Barcode"></asp:Label>
        <asp:TextBox ID="tbBarcode" runat="server"></asp:TextBox>
        <br />
        <asp:Panel ID="pnStatus" runat="server"></asp:Panel>
        <br />
        <asp:Label ID="lbStatus" runat="server" Text="Barcode Status" ClientIDMode="AutoID"></asp:Label>
    </div>
    </asp:Content>
