<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="webapp1000.MainForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/mainpage.css" rel="stylesheet" />
    <script type="text/javascript">
                function changed() {
                    console.log("jpt");
                }
    </script>
</head>
<body>
    <form id="form1" runat="server">  
        <div>  
            <asp:Label ID="nameLabel" runat="server" Text="Name"></asp:Label><br />
            <asp:TextBox ID="name" runat="server" ></asp:TextBox><br /><br />
            <asp:Label ID="addressLabel" runat="server" Text="Address"></asp:Label><br />
            <asp:TextBox ID="address" runat="server" ></asp:TextBox><br /><br />
            <asp:Label ID="emailLabel" runat="server" Text="Email"></asp:Label><br />
            <asp:TextBox ID="email" runat="server" ></asp:TextBox><br /><br />
            <asp:Label ID="phoneLabel" runat="server" Text="Phone Number"></asp:Label><br />
            <asp:TextBox ID="phone" runat="server" ></asp:TextBox><br /><br />
            <asp:Label ID="photoLabel" runat="server" Text="User Image:"></asp:Label><br />
            <div class="pic">
            <asp:FileUpload ID="upload" runat="server" onchange="changed()"/> 
            
            <asp:Label ID="lblError" runat="server" ForeColor="Red" />
            <asp:Button ID="take" runat="server" Text="Take Photo"  />
            </div>
            <p><asp:Label ID="Label1" runat="server" Text="label" Visible="false"></asp:Label>  </p>
            <br /><br />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panl1" TargetControlID="take" CancelControlID="Button2" BackgroundCssClass="Background"> </cc1:ModalPopupExtender>  
                <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" style = "display:none">  
                 <iframe style=" width: 800px; height: 600px;" id="irm1" src="CS.aspx" runat="server"></iframe>  <br/>  
                <asp:Button ID="Button2" runat="server" Text="Close" />  
                </asp:Panel> 
            <asp:Button ID="myButton" runat="server" Text="Submit"  OnClick="Submitted" />
        </div>  
        <br />                   
    </form>  
</body>
</html>

