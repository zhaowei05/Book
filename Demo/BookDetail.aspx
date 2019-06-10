<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookDetail.aspx.cs" Inherits="Demo.BookDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>图书详情</title>
	    <link href="css/content.css" rel="stylesheet" type="text/css" />
	    <script type="text/javascript">
	        $(function () {
	            $("#a1").click(function () {
	                if (isNaN($("#txtCount").val())) {
	                    $("#txtCount").val("1");
	                    return;
	                }
	                var count = parseInt($("#txtCount").val()) - 1;
	                if (count < 1)
	                    return;
	                $("#txtCount").val(count);
	            })
	            $("#a2").click(function () {
	                if (isNaN($("#txtCount").val())) {
	                    $("#txtCount").val("1");
	                    return;
	                }
	                var count = parseInt($("#txtCount").val()) + 1;
	                $("#txtCount").val(count);
	            })
	            $("#lbtaddCart").click(function () {
	                var usr = "<%=Session["usr"]%>";
	                if (usr == "") {
	                    alert('请登录');
	                    window.location.href = '/Login.aspx?myurl=' + 'BookAddCart.aspx?BookId=<%=ViewState["Bookid"]%>&Count=' + $('#txtCount').val();
	                }
	                else {
	                    window.location.href = 'BookAddCart.aspx?BookId=<%=ViewState["Bookid"]%>&Count=' + $('#txtCount').val();
	                }
	            })
	        })        
	    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mian" runat="server">
    
    <div>
		<div id="DetailContainer">
		    <div style=" height:auto; overflow:hidden;">
		        <div id="divBookImg">
                    <asp:Image ID="Image1" runat="server"  style="height:360px;width:300px;" />
		        </div>
				<div id="divBasic"> 
		            <div id="divBookName">书名：<asp:Label ID="lblname" runat="server" Text="Label"></asp:Label></div>
		            <div id="divOldPrice"><span style='text-decoration:line-through;'>原价：<asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>元</span></div>
		            <div id="divNewPrice">现价：<asp:Label ID="lblDis" runat="server" Text="Label"></asp:Label></div>
		            <div id="divAuthor">作者：<asp:Label ID="lblAuthor" runat="server" Text="Label"></asp:Label></div>
		            <div id="divPress">出版社：<asp:Label ID="lblPress" runat="server" Text="Label"></asp:Label></div>
		            <div id="divCartAdd">
		                <a id="a1" href="javascript:void(0);">-</a>
		                <input name="ctl00$ContentPlaceHolder1$txtCount" type="text" value="1" id="txtCount" />
		                <a id="a2" href="javascript:void(0);">+</a>
                        <a id="lbtaddCart" href="#">加入购物车</a>
		            </div>
		       </div>
		    </div>
		    <div class="myTitle myBottomBorder">图书详情</div>
		    <div id="divRemark" runat="server">
                <asp:Label ID="lblRemark" runat="server" Text="Label"></asp:Label>
		    </div>
		</div>
    </div>

</asp:Content>
