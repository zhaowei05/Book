<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Demo.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>登录</title>
    <link href="css/css.css" rel="stylesheet" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <style type="text/css">     
	    #login{ width:538px; height:299px; background-image:url(img/Loginbg.jpg); margin:100px auto 0px auto;}
	    #Title{ color:#0f607b;  text-align:center; height:50px; line-height:50px; font-size:30px; font-weight:bold; margin-top:20px;}
	    td { height:28px; line-height:28px;color:#0f607b; font-size:14px; font-weight:bold; margin:0px; margin-bottom:10px; padding:4px;}
	    .lefttd { width:60px; text-align:right;}
	    input{ border-radius:5px; border:1px solid #0f607b; height:20px;}
	    .submit{ height:30px; width:72px;background-image: url(img/a.jpg); cursor:pointer; background-repeat: no-repeat; color:#fff; font-weight:bold; background-position:center center; border-width:0px; }
	    .reset{ height:30px; width:72px;background-image: url(img/hover.jpg); cursor:pointer;background-repeat: no-repeat;color:#0f607b;font-weight:bold; background-position:center center; border-width:0px;}
        #lblErr>div{font-size:12px;margin:10px;}
    </style>
    <script>
        function CheckAccount() {
            var reg = /^\w{6,20}$/;
            if ($("#txtAccount").val() == "") {
                $("#lblErr").append("<div style='color:red'>账号不能为空!</div>");
                return false;
            }
            else {
                $("#lblErr").append("");
                return true;
            }
        }
        function CheckPwd() {
            var reg = /^\w{6,20}$/;
            if ($("#txtPwd").val() == "") {
                $("#lblErr").append("<div style='color:red'>密码不能为空!</div>");
                return false;
            }
            else {
                $("#lblErr").append("");
                return true;
            }
        }
        function Checkyzm() {
            var reg = /^\w{6,20}$/;
            if ($("#txtValidate").val() == "") {
                $("#lblErr").append("<div style='color:red'>验证码不能为空!</div>");
                return false;
            }
            else {
                $("#lblErr").append("");
                return true;
            }
        }
        $(function () {
            $("#btLogin").click(function () {
                $("#lblErr").html("");
                if (CheckAccount() & CheckPwd() & Checkyzm())
                    return true;
                else
                    return false;
            })
            $("#Refresh").click(function () {
                $("#imge").prop("src", "Vesbtext.aspx?"+new Date());
            })
            $("#cckon").click(function () {
                $("#txtAccount").val("");
                $("#txtPwd").val("");
                $("#txtValidate").val("");
            })
        })
    </script>
   
</head>
<body style="background-image:url(img/loginbody.jpg); background-color:#beecf9;">
    <form id="form1" runat="server">
           <div id="login">
        <div id="Title">书城后台管理系统</div>
        <div style="height:20px;"></div>
        <div id="loginForm">
            <table border="0" style="width:300px;">
                <tr>
                    <td class="lefttd">用户名：</td>
                    <td>
                        <asp:TextBox ID="txtAccount" name="txtAccount"  ClientIDMode="Static"   runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="lefttd">密码：</td>
                    <td>
                         <asp:TextBox ID="txtPwd" TextMode="Password" name="txtPwd"  ClientIDMode="Static"   runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="lefttd">验证码：</td>
                    <td>
                        <asp:TextBox ID="txtValidate" name="txtValidate"  ClientIDMode="Static" style="width:72px;"   runat="server"></asp:TextBox>
                        <img src="Vesbtext.aspx"  id="imge"/>
                        <a href="javascript:void(0);" id="Refresh">刷新</a>
                    </td>
                </tr>
                <tr>
                    <td class="lefttd">&nbsp;</td>
                    <td>
                        <asp:Button name="btLogin" ClientIDMode="Static" runat="server" text="登录" id="btLogin" class="submit" OnClick="btLogin_Click"/>
                        <input type="reset" id="cckon" class="reset" value="清 空"/>
                    </td>
                </tr>
                <tr>
                    <td class="lefttd">&nbsp;</td>
                    <td>
                        <span id="lblErr" style="color:Red;"></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
