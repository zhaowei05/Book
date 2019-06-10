<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PwdEdit.aspx.cs" Inherits="Demo.Admin.Self.PwdEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人密码维护</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.js"></script>
    <script>
        $(function () {
            $("#txtOldPwd").blur(function () {
                myfOldPwd();
            })
            $("#txtNewPwd").blur(function () {
                myNewPwd();
            })
            $("#txtConfirmPwd").blur(function () {
                myConfirmPwd();
            })
            $("#btUpdate").click(function () {
                if (myfOldPwd() & myNewPwd() & myConfirmPwd())
                    return true;
                else
                    return false;
            })

            function myfOldPwd() {
                var str = $("#txtOldPwd").val();
                if (str == "") {
                    $("#txtOldPwd").siblings('span').html("原始密码不能为空！");
                    return false;
                }
                else {
                    $("#txtOldPwd").siblings('span').html("");
                    return true;
                }
            }
            function myNewPwd() {
                var str = $("#txtNewPwd").val();
                if (str == "") {
                    $("#txtNewPwd").siblings('span').html("新密码不能为空！");
                    return false;
                }
                else {
                    $("#txtNewPwd").siblings('span').html("");
                    return true;
                }
            }
            function myConfirmPwd() {
                var str = $("#txtConfirmPwd").val();
                if (str == "") {
                    $("#txtConfirmPwd").siblings('span').html("确认密码不能为空！");
                    return false;
                }
                else if (str != $("#txtNewPwd").val()) {
                    $("#txtConfirmPwd").siblings('span').html("密码不一致！");
                    return false;
                }
                else {
                    $("#txtConfirmPwd").siblings('span').html("");
                    return true;
                }
            }
        })
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
         <table style="width:800px; margin-top:6px;" class="MyTable">
            <tr class="titletr"><td colspan="2" style="text-align:center;">个人密码维护</td></tr>
            <tr>
                <td class="lefttd">原始密码:</td>
                <td>
                    <asp:TextBox ID="txtOldPwd" TextMode="Password" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanOldPwd" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">新密码:</td>
                <td>
                    <asp:TextBox ID="txtNewPwd" TextMode="Password" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanNewPwd" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">确认密码:</td>
                <td>
                    <asp:TextBox ID="txtConfirmPwd" TextMode="Password" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanConfirmPwd" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">&nbsp;</td>
                <td>
                    <asp:Button ID="btUpdate" ClientIDMode="Static" runat="server" Text="修改密码" OnClick="btUpdate_Click" />     
                </td>
            </tr>
        </table>
		
    </form>
</body>
</html>
