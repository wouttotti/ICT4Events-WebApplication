<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="ICT4Events_WebApplication.Feed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Content/feed.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="berichtplaatsen">
    <table>
        <tr><td><asp:Label cssclass="Label1" runat="server" Text="Titel:"></asp:Label></td><td><asp:TextBox cssclass="tbTitel" runat="server" Width="394px"></asp:TextBox>
            <asp:Label cssclass="lbCategorie" runat="server" Text="Categorie:"></asp:Label><asp:DropDownList cssclass="cbCategorie" runat="server" Height="30px" Width="120px">
            </asp:DropDownList>
            </td></tr>
        <tr><td><asp:Label cssclass="Label2" runat="server" Text="Bericht:"></asp:Label></td><td><asp:TextBox cssclass="tbBericht" runat="server" Height="81px" Width="600px" MaxLength="140" Rows="5" TextMode="MultiLine"></asp:TextBox></td></tr>
        <tr><td><asp:Label cssclass="Label3" runat="server" Text="Pad:"></asp:Label></td><td><asp:TextBox cssclass="tbPad" runat="server" Width="510px"></asp:TextBox>
            <asp:Button cssclass="btBrowse" runat="server" Height="30px" Text="Browse..." Width="85px" BackColor="#6E5A7A" />
            </td></tr>
        <tr><td></td><td><asp:RadioButton CssClass="RadioButtonSoort RadioButtonSoort1" GroupName="Radiobuttonsoortbericht" Checked="true" Text="Bericht" runat="server" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Video" runat="server" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Foto" runat="server" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Bestand" runat="server" /><asp:RadioButton cssClass="RadioButtonSoort" GroupName="Radiobuttonsoortbericht" Text="Event" runat="server" /><asp:Button cssclass="btPost" runat="server" Text="Post!" BackColor="#6E5A7A" OnClick="Unnamed15_Click" /></td></tr>
    </table>
    </div>
    <div id="sorteermenu">
        <div id="sorteermenu1"><asp:Label cssclass="Lbsorteer" runat="server" Text="Sorteer op:"></asp:Label></div>
        <div id="sorteermenu2"><label for="CheckBoxsorteer">Berichten</label><asp:CheckBox cssclass="CheckBoxsorteer CheckBoxsorteer1" runat="server" /><label for="CheckBoxsorteer">Video's</label><asp:CheckBox cssclass="CheckBoxsorteer" runat="server" /><label for="CheckBoxsorteer">Foto's</label><asp:CheckBox CssClass="CheckBoxsorteer" runat="server" /><label for="CheckBoxsorteer">Bestanden</label><asp:CheckBox cssclass="Checkboxsorteer" runat="server" /><label for="CheckBoxsorteer">Events</label><asp:CheckBox cssclass="Checkboxsorteer" runat="server" /></div>
    </div>
    <div id="feed">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="GetFeed">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField HeaderText="gebruikersnaam" DataField="gebruikersnaam" SortExpression="gebruikersnaam" />
                <asp:BoundField HeaderText="titel" DataField="titel" SortExpression="titel" />
                <asp:BoundField HeaderText="inhoud" DataField="inhoud" SortExpression="inhoud" />
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
        <asp:SqlDataSource ID="GetFeed" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ac.&quot;gebruikersnaam&quot;,  be.&quot;titel&quot;, be.&quot;inhoud&quot; FROM BERICHT be, bijdrage bi, account ac
where be.&quot;bijdrage_id&quot; = bi.&quot;ID&quot; 
and bi.&quot;account_id&quot; = ac.&quot;ID&quot;
"></asp:SqlDataSource>
    </div>

</asp:Content>
