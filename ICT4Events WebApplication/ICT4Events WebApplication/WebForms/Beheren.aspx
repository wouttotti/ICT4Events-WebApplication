<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Beheren.aspx.cs" Inherits="ICT4Events_WebApplication.Beheren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="Gebruikers" style="width:250px; height: 450px; float: left; display:block">
        <asp:Label ID="LbGebruiker" runat="server" Text="Gebruikers"></asp:Label>
        <br />
        <asp:ListBox ID="ListBGebruikers" runat="server" Height="400px" Width="250px"></asp:ListBox>

    </div>
    <div style="float:left; margin-left:110px; margin-right:auto; margin-top:20px; display:inline-block" align="center">
        <asp:Button ID="btnAanpassen" runat="server" Text="Aanpassen"/>
        <br />
        <asp:Button ID="btnLaatzien" runat="server" Text="Laat zien" OnClick="btnLaatzien_Click"/>
        <br />
        <asp:CheckBox ID="cbAanwezig" runat="server" Text="Aanwezig" />
        <br/>
        <br/>
        <br/>
        <asp:Label ID="LbError" runat="server" Text="Label" Visible="false"></asp:Label>
    </div>
    <div id="Persoons Gegevens" style="width:350px; height:auto; float:right; display:inline-block">
        <section>
        <asp:Label ID="LbPersoonsGegevens" runat="server" Text="Persoons Gegevens" Font-Bold="True" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbGebruikersnaam" runat="server" Text="Gebruikersnaam:"></asp:Label>
        <br />
        <asp:TextBox ID="tbGebruikersnaam" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="lbNaam" runat="server" Text="Naam:"></asp:Label>
        <br />
        <asp:TextBox ID="tbNaam" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="lbWachtwoord" runat="server" Text="Wachtwoord:"></asp:Label>
        <br />
        <asp:TextBox ID="tbWachtwoord" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:CheckBox ID="cbAdmin" runat="server" Text="Admin:" TextAlign="Left" Font-Bold="False" Font-Size="X-Small" />
        <br />
        <asp:Button ID="btnAanmaken" runat="server" Text="Aanmaken" />
        <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" />
        </section>
        <br />
        <section>
        <asp:Label ID="lbBetaalstatus" runat="server" Text="Betaalstatus" Font-Bold="True" Font-Size="Medium"></asp:Label>
        <br />
        <asp:Button ID="btnChkStatus" runat="server" Text="Check betaal status" />
        <asp:DropDownList ID="dplBetaalStatus" runat="server"></asp:DropDownList>
            <br />
        <asp:Label ID="lbBetaald" runat="server" Text="Status" Visible="false"></asp:Label>
        <br />
        </section>
        <br />
        <section>
        <asp:Label ID="lbInchecken" runat="server" Text="Inchecken" Font-Bold="True" Font-Size="Medium"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbBarcode" runat="server" Text="Barcode:"></asp:Label>
        <br />
        <asp:TextBox ID="tbBarcode" runat="server"></asp:TextBox>
        <br />
        <asp:Panel ID="pnStatus" runat="server"></asp:Panel>
        <br />
        <asp:Label ID="lbStatus" runat="server" Text="Barcode Status" ClientIDMode="AutoID" Visible="False"></asp:Label>
        </section>
    </div>
    </asp:Content>
