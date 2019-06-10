<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MemberPage.master" AutoEventWireup="true" CodeBehind="SelfPwd.aspx.cs" Inherits="Demo.Member.SelfPwd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <script type="text/javascript">
	        //检查原始密码
	        function CheckOldPwd() {
	            var reg = /^\w{6,20}$/;
	            if ($("#txtOldPwd").val() == "") {
	                $("#pwdOldInfo").html("<span style='color:red'>原始密码不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtOldPwd").val()) == false) {
	                $("#pwdOldInfo").html("<span style='color:red'>密码必须6-20个字符,可由英文、数字和下划线组成!</span>");
	                return false;
	            }
	            else {
	                $("#pwdOldInfo").html("");
	                return true;
	            }
	        }
	        //检查新密码
	        function CheckNewPwd() {
	            var reg = /^\w{6,20}$/;
	            if ($("#txtNewPwd").val() == "") {
	                $("#pwdNewInfo").html("<span style='color:red'>新密码不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtNewPwd").val()) == false) {
	                $("#pwdNewInfo").html("<span style='color:red'>密码必须6-20个字符,可由英文、数字和下划线组成!</span>");
	                return false;
	            }
	            else {
	                $("#pwdNewInfo").html("");
	                return true;
	            }
	        }
	        //检查密码确认
	        function CheckConfirmPwd() {
	            var reg = /^w{6,20}$/;
	            if ($("#txtConfirmPwd").val() == "") {
	                $("#pwdConfirmInfo").html("<span style='color:red'>密码确认不能为空!</span>");
	                return false;
	            }
	            else if ($("#txtNewPwd").val() != $("#txtConfirmPwd").val()) {
	                $("#pwdConfirmInfo").html("<span style='color:red'>两次输入密码不一致!</span>");
	                return false;
	            }
	            else {
	                $("#pwdConfirmInfo").html("");
	                return true;
	            }
	        }
	
	        $(function () {
	            $("#txtOldPwd").blur(function () {
	                CheckOldPwd();
	            })
	            $("#txtNewPwd").blur(function () {
	                CheckNewPwd();
	            })
	            $("#txtConfirmPwd").blur(function () {
	                CheckConfirmPwd();
	            })
	            $("#lbtnUpdatePwd").click(function () {
	                if (CheckOldPwd() & CheckNewPwd() & CheckConfirmPwd())
	                    return true;
	                else
	                    return false;
	            })
	        })
	    </script>
    
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Right" runat="server">
     <div id="memRight">
				    <div class="rightTopTitle">
				    	修改密码
				    </div>
				    <div id="SelfPwd">
				        <table>
				            <tr>
				                <td class="pwdLeftTd">原始密码:</td>
				                <td class="pwdCenterTd">
                                    <asp:TextBox ID="txtOldPwd" ClientIDMode="Static" TextMode="Password" class="pwdInputText" runat="server"></asp:TextBox>
				                </td>
				                <td id="pwdOldInfo" class="pwdRightTd">密码必须6-20个字符,可由英文、数字和符号组成</td>
				
				            </tr>
				            <tr>
				                <td class="pwdLeftTd">新密码:</td>
				                <td class="pwdCenterTd">
                                    <asp:TextBox ID="txtNewPwd" ClientIDMode="Static" TextMode="Password" class="pwdInputText" runat="server"></asp:TextBox>
				                </td>
				                <td class="pwdRightTd" id="pwdNewInfo">&nbsp;</td>
				            </tr>
				            <tr>
				                <td class="pwdLeftTd">确认密码:</td>
				                <td class="pwdCenterTd">
                                    <asp:TextBox ID="txtConfirmPwd" ClientIDMode="Static" TextMode="Password" class="pwdInputText" runat="server"></asp:TextBox>
				                </td>
				                <td class="pwdRightTd" id="pwdConfirmInfo">&nbsp;</td>
				            </tr>            
				            <tr>
				                <td class="pwdLeftTd">&nbsp;</td>
				                <td class="pwdCenterTd">
                                    <asp:LinkButton ID="lbtnUpdatePwd" runat="server" ClientIDMode="Static" CssClass="updatePwd" OnClick="lbtnUpdatePwd_Click">修改密码</asp:LinkButton>
				                </td>
				                <td class="pwdRightTd">&nbsp;</td>
				            </tr>
        				</table>        
    				</div>
		        </div>    
</asp:Content>
