<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleAdd.aspx.cs" Inherits="Demo.Admin.Role.RoleAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>角色添加</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.js"></script>
    <script>
        $(function () {
            $("#txtRoleName").blur(function () {
                myfunction();
            })
            $("#btAdd").click(function () {
                if (myfunction())
                    return true;
                else
                    return false;
            })

            function myfunction() {
                var str = $("#txtRoleName").val();
                if (str == "") {
                    $("#txtRoleName").siblings('span').html("角色名称不能为空！");
                    return false;
                }
                else {
                    $("#txtRoleName").siblings('span').html("");
                    return true;
                }
            }
        })
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table style="width:800px; margin-top:0px;" class="MyTable">
            <tr class="titletr"><td colspan="2" style="text-align:center;">角色添加</td></tr>
            <tr>
                <td class="lefttd">角色名称:</td>
                <td>
                    <asp:TextBox ID="txtRoleName" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanName" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">角色描述:</td>
                <td>
                    <asp:TextBox ID="txtRemark" TextMode="MultiLine" ClientIDMode="Static" rows="2" cols="20" runat="server" style="height:160px;width:430px;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="lefttd">&nbsp;</td>
                <td>
                    <asp:Button ID="btAdd" runat="server" ClientIDMode="Static" Text="新增角色" OnClick="btAdd_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
