<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserveren.aspx.cs" Inherits="ICT4Events_WebApplication.Reserveren" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .placeholderReserveren{ width: 850px; position: relative; float: left}
        .placeholderReserveringen{width: 100px;position: relative; float: right}
        .checkListGebruikers { margin-top: 0%;}
        .Reserveren{ display: block;}
        #datepickerAankomstDatum { display: block; float: right; width: 410px}
        #datepickerVertrekDatum { display: block; float: right; width: 410px}
        #btnReserveren{ display: block; position: absolute}
        .datepickers{ height: 250px; }
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
        </asp:GridView>
            <asp:Label ID="lblPersoonID" runat="server" Text="Geselecteerde Persoons ID:"></asp:Label>
            <asp:TextBox ID="tbPersoonID" runat="server" ReadOnly="True"></asp:TextBox>
        </div>
    <br/>
    <div class="kampeerplaats" align="center">
        <asp:Label ID="lblKampeerplaats" runat="server" Text="Selecteer een kampeerplaats:"></asp:Label>
        <input type="text" id="tbkampeerplaats"/>
        <input type="button" onclick="OpenPopup()" value="Map" runat="server"/>
        <asp:Label ID="lblPlaatsBezet" runat="server" Text="Plaats bezet! Kies andere plaats a.u.b."></asp:Label>
    </div>
    <br/>
    <div class="datepickers" align="center">
        <p>Aankomstdatum: <input runat="server" type="text" class="datepicker" id="datepickerAankomstDatum" readonly/></p><br />
        <p>Vertrekdatum: <input runat="server" type="text" class="datepicker" id="datepickerVertrekDatum" readonly/></p>
    </div>
    <div class="Reserveren" align="center">
        <asp:Button ID="btnReserveren" runat="server" Height="39px" Text="Reserveer" OnClick="btnReserveren_Click" />
    </div>
    <br/>
     </div>
    <div class="placeholderReserveringen" align="right">
        <div class="gridViewReserveringen">
            <asp:GridView ID="gvReserveringen" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AlleReserveringen">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="persoon_id" HeaderText="persoon_id" SortExpression="persoon_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="AlleReserveringen" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ID, &quot;persoon_id&quot; FROM RESERVERING"></asp:SqlDataSource>
        </div>
        <div>
            <asp:Button ID="btnBetaald" runat="server" Height="39px" Text="Betaald" />
        </div>
    </div>
</asp:Content>
