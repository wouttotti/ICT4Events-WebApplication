<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Beheren.aspx.cs" Inherits="ICT4Events_WebApplication.Beheren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="Gebruikers" style="width:250px; height: 450px; float: left; display:block">
        <asp:Label ID="LbGebruiker" runat="server" Text="Gebruikers"></asp:Label>
        <br />
        <asp:ListBox ID="ListBGebruikers" runat="server" Height="400px" Width="250px"></asp:ListBox>

    </div>
    <div style="float:left; margin-left:110px; margin-right:auto; margin-top:20px; display:inline-block" align="center">
        <asp:Button ID="btnAanpassen" runat="server" Text="Aanpassen"/>
        <br />
        <asp:Button ID="btnLaatzien" runat="server" Text="Laat zien" OnClick="btnLaatzien_Click"/>
        <br />
        <asp:CheckBox ID="cbAanwezig" runat="server" Text="Aanwezig" />
        <br/>
        <br/>
        <br/>
        <asp:Label ID="LbError" runat="server" Text="Label" Visible="false"></asp:Label>
    </div>
    <div id="Persoons Gegevens" style="width:350px; height:auto; float:right; display:inline-block">
        <section>
        <asp:Label ID="LbPersoonsGegevens" runat="server" Text="Persoons Gegevens" Font-Bold="True" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbGebruikersnaam" runat="server" Text="Gebruikersnaam:"></asp:Label>
        <br />
        <asp:TextBox ID="tbGebruikersnaam" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="lbNaam" runat="server" Text="Naam:"></asp:Label>
        <br />
        <asp:TextBox ID="tbNaam" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:Label ID="lbWachtwoord" runat="server" Text="Wachtwoord:"></asp:Label>
        <br />
        <asp:TextBox ID="tbWachtwoord" runat="server" Width="150px"></asp:TextBox>
        <br />
        <asp:CheckBox ID="cbAdmin" runat="server" Text="Admin:" TextAlign="Left" Font-Bold="False" Font-Size="X-Small" />
        <br />
        <asp:Button ID="btnAanmaken" runat="server" Text="Aanmaken" OnClick="btnAanmaken_Click" />
        <asp:Button ID="btnWijzigen" runat="server" Text="Wijzigen" />
        </section>
        <br />
        <section>
        <asp:Label ID="lbBetaalstatus" runat="server" Text="Betaalstatus" Font-Bold="True" Font-Size="Medium"></asp:Label>
        <br />
        <asp:Button ID="btnChkStatus" runat="server" Text="Check betaal status" />
        <asp:DropDownList ID="dplBetaalStatus" runat="server"></asp:DropDownList>
            <br />
        <asp:Label ID="lbBetaald" runat="server" Text="Status" Visible="false"></asp:Label>
        <br />
        </section>
        <br />
        <section>
        <asp:Label ID="lbInchecken" runat="server" Text="Inchecken" Font-Bold="True" Font-Size="Medium"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbBarcode" runat="server" Text="Barcode:"></asp:Label>
        <br />
        <asp:TextBox ID="TbBarcode" runat="server" OnTextChanged="tbBarcode_TextChanged"></asp:TextBox>
            <script>
                // only init when the page has loaded
                $(document).ready(function () {
                    // variable to ensure we wait to check the input we are receiving
                    // you will see how this works further down
                    var pressed = false;
                    // Variable to keep the barcode when scanned. When we scan each
                    // character is a keypress and hence we push it onto the array. Later we check
                    // the length and final char to ensure it is a carriage return - ascii code 13
                    // this will tell us if it is a scan or just someone writing on the keyboard
                    var chars = [];
                    // trigger an event on any keypress on this webpage
                    $(window).keypress(function (e) {
                        // check the keys pressed are numbers
                        if (e.which >= 48 && e.which <= 57) {
                            // if a number is pressed we add it to the chars array
                            chars.push(String.fromCharCode(e.which));
                        }
                        // debug to help you understand how scanner works
                        console.log(e.which + ":" + chars.join("|"));
                        // Pressed is initially set to false so we enter - this variable is here to stop us setting a
                        // timeout everytime a key is pressed. It is easy to see here that this timeout is set to give 
                        // us 1 second before it resets everything back to normal. If the keypresses have not matched 
                        // the checks in the readBarcodeScanner function below then this is not a barcode
                        if (pressed == false) {
                            // we set a timeout function that expires after 1 sec, once it does it clears out a list 
                            // of characters 
                            setTimeout(function () {
                                // check we have a long length e.g. it is a barcode
                                if (chars.length >= 10) {
                                    // join the chars array to make a string of the barcode scanned
                                    var barcode = chars.join("");
                                    // debug barcode to console (e.g. for use in Firebug)
                                    console.log("Barcode Scanned: " + barcode);
                                    // assign value to some input (or do whatever you want)
                                    //$("#barcodeInput").value = barcode;
                                }
                                chars = [];
                                pressed = false;
                            }, 500);
                        }
                        // set press to true so we do not reenter the timeout function above
                        pressed = true;
                    });
                });
                // this bit of code just ensures that if you have focus on the input which may be in a form
                // that the carriage return does not cause your form to be submitted. Some scanners submit
                // a carriage return after all the numbers have been passed.
                $(".TbBarcode").keypress(function (e) {
                    if (e.which === 13) {
                        console.log("Prevent form submit.");
                        e.preventDefault();
                    }
                })
        </script>
        <br />
        <asp:Panel ID="pnStatus" runat="server" Height="49px" Width="330px"></asp:Panel>
            <asp:Timer ID="TimerPanelReset" runat="server" Enabled="False" Interval="2000" OnTick="TimerPanelReset_Tick">
            </asp:Timer>
        <br />
        </section>
    </div>
    </asp:Content>
