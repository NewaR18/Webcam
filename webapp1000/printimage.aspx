<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printimage.aspx.cs" Inherits="webapp1000.printimage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Hello
            
<asp:image ID="Image1" runat="server" ImageUrl ="printimage.aspx?ImageID=1"/>
        </div>
    </form>
</body>
</html>
