<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Card.aspx.cs" Inherits="webapp1000.Card" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/card2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
        <div class="id">
        <div id="com">
            InfoDevelopers Pvt. Ltd.
        </div>
        <div id="loc">
            Sanepa-2, Lalitpur P.O Box:5552
        </div>
        <div class="vir">
            <b>Email:</b> info@infodev.com.mp
        </div>
        <div class="vir">
            <b>Web:</b> www.infodev.com.np
        </div>
            <br/><br/>
        <div class="id1">
        <div>
            <br />
        <div class="name1">
            <asp:Label ID="name" runat="server">Name: </asp:Label>
            <asp:Label ID="getname" CssClass="content" runat="server"></asp:Label>
        </div>
         <div class="name1">
            <asp:Label ID="address" runat="server">Address: </asp:Label>
            <asp:Label ID="getaddress" CssClass="content" runat="server"></asp:Label>
         </div>
        <div class="name1">
            <asp:Label ID="email" runat="server">Email: </asp:Label>
            <asp:Label ID="getemail" CssClass="content" runat="server"></asp:Label>
        </div>
        <div class="name1">
        <asp:Label ID="phone" runat="server">Phone Number: </asp:Label>
        <asp:Label ID="getphone" CssClass="content" runat="server"></asp:Label>
        </div>
        <br />
            </div>
        <asp:image ID="Image1" CssClass="hell" runat="server" ImageUrl ="Card.aspx?ImageID=1"/>
        </div>
            </div>
        </div>
    </form>
</body>
</html>
