<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="Demo.Admin.Order.OrderDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单明细</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="divtitle" clientidmode="Static">订单明细</div>
	    <div>
		    <div>
				<table class="MyTable" cellspacing="0" rules="all" border="1" id="gvOrderDetail" style="width:98%;border-collapse:collapse;">
					<tr class="titletr">
						<th scope="col">图书名称</th><th scope="col">购买单价</th><th scope="col">购买数量</th>
					</tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
						        <td><%# Eval("BookInfo.BookName") %></td><td><%# decimal.Parse(Eval("BookSalePrice").ToString()).ToString("#0.00") %></td><td><%# Eval("BookSaleCount") %></td>
					        </tr>
                        </ItemTemplate>
                    </asp:Repeater>
				</table>
			</div>
	    </div>
    </form>
</body>
</html>
