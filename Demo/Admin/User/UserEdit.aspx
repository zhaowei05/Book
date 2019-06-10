<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="Demo.Admin.User.UserEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户编辑</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
        <script src="../../js/jquery.js"></script>
    <script>
        $(function () {
            $("#ddlRole").change(function () {
                myddlRole();
            })
            $("#txtPwd").blur(function () {
                mytxtPwd();
            })
            $("#txtRealName").blur(function () {
                mytxtRealName();
            })
            $("#txtPhone").blur(function () {
                mytxtPhone();
            })
            $("#btAdd").click(function () {
                if (myddlRole() & mytxtPwd() & mytxtRealName() & mytxtPhone() )
                    return true
                else
                    return false;
            })
            $("#btCheckAccount").click(function () {
                mytxtAccount();
                myyhmim();
            })
        })
        function myddlRole() {
            var str = $("#ddlRole").val();
            if (str == 0) {
                $("#ddlRole").siblings('span').html("角色未选择！");
                return false;
            }
            else {
                $("#ddlRole").siblings('span').html("");
                return true;
            }
        }
        function mytxtAccount() {
            var str = $("#txtAccount").val();
            if (str == "") {
                $("#txtAccount").siblings('span').html("用户名不能为空！");
                return false;
            }
            else {
                $("#txtAccount").siblings('span').html("");
                return true;
            }
        }
        function mytxtPwd() {
            var str = $("#txtPwd").val();
            if (str == "") {
                return true;
            }
            else {
                $("#txtPwd").siblings('span').html("");
                return true;
            }
        }
        function mytxtRealName() {
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
        function mytxtPhone() {
            var reg = /^(13|15|18)\d{9}$/;
            var str = $("#txtPhone").val();
            if (str == "") {
                $("#txtPhone").siblings('span').html("联系电话不能为空！");
                return false;
            }
            else if (reg.test(str)==false)
            {
                $("#txtPhone").siblings('span').html("联系电话格式错误！");
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
            <tr class="titletr"><td colspan="2" style="text-align:center;">用户添加</td></tr>
            <tr>
                <td class="lefttd">用户角色:</td>
                <td>
                    <asp:DropDownList ID="ddlRole" ClientIDMode="Static" runat="server"></asp:DropDownList>
                    <span id="spanRole" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">用户名:</td>
                <td>
                    <asp:TextBox ID="txtAccount" ClientIDMode="Static" runat="server" Enabled="False"></asp:TextBox>
                    <span id="spanAccount" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">密码:</td>
                <td>
                    <asp:TextBox ID="txtPwd" ClientIDMode="Static" TextMode="Password" runat="server"></asp:TextBox>
                    <span id="spanPwd" style=" color:Red;">密码不输入代表不修改</span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">真实姓名:</td>
                <td>
                    <asp:TextBox ID="txtRealName" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanRealName" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">联系电话:</td>
                <td>
                    <asp:TextBox ID="txtPhone" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanPhone" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">&nbsp;</td>
                <td>
                    <asp:Button ID="btAdd" ClientIDMode="Static" runat="server" Text="修改用户" OnClick="btAdd_Click"  />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
