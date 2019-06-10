<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberEdit.aspx.cs" Inherits="Demo.Admin.Member.MemberEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>会员修改</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
        <script src="../../js/jquery.js"></script>
    	<script type="text/javascript">
	        //检查密码
	        function CheckPwd() {
	            var reg = /^\w{6,20}$/;
	            if ($("#txtMemberPwd").val() == "") {
	                $("#spanPwd").html("<span style='color:red'>密码不输入代表不修改!</span>");
	                return true;
	            }
	            else if (reg.test($("#txtMemberPwd").val()) == false) {
	                $("#spanPwd").html("<span style='color:red'>密码必须6-20个字符,可由英文、数字和下划线组成!</span>");
	                return false;
	            }
	            else {
	                $("#spanPwd").html("");
	                return true;
	            }
	        }
	        //检查身份证号
	        function CheckCode() {
	            var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	            if ($("#txtCode").val() == "") {
	                $("#spanCode").html("<span style='color:red'>身份证号不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtCode").val()) == false) {
	                $("#spanCode").html("<span style='color:red'>身份证号格式不正确!</span>");
	                return false;
	            }
	            else {
	                $("#spanCode").html("");
	                return true;
	            }
	        }
	        //检查真实姓名
	        function CheckName() {
	            if ($("#txtRealName").val() == "") {
	                $("#spanRealName").html("<span style='color:red'>真实姓名不能为空!</span>");
	                return false;
	            }
	            else {
	                $("#spanRealName").html("");
	                return true;
	            }
	        }
	        //检查联系电话
	        function CheckPhone() {
	            var reg = /^(13|15|18)\d{9}$/;
	            if ($("#txtPhone").val() == "") {
	                $("#spanPhone").html("<span style='color:red'>联系电话不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtPhone").val()) == false) {
	                $("#spanPhone").html("<span style='color:red'>联系电话格式不正确!</span>");
	                return false;
	            }
	            else {
	                $("#spanPhone").html("");
	                return true;
	            }
	        }
	        //检查地址
	        function CheckAddress() {
	            if ($("#txtAddress").val() == "") {
	                $("#spanAddress").html("<span style='color:red'>地址不能为空!</span>");
	                return false;
	            }
	            else {
	                $("#spanAddress").html("");
	                return true;
	            }
	        }
	        //检查邮箱
	        function CheckMail() {
	            var reg = /^\w+@\w+.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/;
	            if ($("#txtMail").val() == "") {
	                $("#spanMail").html("<span style='color:red'>邮箱不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtMail").val()) == false) {
	                $("#spanMail").html("<span style='color:red'>邮箱格式不正确!</span>");
	                return false;
	            }
	            else {
	                $("#spanMail").html("");
	                return true;
	            }
	        }
	        $(function () {
	            $("#txtMemberPwd").blur(function () {
	                CheckPwd();
	            })
	            $("#txtCode").blur(function () {
	                CheckCode();
	            })
	            $("#txtRealName").blur(function () {
	                CheckName();
	            })
	            $("#txtPhone").blur(function () {
	                CheckPhone();
	            })
	            $("#txtAddress").blur(function () {
	                CheckAddress();
	            })
	            $("#txtMail").blur(function () {
	                CheckMail();
	            })
	            $("#lbtnReg").click(function () {
	                if (CheckPwd()  & CheckCode() & CheckName()
	                & CheckPhone() & CheckAddress() & CheckMail() )
	                    return true;
	                else
	                    return false;
	            })
                
	        })
		</script>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:800px; margin-top:0px;" class="MyTable">
            <tr class="titletr"><td colspan="2" style="text-align:center;">会员修改</td></tr>
            <tr>
                <td class="lefttd">用户名:</td>
                <td>
                    <span runat="server" id="spanAccount"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">密码:</td>
                <td>
                    <asp:TextBox ID="txtMemberPwd" TextMode="Password" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanPwd" style=" color:Red; margin-left:5px;">密码不输入代表不修改</span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">身份证号:</td>
                <td>
                    <asp:TextBox ID="txtCode" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanCode" style=" color:Red;"></span>
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
                <td class="lefttd">地址:</td>
                <td>
                    <asp:TextBox ID="txtAddress" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanAddress" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">联系邮箱:</td>
                <td>
                    <asp:TextBox ID="txtMail" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanMail" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">&nbsp;</td>
                <td>
                    <asp:Button ID="lbtnReg" ClientIDMode="Static" runat="server" Text="修改会员" OnClick="lbtnReg_Click" />
                </td>
            </tr>
       </table>	
    </form>
</body>
</html>
