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
    <asp:CheckBoxList class="checkListGebruikers" ID="checkListGebruikers" runat="server" Width="148px">
    </asp:CheckBoxList>
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
