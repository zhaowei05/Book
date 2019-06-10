<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookAddCart.aspx.cs" Inherits="Demo.BookAddCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>添加到购物车</title>
    	<link href="css/content.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mian" runat="server">
        <div>
	    <div id="divMyCartContainer">
	        <div id="divMyCart">
	            <h1 style="color:#ff2832">书籍已经成功添加至购物车</h1>
	            <table>
	                <tr>
	                    <td class="lefttd">
                            <asp:Image ID="ContentPlaceHolder1_imgBook" ClientIDMode="Static" runat="server" style="height:190px;width:160px;" />
	                    </td>
	                    <td class="centertd">
                            <asp:Label ID="lblTitle" ClientIDMode="Static" runat="server" Text=""></asp:Label>
                            <asp:Label ID="lblInfo" ClientIDMode="Static" runat="server" Text=""></asp:Label>
                        	<div id="lblPrice" style=" color:Red;" ClientIDMode="Static" runat="server"></div>
	                    </td>
	                    <td class="righttd">
                            <asp:LinkButton ID="LinkCaka" runat="server" OnClick="LinkCaka_Click">查看商品详情</asp:LinkButton>
                        	<a href="BookCart.aspx">去购物车结算</a>
	                    </td>
	                </tr>
	            </table>
	        </div>
	    </div>
    </div>
</asp:Content>
