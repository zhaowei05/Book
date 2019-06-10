<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleList.aspx.cs" Inherits="Demo.Admin.Role.RoleList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>角色管理</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<link href="../../reveal/reveal.css" rel="stylesheet" type="text/css" />
	    <script src="../../reveal/jquery-1.4.4.min.js" type="text/javascript"></script>
	    <script src="../../reveal/jquery.reveal.js" type="text/javascript"></script>
	    <script type="text/javascript">
	        $(function () {
	            $(".update").click(function () {
	                $("#EditFrame").attr("src", "RoleEdit.aspx?RoleId=" + $(this).siblings('input').val());
	            })           
	        })
	    </script>		
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
        .auto-style2 {
            width: 100px;
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        		<div>
			<div style=" width:99%; height:30px; line-height:30px; text-align:right">
			    <a href="#" data-reveal-id="AddModal" data-animation="none">新增</a>
			</div>
			<div>
				<table class="MyTable" cellspacing="0" rules="all" border="1" id="gvRole" style="width:98%;border-collapse:collapse;">
					<tr class="titletr">
						<th scope="col">角色名称</th><th scope="col">角色描述</th><th scope="col">操作</th>
                    </tr>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tr>
						            <td><%# Eval("RoleName") %></td><td><%# Eval("RoleRemark") %></td><td style="width:100px;">
                                        <asp:LinkButton CssClass="update"  ClientIDMode="Static"  CommandName="update" runat="server" data-reveal-id="EditModal" data-animation="none">编辑</asp:LinkButton>
			                                    <a href='RolePower.aspx?RoleId=<%# Eval("RoleId") %>'>权限</a>
                                        <asp:LinkButton OnClientClick="return confirm('确定要删除吗？');" ID="gvRole_LinkButton1_0" CommandName="delete" runat="server">删除</asp:LinkButton> 
                                        <asp:HiddenField ID="HiddenField1" Value='<%# Eval("RoleId") %>' runat="server" />
			                                </td>
					            </tr>
                            </ItemTemplate>
                        </asp:Repeater>
				</table>
			</div>
		</div>
		<div id="AddModal" class="reveal-modal" style="width:800px; margin-left:-400px; height:320px;">
		    <iframe src="RoleAdd.aspx" frameborder="0" width="800" height="320"></iframe>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		<div id="EditModal" class="reveal-modal" style="width:800px; margin-left:-400px; height:320px;">
		    <iframe src="" frameborder="0" width="800" height="320" id="EditFrame"></iframe>
			<a class="close-reveal-modal">&#215;</a>
		</div>
    </form>
</body>
</html>
