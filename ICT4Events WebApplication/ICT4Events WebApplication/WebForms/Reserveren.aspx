<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserveren.aspx.cs" Inherits="ICT4Events_WebApplication.Reserveren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinkButton ID="lnkBtnMap" runat="server" OnClientClick="window.open('Map.html')">Map</asp:LinkButton>
    <asp:CheckBoxList ID="checkListGebruikers" runat="server" Width="148px">
    </asp:CheckBoxList>
    <asp:CheckBoxList ID="checkListReserveringen" runat="server" Width="148px">
    </asp:CheckBoxList>
    <asp:Calendar ID="calAankomstDatum" runat="server"></asp:Calendar>
    <asp:Calendar ID="calVertrekDatum" runat="server"></asp:Calendar>
</asp:Content>
