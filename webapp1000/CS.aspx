<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
            background-image: url('hello.jpg');
        }
        table
        {
            border: 2px solid #ccc;
            border-collapse: collapse;

        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
            height:40px;
        }
        table th, table td
        {
            padding: 5px;
            width: 300px;
            border: 1px solid #ccc;
        }
        .caption{
            color:red;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size:20px;
            text-align:center;
        }
        .box{
            width:800px;
            height:500px;
        }
        .formimage{
            text-align:center;
        }
        .formimage2{
            display:flex;
            justify-content:center;
        }
        .tablemain{
            display:flex;
            justify-content:center;
        }
        .bottom{
            height:40px;
        }
        
    </style>
</head>
<body>
    <p class="caption">Capture your image until you are satisfied and Upload your Image</p>
    <input type="button" id="cam" value="Open Camera" />
    <div class="tablemain">
        <table class="box" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <th align="center"><u>Live Camera</u></th>
            <th align="center"><u>Captured Picture</u></th>
        </tr>
        <tr>
            <td><div class="formimage2"><div id="webcam"></div></div></td>
            <td class="formimage"><img id = "imgCapture" /></td>
           
        </tr>
        <tr>
            <td class="bottom" align = "center">
                <input type="button" id="btnCapture" value="Capture" />
            </td>
            <td class="bottom" align = "center">
                <input type="button" id="btnUpload" value="Upload" disabled = "disabled" />
            </td>
        </tr>
        </table>
        <asp:Label ID="Label1" runat="server" Text="label" Visible="false"></asp:Label>  
    </div>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="WebCam2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            Webcam.set({
                width: 320,
                height: 320,
                image_format: 'jpeg',
                jpeg_quality: 90
            });
            $("#cam").click(function () {
                Webcam.attach('#webcam');
            });
            
            $("#btnCapture").click(function () {
                Webcam.snap(function (data_uri) {
                    $("#imgCapture")[0].src = data_uri;
                    $("#btnUpload").removeAttr("disabled");
                });
            });
            $("#btnUpload").click(function () {
                $.ajax({
                    type: "POST",
                    url: "CS.aspx/SaveCapturedImage",
                    data: "{data: '" + $("#imgCapture")[0].src +  "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        /*window.location = response.d;*/
                        console.log(response.d);
                        
                        $.ajax({
                            type: "POST",
                            url: "jpt.aspx/getfromCSPage",
                            data: "{num: '" + response.d + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                window.location = response.d;
                            },
                            error: function (req, status, error) {
                                console.log(status);
                                console.log(error);
                                console.log(req);
                            }
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>
