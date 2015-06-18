<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="ICT4Events_WebApplication.Feed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Content/feed.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="berichtplaatsen">
    <table>
        <tr><td><asp:Label cssclass="Label1" runat="server" Text="Titel:"></asp:Label></td><td><asp:TextBox cssclass="tbTitel" runat="server" Width="394px" ID="tbTitel"></asp:TextBox>
            <asp:Label cssclass="lbCategorie" runat="server" Text="Categorie:"></asp:Label><asp:DropDownList cssclass="cbCategorie" runat="server" Height="30px" Width="120px" ID="ddlCategorie">
            </asp:DropDownList>
            </td></tr>
        <tr><td><asp:Label cssclass="Label2" runat="server" Text="Bericht:"></asp:Label></td><td><asp:TextBox cssclass="tbBericht" runat="server" Height="81px" Width="600px" MaxLength="140" Rows="5" TextMode="MultiLine" ID="tbBericht"></asp:TextBox></td></tr>
        <tr><td><asp:Label cssclass="Label3" runat="server" Text="Pad:"></asp:Label></td><td><asp:TextBox cssclass="tbPad" runat="server" Width="510px" ID="tbPad"></asp:TextBox>
            <asp:Button cssclass="btBrowse" runat="server" Height="30px" Text="Browse..." Width="85px" BackColor="#6E5A7A" ID="btBrowse" />
            </td></tr>
        <tr><td></td><td><asp:RadioButton CssClass="RadioButtonSoort RadioButtonSoort1" GroupName="Radiobuttonsoortbericht" Checked="true" Text="Bericht" runat="server" ID="rbBericht" OnCheckedChanged="rbBericht_CheckedChanged" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Video" runat="server" ID="rbVideo" OnCheckedChanged="rbBericht_CheckedChanged" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Foto" runat="server" ID="rbFoto" OnCheckedChanged="rbBericht_CheckedChanged" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Bestand" runat="server" ID="rbBestand" OnCheckedChanged="rbBericht_CheckedChanged" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Event" runat="server" ID="rbEvent" OnCheckedChanged="rbBericht_CheckedChanged" />
            <asp:Button cssclass="btPost" runat="server" Text="Post!" BackColor="#6E5A7A" OnClick="btPost_Click" ID="btPost" /></td></tr>
    </table>
    </div>
    <div id="sorteermenu">
        <div id="sorteermenu1"><asp:Label cssclass="Lbsorteer" runat="server" Text="Sorteer op:"></asp:Label></div>
        <div id="sorteermenu2"><label for="CheckBoxsorteer">Berichten</label><asp:CheckBox cssclass="CheckBoxsorteer CheckBoxsorteer1" runat="server" ID="cbBericht" /><label for="CheckBoxsorteer">Video's</label><asp:CheckBox cssclass="CheckBoxsorteer" runat="server" ID="cbVideo" /><label for="CheckBoxsorteer">Foto's</label><asp:CheckBox CssClass="CheckBoxsorteer" runat="server" ID="cbFoto" /><label for="CheckBoxsorteer">Bestanden</label><asp:CheckBox cssclass="Checkboxsorteer" runat="server" ID="cbBestanden" /><label for="CheckBoxsorteer">Events</label><asp:CheckBox cssclass="Checkboxsorteer" runat="server" ID="cbEvent" /></div>
    </div>
    <div id="feed">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="GetFeed">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField HeaderText="gebruikersnaam" DataField="gebruikersnaam" SortExpression="gebruikersnaam" />
                <asp:BoundField HeaderText="titel" DataField="titel" SortExpression="titel" />
                <asp:BoundField HeaderText="inhoud" DataField="inhoud" SortExpression="inhoud" />
                <asp:BoundField DataField="datum" HeaderText="datum" SortExpression="datum" />
                <asp:BoundField DataField="soort" HeaderText="soort" SortExpression="soort" />
                <asp:BoundField DataField="like" HeaderText="like" SortExpression="like" />
                <asp:BoundField DataField="ongewenst" HeaderText="ongewenst" SortExpression="ongewenst" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6E5A7A" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="GetFeed" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ACCOUNT&quot;.&quot;gebruikersnaam&quot;, BERICHT.&quot;titel&quot;, BERICHT.&quot;inhoud&quot;, BIJDRAGE.&quot;datum&quot;, BIJDRAGE.&quot;soort&quot;, BIJDRAGE.&quot;like&quot;, BIJDRAGE.&quot;ongewenst&quot; FROM BERICHT, BIJDRAGE, &quot;ACCOUNT&quot; WHERE BERICHT.&quot;bijdrage_id&quot; = BIJDRAGE.ID AND BIJDRAGE.&quot;account_id&quot; = &quot;ACCOUNT&quot;.ID"></asp:SqlDataSource>
    </div>

</asp:Content>
