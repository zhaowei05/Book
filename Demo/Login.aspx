<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Demo.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户登录</title>
	    <link href="css/content.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		    //检查用户名
		    function CheckAccount() {
		        var reg = /^\w{6,20}$/;
		        if ($("#txtMemberAcc").val() == "") {
		            $("#errInfo").append("<div style='color:red'>账号不能为空!</div>");
		            return false;
		        }
		        else if (reg.test($("#txtMemberAcc").val()) == false) {
		            $("#errInfo").append("<div style='color:red'>账号必须6-20个字符,可由英文、数字和下划线组成!</div>");
		            return false;
		        }
		        else {
		            $("#errInfo").append("");
		            return true;
		        }
		    }
	
		    //检查密码
		    function CheckPwd() {
		        var reg = /^\w{6,20}$/;
		        if ($("#txtMemberPwd").val() == "") {
		            $("#errInfo").append("<div style='color:red'>密码不能为空!</div>");
		            return false;
		        }
		        else if (reg.test($("#txtMemberPwd").val()) == false) {
		            $("#errInfo").append("<div style='color:red'>密码必须6-20个字符,可由英文、数字和下划线组成!</div>");
		            return false;
		        }
		        else {
		            $("#errInfo").append("");
		            return true;
		        }
		    }
	
		    $(function () {
		        $("#lbtnLogin").click(function () {
		            $("#errInfo").html("");
		            if (CheckAccount() & CheckPwd())
		                return true;
		            else
		                return false;
		        })
		    })
            
		</script>	    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mian" runat="server">
        <div>
		<div id="loginContainer">
		    <div id="loginLeft">
		        <div id="loginContent">
		            <div class="myTitle" style=" margin-left:30px; margin-top:50px;">用户登录</div>
		            <div>
		                <table>
		                    <tr>
		                        <td class="loginLeftTd">账号:</td>
		                        <td class="loginRightTd">
                                    <asp:TextBox ID="txtMemberAcc" ClientIDMode="Static"  runat="server" class="loginInputText" ></asp:TextBox>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="loginLeftTd">密码:</td>
		                        <td>
                                    <asp:TextBox ID="txtMemberPwd" ClientIDMode="Static" class="loginInputText"  runat="server"  TextMode="Password"></asp:TextBox>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="loginLeftTd"></td>
		                        <td>
                                    <asp:LinkButton ID="lbtnLogin" ClientIDMode="Static" class="login"  runat="server" OnClick="lbtnLogin_Click">登  录</asp:LinkButton>
		                        <a href="Reg.aspx" class="reg">立即注册</a>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="loginLeftTd"></td>
		                        <td id="errInfo" style=" line-height:20px; font-size:14px;"></td>
		                    </tr>
		                </table>
		            </div>
		        </div>
		    </div>
		    <div id="loginRight">
		        <img src="img/loginRight.jpg" />
		    </div>
		</div>
    </div>
</asp:Content>
