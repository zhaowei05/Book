<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="Demo.Reg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    	    <title>用户注册</title>
	    <link href="css/content.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			//检查用户名
	        function CheckAccount() {
	            var reg = /^\w{6,20}$/;
	            if ($("#txtMemberAcc").val() == "") {
	                $("#accInfo").html("<span style='color:red'>账号不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtMemberAcc").val()) == false) {
	                $("#accInfo").html("<span style='color:red'>账号必须6-20个字符,可由英文、数字和下划线组成!</span>");
	                return false;
	            }
	            else {
	                return <%=ViewState["lii"]%>;
	            }
	        }
	        //检查密码
	        function CheckPwd() {
	            var reg = /^\w{6,20}$/;
	            if ($("#txtMemberPwd").val() == "") {
	                $("#pwdInfo").html("<span style='color:red'>密码不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtMemberPwd").val()) == false) {
	                $("#pwdInfo").html("<span style='color:red'>密码必须6-20个字符,可由英文、数字和下划线组成!</span>");
	                return false;
	            }
	            else {
	                $("#pwdInfo").html("");
	                return true;
	            }
	        }
	        //检查密码确认
	        function CheckPwdConfirm() {
	            var reg = /^w{6,20}$/;
	            if ($("#txtConfirmPwd").val() == "") {
	                $("#pwdConfirmInfo").html("<span style='color:red'>密码确认不能为空!</span>");
	                return false;
	            }
	            else if ($("#txtMemberPwd").val() != $("#txtConfirmPwd").val()) {
	                $("#pwdConfirmInfo").html("<span style='color:red'>两次输入密码不一致!</span>");
	                return false;
	            }
	            else {
	                $("#pwdConfirmInfo").html("");
	                return true;
	            }
	        }
	        //检查身份证号
	        function CheckCode() {
	            var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	            if ($("#txtMemberCode").val() == "") {
	                $("#codeInfo").html("<span style='color:red'>身份证号不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtMemberCode").val()) == false) {
	                $("#codeInfo").html("<span style='color:red'>身份证号格式不正确!</span>");
	                return false;
	            }
	            else {
	                $("#codeInfo").html("");
	                return true;
	            }
	        }
	        //检查真实姓名
	        function CheckName() {
	            if ($("#txtMemberName").val() == "") {
	                $("#nameInfo").html("<span style='color:red'>真实姓名不能为空!</span>");
	                return false;
	            }
	            else {
	                $("#nameInfo").html("");
	                return true;
	            }
	        }
	        //检查联系电话
	        function CheckPhone() {
	            var reg = /^(13|15|18)\d{9}$/;
	            if ($("#txtMemberPhone").val() == "") {
	                $("#phoneInfo").html("<span style='color:red'>联系电话不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtMemberPhone").val()) == false) {
	                $("#phoneInfo").html("<span style='color:red'>联系电话格式不正确!</span>");
	                return false;
	            }
	            else {
	                $("#phoneInfo").html("");
	                return true;
	            }
	        }
	        //检查地址
	        function CheckAddress() {
	            if ($("#txtAddress").val() == "") {
	                $("#addressInfo").html("<span style='color:red'>地址不能为空!</span>");
	                return false;
	            }
	            else {
	                $("#addressInfo").html("");
	                return true;
	            }
	        }
	        //检查邮箱
	        function CheckMail() {
	            var reg = /^\w+@\w+.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/;
	            if ($("#txtMemberMail").val() == "") {
	                $("#mailInfo").html("<span style='color:red'>邮箱不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtMemberMail").val()) == false) {
	                $("#mailInfo").html("<span style='color:red'>邮箱格式不正确!</span>");
	                return false;
	            }
	            else {
	                $("#mailInfo").html("");
	                return true;
	            }
	        }
	        //检查服务条款是否同意
	        function CheckAgree() {
	            if ($("#ckAgree").prop("checked") == false) {
	                $("#agreeInfo").html("<span style='color:red'>必须同意服务条款才能注册</span>");
	                return false;
	            }
	            else {
	                $("#agreeInfo").html("<span style='color:red'></span>");
	                return true;
	            }
	        }
	
	        $(function () {
	            $("#txtMemberAcc").blur(function () {
	                CheckAccount();
	            })
	            $("#txtMemberPwd").blur(function () {
	                CheckPwd();
	            })
	            $("#txtConfirmPwd").blur(function () {
	                CheckPwdConfirm();
	            })
	            $("#txtMemberCode").blur(function () {
	                CheckCode();
	            })
	            $("#txtMemberName").blur(function () {
	                CheckName();
	            })
	            $("#txtMemberPhone").blur(function () {
	                CheckPhone();
	            })
	            $("#txtAddress").blur(function () {
	                CheckAddress();
	            })
	            $("#txtMemberMail").blur(function () {
	                CheckMail();
	            })
	            $("#lbtnReg").click(function () {
	                if (CheckAccount() & CheckPwd() & CheckPwdConfirm() & CheckCode() & CheckName()
	                & CheckPhone() & CheckAddress() & CheckMail() & CheckAgree())
	                    return true;
	                else
	                    return false;
	            })
	            $("#form1").submit(function () {
	                return false;
	            })
	        })
		</script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mian" runat="server">
      <div>
		<div id="regContainer">
		    <div id="regTitle">
		        <span class="myTitle">注册新用户</span>
		       &nbsp;贴心提示：请勿设置与邮箱密码相同的账户登录密码或支付密码，防止不法分子窃取您的书城账户信息
		    </div>
		    <div id="regContent">
		        <table>
		            <tr>
		                <td class="regLeftTd">书城账号:</td>
		                <td class="regCenterTd">
                            <asp:TextBox ID="txtMemberAcc" ClientIDMode="Static" CssClass="regInputText" runat="server" OnTextChanged="txtMemberAcc_TextChanged" AutoPostBack="True"></asp:TextBox>
		                </td>
		                <td id="accInfo" ClientIDMode="Static"  runat="server" class="regRightTd">账号必须6-20个字符,可由英文、数字和下划线组成</td>
		
		            </tr>
		            <tr>
		                <td class="regLeftTd">登录密码:</td>
		                <td class="regCenterTd">
                            <asp:TextBox ID="txtMemberPwd" CssClass="regInputText" ClientIDMode="Static" TextMode="Password" runat="server"></asp:TextBox>
		                </td>
		                <td class="regRightTd" id="pwdInfo">密码必须6-20个字符,可由英文、数字和符号组成</td>
		            </tr>
		            <tr>
		                <td class="regLeftTd">确认密码:</td>
		                <td class="regCenterTd">
                            <asp:TextBox ID="txtConfirmPwd" ClientIDMode="Static" CssClass="regInputText" TextMode="Password" runat="server"></asp:TextBox>
		                </td>
		                <td class="regRightTd" id="pwdConfirmInfo">确认密码必须和登录密码保持一致</td>
		            </tr>
		            <tr>
		                <td class="regLeftTd">身份证号:</td>
		                <td class="regCenterTd">
                            <asp:TextBox ID="txtMemberCode" ClientIDMode="Static" CssClass="regInputText"  runat="server"></asp:TextBox>
		                </td>
		                <td class="regRightTd" id="codeInfo"></td>
		            </tr>
		            <tr>
		                <td class="regLeftTd">真实姓名:</td>
		                <td class="regCenterTd">
                            <asp:TextBox ID="txtMemberName" ClientIDMode="Static" CssClass="regInputText"  runat="server"></asp:TextBox>
		                </td>
		                <td class="regRightTd" id="nameInfo"></td>
		            </tr>
		            <tr>
		                <td class="regLeftTd">联系电话:</td>
		                <td class="regCenterTd">
                              <asp:TextBox ID="txtMemberPhone" ClientIDMode="Static" CssClass="regInputText"  runat="server"></asp:TextBox>
		                </td>
		                <td class="regRightTd" id="phoneInfo"></td>
		            </tr>
		            <tr>
		                <td class="regLeftTd">地址:</td>
		                <td class="regCenterTd">
                            <asp:TextBox ID="txtAddress" ClientIDMode="Static" CssClass="regInputText"  runat="server"></asp:TextBox>
		                </td>
		                <td class="regRightTd" id="addressInfo"></td>
		            </tr>
		            <tr>
		                <td class="regLeftTd">邮箱:</td>
		                <td class="regCenterTd">
                            <asp:TextBox ID="txtMemberMail" ClientIDMode="Static" CssClass="regInputText"  runat="server"></asp:TextBox>
		                </td>
		                <td class="regRightTd" id="mailInfo"></td>
		            </tr>
		            <tr>
		                <td class="regLeftTd">&nbsp;</td>
		                <td class="regCenterTd">
                            <asp:CheckBox ID="ckAgree" ClientIDMode="Static" name="ctl00$ContentPlaceHolder1$ckAgree" runat="server" />
		                    <a href="#" target="_blank">我已经阅读并同意《服务条款》</a>
		                </td>
		                <td class="regRightTd" id="agreeInfo"></td>
		            </tr>
		            <tr>
		                <td class="regLeftTd">&nbsp;</td>
		                <td class="regCenterTd">
                            <asp:LinkButton ClientIDMode="Static" id="lbtnReg" CssClass="reg" runat="server" OnClick="lbtnReg_Click">立即注册</asp:LinkButton>
		                </td>
		                <td class="regRightTd">&nbsp;</td>
		            </tr>
		        </table>
		    </div>
		</div>

    </div>
</asp:Content>
