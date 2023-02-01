<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jpt.aspx.cs" Inherits="webapp1000.jpt" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/mainpage.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function upload() {
            document.getElementById("take").style.visibility='hidden';
        };
        function take2() {
            document.getElementById("upload2").style.visibility = 'hidden';
            document.getElementById("take").readOnly=true;
            document.getElementById("take").value="Selected";
            document.getElementById("take").style.backgroundColor = 'green';
            document.getElementById("take").style.color = 'white';
        };
    </script>
    <style>
body{
background-image:url("CSS/hello.jpg");
}
        .ap{
            border:2px solid #012970;
            width:900px;
            margin-top:100px;
            padding:40px;
            border-radius:5px;
            background-color:white;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">  
        <div class="container ap">  
            <div class="mb-3 row">
                <asp:Label ID="nameLabel" CssClass="col-sm-2 col-form-label" runat="server" Text="Name"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="name"  CssClass="form-control" runat="server" ></asp:TextBox>
                </div>
            </div>
            <div class="mb-3 row">
                <asp:Label ID="addressLabel" CssClass="col-sm-2 col-form-label" runat="server" Text="Address"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="address" CssClass="form-control" runat="server" ></asp:TextBox>
                </div>    
            </div>
            <div class="mb-3 row">
                <asp:Label ID="emailLabel" CssClass="col-sm-2 col-form-label" runat="server" Text="Email"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="email"  CssClass="form-control" runat="server" ></asp:TextBox>
                </div>
            </div>
            <div class="mb-3 row">
                <asp:Label ID="phoneLabel" CssClass="col-sm-2 col-form-label" runat="server" Text="Phone Number"></asp:Label><br />
                <div class="col-sm-10">
                    <asp:TextBox ID="phone" CssClass="form-control" runat="server" ></asp:TextBox><br /><br />
                </div>
            </div>
            <asp:Label ID="photoLabel" CssClass="form-label" runat="server" Text="User Image:"></asp:Label><br />
            <div class="pic">
            <asp:FileUpload ID="upload2" CssClass="form-control" runat="server" onchange="upload()"/> 
            <asp:Button ID="take" runat="server" Text="Take Photo"  onmousedown="take2()"/>
            </div>
            <p><asp:Label ID="Label1" runat="server" Text="label" Visible="false"></asp:Label>  </p>
            <br /><br />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panl1" TargetControlID="take" CancelControlID="Button2" BackgroundCssClass="Background"> </cc1:ModalPopupExtender>  
                <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" style = "display:none">  
                 <iframe style=" width: 800px; height: 600px;" id="irm1" src="CS.aspx" runat="server"></iframe>  <br/>  
                <asp:Button ID="Button2" CssClass="btn btn-danger mb-3" runat="server" Text="Close" />  
                </asp:Panel> 
            <asp:Button ID="myButton" CssClass="btn btn-success mb-3" runat="server" Text="Submit"  OnClick="Submitted" />
        </div>  
        <br />                   
    </form>

</body>
</html>
