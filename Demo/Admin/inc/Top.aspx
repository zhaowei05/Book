<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="Demo.Admin.inc.Top" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../css/css.css" />
	    <style type="text/css">
		    #top { height:67px;}
		    #topLogo {float:left; width:347px; height:67px; line-height:67px; margin-left:12px;  font-size:30px; font-weight:bold;}
		    #topMenu { float:right; margin-top:46px; margin-right:8px;}
		    a{ color:#185cb1; font-weight:bold; text-decoration:none;}
		    a:hover {color: #FFFFFF; font-weight:bold; text-decoration:none;}
	    </style>
</head>
<body style="background-image:url(../img/topbg.jpg);">
    <form id="form1" runat="server">
        <div id="top">
	        <div id="topLogo">书城后台管理系统</div>
	        <div id="topMenu">
                <asp:LinkButton ID="LinkButton2" target="_parent" runat="server" OnClick="LinkButton2_Click">返回前台</asp:LinkButton>
	            <a href="../Self/PwdEdit.aspx" target="right">修改密码</a>
                <asp:LinkButton ID="LinkButton1" target="_top" runat="server" OnClick="LinkButton1_Click">退出系统</asp:LinkButton>
	        </div>
        </div>
      </form>
</body>
</html>
