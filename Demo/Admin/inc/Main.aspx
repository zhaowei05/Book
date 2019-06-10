<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Demo.Admin.inc.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>书城后台管理系统</title>
</head>
<frameset rows="67,*"  frameborder="no" >
	<frame src="Top.aspx" name="top" />
	<frameset cols="200,*">
	    <frame src="Left.aspx" name="left" />
	    <frame src="Center.aspx" name="right" />
	</frameset>
</frameset>
</html>
