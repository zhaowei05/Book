<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookCart.aspx.cs" Inherits="Demo.BookCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>购物车</title>
        <script src="js/jquery.js"></script>
    <link href="css/content.css" rel="stylesheet" />

	    <script type="text/javascript">
	        var iop = 1;
	        $(function () {

	            $.post("Myrespson.aspx", { web: "BookCart", kou: "list" },function (datajson) {
	                mybindata(datajson)
	            }, "json")
	            $("#cartTable").on("click", ".delete", function () {
	                var id = $(this).prop("id").split('_')[1];
	                $.post("Myrespson.aspx", { web: "BookCart", kou: "Delete", CartId:id }, function (datajson) {
	                    mybindata(datajson)
	                }, "json")
	            })
	            $("#cartTable").on("click", ".a1", function () {
	                var id = $(this).prop("id").split('_')[1];
	                var count = $(this).siblings("input").val();
	                if (count == 1)
	                    return;
	                count = Math.ceil(count) - 1;
	                $.post("Myrespson.aspx", { web: "BookCart", kou: "Updatesz", CartId: id, BookCount: count }, function (datajson) {
	                    mybindata(datajson)
	                }, "json")
	            })
	            $("#cartTable").on("click", ".a2", function () {
	                var id = $(this).prop("id").split('_')[1];
	                var count = $(this).siblings("input").val();
	                count = Math.ceil(count)+1;
	                $.post("Myrespson.aspx", { web: "BookCart", kou: "Updatesz", CartId: id, BookCount: count }, function (datajson) {
	                    mybindata(datajson)
	                }, "json")
	            })
	            $("#cartTable").on("change", ".txt", function () {
	                var id = $(this).prev("a").prop("id").split('_')[1];
	                var count = $(this).val();
	                $.post("Myrespson.aspx", { web: "BookCart", kou: "Updatesz", CartId: id, BookCount: count }, function (datajson) {
	                    mybindata(datajson)
	                }, "json")
	            })
	            $("#cartTable").on("change", ".chboxs", function () {
	                var id = $(this).prop("id").split('_')[1];
	                $.post("Myrespson.aspx", { web: "BookCart", kou: "Updatexz", CartId: id }, function (datajson) {
	                    mybindata(datajson);
	                }, "json")
	            })
	            $("#cartTable").on("change", "#chbox", function () {
	                var qz = $(this).prop("checked");
	                iop = iop==1?0:1;
	                $.post("Myrespson.aspx", { web: "BookCart", kou: "Updatss", qxz: qz }, function (datajson) {
	                    mybindata(datajson);
	                },'json')
	            })
	        })
	        function mybindata(datajson) {
	            $("#cartTable").html("");
	            var zonje = 0;
	            var strht = '<tr style=" background-color:#ff2832;"><td width="200" class="cartTableTh"><input type="checkbox" id="chbox"  ';
	            strht += iop == 0 ? "" : "checked";
	            strht += '/></td> <td width="200" class="cartTableTh">图片</td><td width="500" class="cartTableTh">名称</td><td width="100" class="cartTableTh">单价</td><td width="200" class="cartTableTh">数量</td><td width="100" class="cartTableTh">小计</td><td width="100" class="cartTableTh">操作</td></tr>';
	            for (var i = 0; i < datajson.length; i++) {
	                strht += "<tr><td width='200' class='cartTableTh'><input id='che_" + datajson[i].CartId + "' class='chboxs' type='checkbox'";
	                strht += datajson[i].IsSelect == 0 ? '' : 'checked' ;
	                strht += "/></td><td width='200' style='height: 180px; text-align: center;'><a href='bookDetail.aspx?BookId=" + datajson[i].BookId + "' target='_blank'><img src='uploadfile/" + datajson[i].BookInfo.PicPath + "' width='130' height='180' alt='' style='margin: 10px;' /></a></td>";
	                
	                strht += "<td width='500'><a href='bookDetail.aspx?BookId=" + datajson[i].BookId + "' target='_blank'>" + datajson[i].BookInfo.BookName + "</a></td>";
	                strht += "<td width='100' style='text-align: center; color: Red;'>" + (datajson[i].BookInfo.BookPrice * datajson[i].BookInfo.BookDisCount).toFixed(2) + "元</td>";
	                
	                strht += "<td width='200'><a id='jia_" + datajson[i].CartId + "' style='margin-left:25%' href='javascript:void(0)' class='a1'>-</a><input type='text' class='txt'   value='" + datajson[i].BookCount + "'/><a id='je_" + datajson[i].CartId + "' href='javascript:void(0)'  class='a2'>+</a></td>";
	                strht += "<td width='100' style='text-align: center; color: Red;'>" + ((datajson[i].BookInfo.BookPrice * datajson[i].BookInfo.BookDisCount) * datajson[i].BookCount).toFixed(2) + "元</td>";
	                strht += "<td width='100' style='text-align: center;'> <a id='a_" + datajson[i].CartId + "' class='delete' href='javascript:void(0)'>删除</a></td></tr>";
	                if (datajson[i].IsSelect==1) {
	                    zonje = zonje + ((datajson[i].BookInfo.BookPrice * datajson[i].BookInfo.BookDisCount) * datajson[i].BookCount);
	                }
	                
	            }
	            $("#ccss").html("</table><div style=' color:Red; font-weight:bold; height:auto; overflow:hidden; margin: 10px 0px;'><div style='width:120px; float:left; height:40px; line-height:40px; font-size:18px; '>总计:<span id='spanSumMoney'>" + zonje.toFixed(2) + "</span></div><a id='lbtPay' href='BookOrderInfo.aspx'>去结算</a><span id='spanErr' style='height:40px; line-height:40px; font-size:18px; margin-left:20px; color:Red; '></span></div>");
	            $("#cartTable").append(strht);
	            $.parser.parse("#cartContainer");
	        }
	    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mian" runat="server">
        <div>
		<div id="cartContainer">
		    <h1 style="color:#ff2832" id="cartTitle">我的购物车</h1>
            <table id="cartTable" width="1200" border="0"></table>
            <div id="ccss">
                
            </div>
		</div>
    </div>
</asp:Content>
