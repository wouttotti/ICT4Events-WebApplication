<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Huren.aspx.cs" Inherits="ICT4Events_WebApplication.Huren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<script>
</script>
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
    height: 350px;
    width: 925px; 
    padding: 10px 25px 10px 25px;
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

.uitlenen {
    margin-left: 170px;
}

#container-footer {
	margin-top: 10px;
}

.container-footer {
    height: auto;
}

.btnVerplaatsen {
	margin-left: 420px;
	margin-top: 25%;
}

.wissen {
    margin-left: 198px;
}

.uitlenenButton {
    float: right;
}

.btn {
    border-radius: 2px;
    color: white;
    font-size: 16pt;
}

.borg {
    font-size: 16pt;
    color: #6E5A7A;
}

.tekstbox {
    border-radius: 2px;
}

</style>

<div class="holder">
<header>
    <h1>Materiaal huren</h1>
</header>
<!--<h3>Beschikbaar materiaal</h3>
<h3 style="margin-left: 250px;">Materiaal huren</h3>-->
	
        <div class="cbl_container" style="margin-right: 75px;">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
            <div>
            	<asp:Button id="btnVerplaatsen" Text=">>" BackColor="#6E5A7A" CssClass="btn btnVerplaatsen" runat="server" Font-Size="14pt" />
            </div>
		</div>
        <div class="cbl_container">
            <asp:CheckBoxList ID="CheckBoxList2" runat="server"></asp:CheckBoxList>
        </div>
        <div class="container-footer">
			<asp:TextBox id="tb" runat="server" CssClass="tekstbox" BorderColor="#6E5A7A" placeholder="Exemplaar ID" BorderStyle="Solid" BorderWidth="2px"/>
            <asp:Button id="btnInfo" CssClass="btn" Text="Info" BackColor="#6E5A7A" runat="server" OnClick="btnInfo_Click" Font-Size="16pt" />
            <asp:Button id="btnWissen" CssClass="btn wissen" Text="Wissen" runat="server" BackColor="#6E5A7A" Font-Size="16pt" />
            <asp:Label ID="lblBorg" runat="server" CssClass="borg" Text="Borg: "></asp:Label>
            <asp:Button id="btnUitlenen" Text="Uitlenen" CssClass="btn uitlenenButton" runat="server" BackColor="#6E5A7A" Font-Size="16pt" />
        </div>
        <div>
            <asp:TextBox id="tbGebruikersnaam" runat="server" CssClass="tekstbox" BorderColor="#6E5A7A" placeholder="Gebruikersnaam" BorderStyle="Solid" BorderWidth="2px"/>
            <asp:TextBox id="tbRFID" runat="server" CssClass="tekstbox" BorderColor="#6E5A7A" placeholder="RFID" BorderStyle="Solid" BorderWidth="2px"/>
        </div>
</div>
</asp:Content>
