<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserveren.aspx.cs" Inherits="ICT4Events_WebApplication.Reserveren" EnableEventValidation="false" %>
<%@ PreviousPageType VirtualPath="Map.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        * {font-family: Consolas; -webkit-box-sizing: border-box; -moz-sizing: border-box; box-sizing: border-box;}
        p { color: #6E5A7A;float: left; margin-left: 10px}
        input[type="text"]{ display: block;float: right;margin-right: 10px;}
        .placeholderReserveren{ width: 650px; position: relative; float: left}
        .placeholderReserveringen{width: 300px;position: relative; float: right}
        .checkListGebruikers { margin-top: 0%; }
        .gridViewGebruikers { border: 2px solid #6E5A7A; border-radius: 2px;}
        .gridViewReserveringen { border: 2px solid #6E5A7A; border-radius: 2px;}
        .datepickers{ height: 60px; }
        .persoonID{ height: 50px;}
        .kampeerplaats{ height: 50px;}
        #datepickerAankomstDatum { display: block; float: right; width: 410px}
        #datepickerVertrekDatum { display: block; float: right; width: 410px}
        #btnReserveren{ display: block; position: absolute}
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".datepicker").datepicker({"dateFormat": "dd/mm/yy"});
        });

        function OpenPopup() {
            window.open("Map.aspx");
            return false;
        }
    </script>
    <div class ="placeholderReserveren">
        <div class="gridViewGebruikers" align="center">
        <asp:SqlDataSource ID="AlleGebruikers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ID, &quot;voornaam&quot;, &quot;tussenvoegsel&quot;, &quot;achternaam&quot; FROM PERSOON"></asp:SqlDataSource>
        <asp:GridView ID="gvGebruikers" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AlleGebruikers" OnRowDataBound="gvGebruikers_RowDataBound" OnSelectedIndexChanged="gvGebruikers_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="voornaam" HeaderText="voornaam" SortExpression="voornaam" />
                <asp:BoundField DataField="tussenvoegsel" HeaderText="tussenvoegsel" SortExpression="tussenvoegsel" />
                <asp:BoundField DataField="achternaam" HeaderText="achternaam" SortExpression="achternaam" />
            </Columns>
        </asp:GridView><br/>
        </div>
    <div class="persoonID" align="center">
        <p>Geselecteerde Persoon ID: </p>
        <asp:TextBox ID="tbPersoonID" runat="server" ReadOnly="True"></asp:TextBox>
    </div>
    <br/>
    <div class="kampeerplaats" align="center">
        <p>Kampeerplaats: </p>
        <input type="button" onclick="OpenPopup()" value="Map" runat="server"/>
        <input type="text" ID="tbkampeerplaats" runat="server"/><br/>
        <asp:Label ID="lblPlaatsBezet" CssClass="aspLabel" runat="server" Text="Plaats bezet! Kies andere plaats a.u.b." ForeColor="#FF0000"></asp:Label>
    </div>
    <br/>
    <div class="datepickers" align="center">
        <p>Aankomstdatum: </p>
        <input runat="server" type="text" class="datepicker" id="datepickerAankomstDatum" readonly/><br />
    </div>
    <div class="datepickers" align="center">
        <p>Vertrekdatum: </p>
        <input runat="server" type="text" class="datepicker" id="datepickerVertrekDatum" readonly/><br/>
    </div>
    <div class="btnReserveren" align="center">
        <asp:Button ID="btnReserveren" runat="server" Height="39px" Text="Reserveer" OnClick="btnReserveren_Click" BackColor="#6E5A7A" Font-Size="16pt"/>
    </div>
    <br/>
     </div>
    <div class="placeholderReserveringen" align="right">
        <div class="gridViewReserveringen" align="center">
            <asp:GridView ID="gvReserveringen" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AlleReserveringen" OnRowDataBound="gvReserveringen_RowDataBound" OnSelectedIndexChanged="gvReserveringen_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="persoon_id" HeaderText="persoon_id" SortExpression="persoon_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="AlleReserveringen" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ID, &quot;persoon_id&quot; FROM RESERVERING"></asp:SqlDataSource>
            <asp:TextBox ID="tbReserveringID" runat="server"></asp:TextBox>
        </div>
        <div class="btnBetaald" align="center">
            <asp:Button ID="btnBetaald" runat="server" Height="39px" Text="Betaald" BackColor="#6E5A7A" Font-Size="16pt" OnClick="btnBetaald_Click"/>
        </div>
    </div>
</asp:Content>
