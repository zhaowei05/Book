<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookOrderInfo.aspx.cs" Inherits="Demo.BookOrderInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    	    <link href="css/content.css" rel="stylesheet" type="text/css" />
	    <style type="text/css">
	        .errInfo{ font-size:16px; color:Red;}
	    </style>
		<script type="text/javascript">
		    //检查用户名
	
		    //检查真实姓名
		    function CheckName() {
		        if ($("#txtMemberName").val() == "") {
		            $("#nameInfo").html("<span style='color:red'>联系人姓名不能为空!</span>");
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
		        if ($("#txtPhone").val() == "") {
		            $("#phoneInfo").html("<span style='color:red'>联系电话不能为空!</span>");
		            return false;
		        }
		        else if (reg.test($("#txtPhone").val()) == false) {
		            $("#phoneInfo").html("<span style='color:red'>联系电话格式不正确!</span>");
		            return false;
		        }
		        else {
		            $("#phoneInfo").html("");
		            return true;
		        }
		    }
		    //检查收货地址
		    function CheckAddress() {
		        if ($("#txtAddress").val() == "") {
		            $("#addressInfo").html("<span style='color:red'>收货地址不能为空!</span>");
		            return false;
		        }
		        else {
		            $("#addressInfo").html("");
		            return true;
		        }
		    }
	
		    $(function () {
		        $("#txtMemberName").blur(function () {
		            CheckName();
		        })
		        $("#txtPhone").blur(function () {
		            CheckPhone();
		        })
		        $("#txtAddress").blur(function () {
		            CheckAddress();
		        })
	
		        $("#lbtOrderSubmit").click(function () {
		            if (CheckName() & CheckPhone() & CheckAddress())
		                return true;
		            else
		                return false;
		        })
		    })
		</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Mian" runat="server">
    <div>
            <div>
		<div id="orderContainer">
		    <h1 id="cartTitle" style="color:#ff2832">我的订单信息</h1>
		    <table border="0" cellpadding="0" cellspacing="0">
		        <tr>
		            <td class="orderLeftTd">
		                联系人：
		            </td>
		            <td class="orderCenterTd">
                        <asp:TextBox ID="txtMemberName"  ClientIDMode="Static" runat="server"></asp:TextBox>
		            </td>
		            <td class="orderRightTd">
		                <span id="nameInfo" class="errInfo"></span>
		            </td>
		        </tr>
		        <tr>
		            <td class="orderLeftTd">
		                联系电话：
		            </td>
		            <td class="orderCenterTd">
                        <asp:TextBox ID="txtPhone"  ClientIDMode="Static" runat="server"></asp:TextBox>
		            </td>
		            <td class="orderRightTd">
		                <span id="phoneInfo" class="errInfo"></span>
		            </td>
		        </tr>
		        <tr>
		            <td class="orderLeftTd">
		                收货地址：
		            </td>
		            <td class="orderCenterTd">
                        <asp:TextBox ID="txtAddress"  ClientIDMode="Static" runat="server"></asp:TextBox>
		            </td>
		            <td class="orderRightTd">
		                <span id="addressInfo" class="errInfo"></span>
		            </td>
		        </tr>
		        <tr>
		            <td class="orderLeftTd">
		                订单总金额：
		            </td>
		            <td class="orderCenterTd">
		                <span id="spanAllMoney" runat="server" style=" color:Red;"></span>
		            </td>
		            <td class="orderRightTd">
		                &nbsp;
		            </td>
		        </tr>
		        <tr>
		            <td class="orderLeftTd">
		                &nbsp;
		            </td>
		            <td class="orderCenterTd">
                        <asp:LinkButton ID="lbtOrderSubmit" class="orderButton" ClientIDMode="Static" runat="server" OnClick="lbtOrderSubmit_Click">提交订单，去支付</asp:LinkButton>
		            </td>
		            <td class="orderRightTd">
		                &nbsp;
		            </td>
		        </tr>
		    </table>
		</div>
    </div>
    </div>
</asp:Content>
