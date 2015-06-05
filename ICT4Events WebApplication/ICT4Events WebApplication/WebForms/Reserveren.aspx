<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserveren.aspx.cs" Inherits="ICT4Events_WebApplication.Reserveren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .placeholderReserveren{ width: 850px; position: relative; float: left}
        .placeholderReserveringen{width: 100px;position: relative; float: right}
        .checkListGebruikers { margin-top: 0%;}
        .Reserveren{ display: block;}
        #datepickerAankomstDatum { display: block; float: left; width: 410px}
        #datepickerVertrekDatum { display: block; float: right; width: 410px}
        #btnReserveren{ display: block; position: absolute}
        .datepickers{ height: 250px; }
    </style>
    <script>
        $(function () {
            $(".datepicker").datepicker();
        });
    </script>
    <div class ="placeholderReserveren">
        <div class="gridViewGebruikers" align="center">
        <asp:SqlDataSource ID="AlleGebruikers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ID, &quot;voornaam&quot;, &quot;tussenvoegsel&quot;, &quot;achternaam&quot; FROM PERSOON"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AlleGebruikers">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="voornaam" HeaderText="voornaam" SortExpression="voornaam" />
                <asp:BoundField DataField="tussenvoegsel" HeaderText="tussenvoegsel" SortExpression="tussenvoegsel" />
                <asp:BoundField DataField="achternaam" HeaderText="achternaam" SortExpression="achternaam" />
            </Columns>
        </asp:GridView>
        </div>
    <br/>
    <div align="center">
        <asp:Label ID="lblKampeerplaats" runat="server" Text="Selecteer een kampeerplaats:"></asp:Label>
        <asp:TextBox ID="tbKampeerplaats" runat="server"></asp:TextBox>
        <asp:LinkButton ID="lnkBtnMap" runat="server" OnClientClick="window.open('Map.html')">Map</asp:LinkButton>
    </div>
    <br/>
    <div class="datepickers" align="center">
    <div class="datepicker" id="datepickerAankomstDatum"></div>
    <div class="datepicker" id="datepickerVertrekDatum"></div>
    </div>
    <br/>
    <div class="Reserveren" align="center">
        <asp:Button ID="btnReserveren" runat="server" Height="39px" Text="Reserveer" />
    </div>
    <br/>
     </div>
    <div class="placeholderReserveringen" align="right">
        <div class="checklistReserveringen">
            <asp:CheckBoxList class="checkListReserveringen" ID="checkListReserveringen" runat="server" Width="148px"></asp:CheckBoxList>
        </div>
        <div>
            <asp:Button ID="btnBetaald" runat="server" Height="39px" Text="Betaald" />
        </div>
    </div>
</asp:Content>
