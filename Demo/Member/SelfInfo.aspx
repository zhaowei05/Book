<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MemberPage.master" AutoEventWireup="true" CodeBehind="SelfInfo.aspx.cs" Inherits="Demo.Member.SelfInfo" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
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
	                $("#mailInfo").html("<span style='color:red'>联系电话不能为空!</span>");
	                return false;
	            }
	            else if (reg.test($("#txtMemberMail").val()) == false) {
	                $("#mailInfo").html("<span style='color:red'>联系电话格式不正确!</span>");
	                return false;
	            }
	            else {
	                $("#mailInfo").html("");
	                return true;
	            }
	        }
	        $(function () {
	            $("#txtMemberPhone").blur(function () {
	                CheckPhone();
	            })
	            $("#txtAddress").blur(function () {
	                CheckAddress();
	            })
	            $("#txtMemberMail").blur(function () {
	                CheckMail();
	            })
	            $("#lbtnUpdateInfo").click(function () {
	                if (CheckPhone() & CheckAddress() & CheckMail())
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
				    	修改个人基本信息
				    </div>
				    
				    <div id="SelfInfo">
        <table>
            <tr>
                <td class="infoLeftTd">书城账号:</td>
                <td class="infoCenterTd">
                    <span id="spanMemberAcc" runat="server"></span>
                </td>
                <td id="accInfo" class="infoRightTd">&nbsp;</td>

            </tr>
            <tr>
                <td class="infoLeftTd">身份证号:</td>
                <td class="infoCenterTd">
                    <span id="spanCode" runat="server"></span>
                </td>
                <td class="infoRightTd" id="codeInfo">&nbsp;</td>
            </tr>
            <tr>
                <td class="infoLeftTd">真实姓名:</td>
                <td class="infoCenterTd">
                    <span id="spanRealName" runat="server"></span>
                </td>
                <td class="infoRightTd" id="nameInfo">&nbsp;</td>
            </tr>
            <tr>
                <td class="infoLeftTd">联系电话:</td>
                <td class="infoCenterTd">
                    <asp:TextBox ID="txtMemberPhone" ClientIDMode="Static" CssClass="basicInfoInputText" runat="server"></asp:TextBox>
                </td>
                <td class="infoRightTd" id="phoneInfo"></td>
            </tr>
            <tr>
                <td class="infoLeftTd">地址:</td>
                <td class="infoCenterTd">
                    <asp:TextBox ID="txtAddress" ClientIDMode="Static" CssClass="basicInfoInputText" runat="server"></asp:TextBox>
                </td>
                <td class="infoRightTd" id="addressInfo"></td>
            </tr>
            <tr>
                <td class="infoLeftTd">邮箱:</td>
                <td class="infoCenterTd">
                    <asp:TextBox ID="txtMemberMail" ClientIDMode="Static" CssClass="basicInfoInputText" runat="server"></asp:TextBox>
                </td>
                <td class="infoRightTd" id="mailInfo"></td>
            </tr>
            <tr>
                <td class="infoLeftTd">&nbsp;</td>
                <td class="infoCenterTd">
                    <asp:LinkButton ID="lbtnUpdateInfo"  ClientIDMode="Static"  class="updateInfo" runat="server" OnClick="lbtnUpdateInfo_Click">修改信息</asp:LinkButton>
                </td>
                <td class="infoRightTd">&nbsp;</td>
            </tr>
        </table>        
    </div>
   
		        </div>
</asp:Content>
