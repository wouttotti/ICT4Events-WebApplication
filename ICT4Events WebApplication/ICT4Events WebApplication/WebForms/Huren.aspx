<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Huren.aspx.cs" EnableEventValidation="false" Inherits="ICT4Events_WebApplication.Huren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<style>
    
* {
    padding: 0;
    margin: 0; 
    -webkit-box-sizing: border-box;
    -moz-sizing: border-box;
    box-sizing: border-box;
    font-family: Consolas;
}

body {
    margin-top: 10px;
    margin-left: 10px;
}

.holder {
    height: 402px;
    width: 927px; 
    padding: 10px 25px 10px 25px;
    margin-bottom: 40px;
    border: 1px dotted #6E5A7A;
}

.cbl_container {
    border: 2px solid #6E5A7A; 
    border-radius: 2px;
    width: 400px; 
    height: 250px;
    display: block;
    float: left;
}

h1 {
    color: #6E5A7A;
}

h3 {
    display: inline-block;
}

#container-footer {
	margin-top: 10px;
}

.container-footer {
    height: auto;
}

.btnVerplaatsen {
	margin-left: 420px;
	/*margin-top: 25%;*/
}

.wissen {
    margin-left: 68px;
}

.uitlenenButton {
    float: right;
    margin-right: 0;
}

.btn {
    border-radius: 4px;
    color: white;
    font-size: 14pt;
}

.borg {
    font-size: 16pt;
    color: #6E5A7A;
}

.tekstbox {
    border-radius: 2px;
}

.paneltje {
    margin: 0;
    padding: 0;
}
input[type="submit"],
    input[type="button"],
    button {
    margin-right: 0px;
}

.infoButton {
    margin-left: 12px;
}

.zoekButton {
    margin-left: 15px;
}

</style>

<script>
      
</script>

<div class="holder">
<header>
    <h1>Materiaal huren</h1>
</header>
        <div class="cbl_container" style="margin-right: 75px;">
            <asp:ListBox ID="ListBox1" runat="server" BackColor="#6E5A7A" style="color: #fff; height: 246px; width: 396px; margin-bottom: 4px; Font-Size: 12pt;" SelectionMode="Multiple"></asp:ListBox>
            </div>
        <div class="cbl_container" >
                    <asp:ListBox ID="lbHuurExemplaren" SelectionMode="Multiple" runat="server" BackColor="#6E5A7A" style="color: #fff; height: 246px; width: 396px; margin-bottom: 4px; Font-Size: 12pt;"></asp:ListBox>
        </div>
        <div class="container-footer">
            <asp:Panel DefaultButton="btnSearch" ID="Panel1" CssClass="paneltje" runat="server">
			    <asp:TextBox id="tb" runat="server" CssClass="tekstbox" BorderColor="#6E5A7A" placeholder="Exemplaar ID" BorderStyle="Solid" BorderWidth="2px"/>
            
            <asp:Button id="btnSearch" CssClass="btn zoekButton" Text="Zoek" BackColor="#6E5A7A" runat="server" Font-Size="12pt" OnClick="btnSearch_Click" Height="34px" />
            <asp:Button id="btnInfo" CssClass="btn infoButton" Text="Overzetten" BackColor="#6E5A7A" runat="server" OnClick="btnInfo_Click" Font-Size="12pt" Height="34px" />
             
            <asp:Button id="btnWissen" CssClass="btn wissen" Text="Wissen" runat="server" BackColor="#6E5A7A" Font-Size="12pt" OnClick="btnWissen_Click" Height="34px" />
            <asp:Label ID="labeltje" runat="server" CssClass="borg" Text="Borg: "></asp:Label>
            <asp:Label ID="lblBorg" runat="server" CssClass="borg"></asp:Label>
            <asp:CheckBox ID="cbBetaald" runat="server" />
            <asp:Button id="btnUitlenen" Text="Uitlenen"  CssClass="btn uitlenenButton" runat="server" BackColor="#6E5A7A" Font-Size="12pt" Height="34px" OnClick="btnUitlenen_Click" />
            </asp:Panel>
        </div>
        <div>
            <asp:TextBox id="tbGebruikersnaam" runat="server" CssClass="tekstbox" BorderColor="#6E5A7A" placeholder="Gebruikersnaam" BorderStyle="Solid" BorderWidth="2px"/>
            <asp:TextBox id="tbRFID" runat="server" CssClass="tekstbox" BorderColor="#6E5A7A" placeholder="Barcode" BorderStyle="Solid" BorderWidth="2px"/>
        </div>
</div>
</asp:Content>
