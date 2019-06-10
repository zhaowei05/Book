<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoEdit.aspx.cs" Inherits="Demo.Admin.Self.InfoEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人基本信息维护</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<script src="../../js/jquery.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("#txtRealName").blur(function () {
                myfOldPwd();
            })
            $("#txtPhone").blur(function () {
                myNewPwd();
            })
            $("#btUpdate").click(function () {
                if (myfOldPwd() & myNewPwd())
                    return true
                else
                    return false;
            })
        })
        function myfOldPwd() {
            var str = $("#txtRealName").val();
            if (str == "") {
                $("#txtRealName").siblings('span').html("真实姓名不能为空！");
                return false;
            }
            else {
                $("#txtRealName").siblings('span').html("");
                return true;
            }
        }
        function myNewPwd() {
            var str = $("#txtPhone").val();
            if (str == "") {
                $("#txtPhone").siblings('span').html("联系电话不能为空！");
                return false;
            }
            else {
                $("#txtPhone").siblings('span').html("");
                return true;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
                <table style="width:800px; margin-top:0px;" class="MyTable">
            <tr class="titletr"><td colspan="2" style="text-align:center;">基本信息维护</td></tr>
            <tr>
                <td class="lefttd">用户名:</td>
                <td>
                    <asp:Label ID="spanAccount" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="lefttd">真实姓名:</td>
                <td>
                    <asp:TextBox ID="txtRealName"  ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanRealName" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">联系电话:</td>
                <td>
                    <asp:TextBox ID="txtPhone"  ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanPhone" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">&nbsp;</td>
                <td>
                    <asp:Button ID="btUpdate" ClientIDMode="Static" runat="server" Text="修改信息" OnClick="btUpdate_Click" />                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
