<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Left.aspx.cs" Inherits="Demo.Admin.inc.Left" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="../css/css.css" rel="stylesheet" type="text/css" />
	    <script src="../../js/jquery.js" type="text/javascript"></script>
		<style type="text/css">
		.bigmenu {
			width: 170px;
			height: 30px;
			line-height: 30px;
			border: solid 1px #808080;
			border-width: 1px 0px 1px 0px;
			margin: 8px 0px 0px 4px;
			padding-left: 24px;
			background-image: url(../img/sub_sys.gif);
			background-repeat: no-repeat;
			background-position: left center;
		}
		.smallmenu {
			height: 26px;
			line-height: 26px;
			background-image: url(../img/folderclosed.gif);
			background-repeat: no-repeat;
			background-position: left center;
			padding-left: 20px;
			margin-left:20px;
			display:none;
		}
	
		a:link, a:hover, a:active, a:visited { color:#000000; text-decoration:none;}
		</style>
		<script type="text/javascript">
	    $(document).ready(function () {
	        $("#menu div").click(function () {
	            var parentId = $(this).attr("id");
	            var divmenus = $("#menu div");
	            for (var i = 0; i < divmenus.length; i++) {
	                if (divmenus[i].id.substr(0, parentId.length) == parentId) {
	                    if (divmenus[i].id.length > parentId.length + 3)
	                        $("#" + divmenus[i].id).hide();
	                    if (divmenus[i].id.length == parentId.length + 3)
	                        $("#" + divmenus[i].id).toggle(300);
	                }
	            }
	        })
	    })
		</script>
</head>
<body  style=" background:#c8f5ff; ">
    <form id="form1" runat="server">
         <div id="menu">

             <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                 <ItemTemplate>
                     <div id='menu<%# Eval("PowerId") %>' class="bigmenu">
                         <a href='<%# Eval("PowerPage") %>' target="right"><%# Eval("PowerName") %></a>
                     </div>
                     <asp:HiddenField ID="HiddenField1" Value='<%# Eval("PowerId") %>' runat="server" />
                     <asp:Repeater ID="Repeater2" runat="server">
                         <ItemTemplate>
                              <div id="menu<%# Eval("PowerId") %>" class="smallmenu">
                                <a href='<%# Eval("PowerPage") %>' target="right"><%# Eval("PowerName") %></a>
                              </div>
                         </ItemTemplate>
                     </asp:Repeater>
                 </ItemTemplate>
             </asp:Repeater>
        </div>
    </form>
</body>
</html>
