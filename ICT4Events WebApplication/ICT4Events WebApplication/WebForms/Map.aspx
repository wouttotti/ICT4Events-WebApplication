<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="ICT4Events_WebApplication.WebForms.Map"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <input runat="server" type="text" id="tbPlaatsNummer"/>
     <input runat="server" type="button" value="Send" onclick="GetValue();"/>
    </form>
    <p>
    <map name="camping" id="campingMap">
        <area id="200" title="200" shape="poly" coords="732,231,737,198,704,196,706,232" style="outline:none;" />
        <area id="201" title="201" shape="poly" coords="702,196,668,195,670,231,703,232" style="outline:none;" />
        <area id="203" title="203" shape="poly" coords="640,232,668,232,668,195,632,195" style="outline:none;" />
        <area id="202" title="202" shape="poly" coords="689,236,689,252,729,254,732,234" style="outline:none;" />
        <area id="213" title="213" shape="poly" coords="690,255,690,271,724,284,729,256" style="outline:none;" />
        <area id="204" title="204" shape="poly" coords="640,234,688,234,685,270,673,268,667,266,661,266,656,266,651,266,646,266" style="outline:none;" />
        <area id="205" title="205" shape="poly" coords="636,219,629,194,594,192,599,217" style="outline:none;" />
        <area id="206" title="206" shape="poly" coords="604,241,598,220,636,222,640,240" style="outline:none;" />
        <area id="212" title="212" shape="poly" coords="604,244,607,267,619,266,628,265,644,264,639,244" style="outline:none;" />
        <area id="208" title="208" shape="poly" coords="566,236,572,275,584,272,593,269,601,268,599,236" style="outline:none;" />
        <area id="207" title="207" shape="poly" coords="560,192,566,234,600,234,594,193" style="outline:none;" />
        <area id="209" title="209" shape="poly" coords="519,192,557,192,562,220,524,222" style="outline:none;" />
        <area id="210" title="210" shape="poly" coords="524,224,529,249,568,249,562,223" style="outline:none;" />
        <area id="211" title="211" shape="poly" coords="528,252,535,285,571,276,567,252" style="outline:none;" />
    </map>
    <img id="campingImage" src="campingreendal.png" border="0" width="1174" height="1179" usemap="#camping" alt="" /></p>
    <script>
            $("map[name=camping] area").on('click', function () {
                $("#tbPlaatsNummer").val($(this).attr('id'));
            });

            function GetValue() {
                if (window.opener != null && !window.opener.closed) {
                    var plaatsnummer = window.opener.document.getElementById("tbkampeerplaats");
                    plaatsnummer.value = document.getElementById("tbPlaatsNummer").value;
                }
                window.close();
            }
    </script>
</body>
</html>
