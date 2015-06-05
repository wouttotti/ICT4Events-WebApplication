<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Huren.aspx.cs" Inherits="ICT4Events_WebApplication.Huren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<script>
    function showInfo() {
        alert('Dit is de info');
    };
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
    margin-left: 101px;
}

.uitlenenButton {
    float: right;
}

.btn {
    border-radius: 2px;
    color: white;
}

.tekstbox {
    border-radius: 2px;
}

/*.infoButton {
    margin-left: 40px;
}*/
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
            	<asp:Button id="btnVerplaatsen" Text=">>" BackColor="#6E5A7A" CssClass="btn btnVerplaatsen" runat="server" />
            </div>
		</div>
        <div class="cbl_container">
            <asp:CheckBoxList ID="CheckBoxList2" runat="server"></asp:CheckBoxList>
        </div>
        <div class="container-footer">
        		<!--<h3 id="container-footer">Zoek op exemplaar:</h3>-->
				<asp:TextBox id="tb" runat="server" CssClass="tekstbox" BorderColor="#6E5A7A" placeholder="Exemplaar ID" BorderStyle="Solid" BorderWidth="2px"/>
        		<!--<h3 class="uitlenen" id="container-footer">Leen materiaal uit:</h3>--> 
				
                <asp:Button id="btnInfo" CssClass="btn" Text="Info" BackColor="#6E5A7A" runat="server" OnClick="btnInfo_Click" />
                <asp:Button id="btnWissen" CssClass="wissen btn" Text="Wissen" runat="server" BackColor="#6E5A7A" />
                <asp:Button id="btnUitlenen" Text="Uitlenen" CssClass="btn uitlenenButton" runat="server" BackColor="#6E5A7A" />
        </div>
</div>
</asp:Content>
