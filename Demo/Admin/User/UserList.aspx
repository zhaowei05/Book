<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Demo.Admin.User.UserList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户管理</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<link href="../../reveal/reveal.css" rel="stylesheet" type="text/css" />
    
    	<script src="../../reveal/jquery-1.4.4.min.js" type="text/javascript"></script>
    	<script src="../../reveal/jquery.reveal.js" type="text/javascript"></script>
     <link href="../../css/fayeysb.css" rel="stylesheet" />
	    <script type="text/javascript">
	        var no = 1;
	        var size = 5;
	        var name = "";
	        var account = "";
	        $(function () {
	            bindata();
	            $("#btSearch").click(function () {
	                name = $("#txtRealName").val();
	                account = $("#txtAccount").val();
	                bindata();
	            })
	            $(".update").live("click", function () {
	                var id = $(this).attr("id").split('_')[1];
	                $("#EditFrame").attr("src", "UserEdit.aspx?UserId="+id);
	            })
	            $(".delete").live("click", function () {
	                if (!confirm('确定删除？'))
	                    return;
	                var id = $(this).attr("id").split('_')[1];
	                var url = "../SopuRespe.aspx";
	                var start = { web: "User", kou: "delete", UserId: id };
	                $.ajax({
	                    url: url,
	                    data: start,
	                    type: 'post',
	                    datatype: 'text',
	                    success: function (dt) {
	                        if(dt==1)
	                            alert('删除成功')
	                        else
                                alert("未知错误")
	                    }
	                })
	                bindata();
	            })
	            //下上按钮响应
	            $(".fol_a>a").click(function () {
	                //下一页
	                if ($(this).html() == "&gt;&gt;") {
	                    if (ye == no)
	                        return;
	                    no = Math.ceil(no) + 1;
	                }
	                //上一页
	                if ($(this).html() == "&lt;&lt;") {
	                    if (no == 1)
	                        return;
	                    no = Math.ceil(no) - 1;
	                }
	                //重新绑定
	                bindata();
	            })
	            //数字选择按钮响应
	            $("#xyiz").on("click", "a", function () {
	                var hh = $(this).html();
	                if (no == hh)
	                    return;
	                no = hh;
	                //重新绑定
	                bindata();
	            })
	        })
	        function bindata() {
	            var str = "";
	            var url = "../SopuRespe.aspx";
	            var start = { web: "User", kou: "list", UserAccount: account, UserRealName: name, PageInt: no, PageSize: size };
	            $.ajax({
	                url: url,
	                data: start,
	                type: 'post',
	                datatype: 'text',
	                success: function (dt) {
	                    var count = dt.split("||")[0];
	                    mgfkbin(count);
	                    var datajosn =$.parseJSON( dt.split("||")[1]);
	                    str += '<tr class="titletr"><th scope="col">用户名</th><th scope="col">真实姓名</th><th scope="col">角色名称</th><th scope="col">联系电话</th><th scope="col">操作</th></tr>';
	                    for (var i = 0; i < datajosn.length; i++) {
	                        str += "<tr><td>" + datajosn[i].UserAccount + "</td>";
	                        str += "<td>" + datajosn[i].UserRealName + "</td>";
	                        str += "<td>" + datajosn[i].Role.RoleName+ "</td>";
	                        str += "<td>" + datajosn[i].UserPhone + "</td>";
	                        str += "<td style='width:100px;'>";
	                        str += "<a href='#' class='update' id='a_" + datajosn[i].UserId + "' class='update' data-reveal-id='EditModal' data-animation='none'>编辑</a>&nbsp;";
	                        str += "<a href='UserPower.aspx?UserId=" + datajosn[i].UserId + "'>权限</a>&nbsp;";
	                        str += "<a  class='delete' id='delete_" + datajosn[i].UserId + "' href='#'>删除</a> ";
	                        str += "</tr>";
	                    }
	                    $(".MyTable").html(str);
	                }
	            })
	        }

	        //分页数据刷新绑定
	        function mgfkbin(count) {
	            ye = Math.ceil(count / size);
	            $("#xyiz").html("");
	            var str = "";
	            if (no < 7) {
	                var fot = Math.ceil(no) + 4;
	                fot == ye - 1 ? fot = fot + 1 : fot;
	                fot >= ye ? fot = ye : fot;
	                for (var i = 1; i <= fot; i++) {
	                    if (i == no)
	                        str += "<a href='javascript:void(0)' class='bia'>" + i + "</a>";
	                    else
	                        str += "<a href='javascript:void(0)' class='bia2'>" + i + "</a>";
	                }
	                if (fot + 1 < ye) {
	                    str += "<a class='bia2'>...</a>";
	                    str += "<a href='javascript:void(0)' class='bia2'>" + ye + "</a>";
	                }
	            }
	            else if (no >= ye - 5) {
	                var kos = Math.ceil(no) - 4;
	                var fot = Math.ceil(no) + 4;
	                fot == ye - 1 ? fot = fot + 1 : fot;
	                fot >= ye ? fot = ye : fot;
	                if (kos - 1 >= 1) {
	                    str += "<a href='javascript:void(0)' class='bia2'>" + 1 + "</a>";
	                    str += "<a class='bia2'>...</a>";
	                }
	                for (var i = kos; i <= fot; i++) {
	                    if (i == no)
	                        str += "<a href='javascript:void(0)' class='bia'>" + i + "</a>";
	                    else
	                        str += "<a href='javascript:void(0)' class='bia2'>" + i + "</a>";
	                }
	            }
	            else {
	                var kos = Math.ceil(no) - 4;
	                var fot = Math.ceil(no) + 4;
	                str += "<a href='javascript:void(0)' class='bia2'>" + 1 + "</a>";
	                str += "<a class='bia2'>...</a>";
	                for (var i = kos; i <= fot; i++) {
	                    if (i == no)
	                        str += "<a href='javascript:void(0)' class='bia'>" + i + "</a>";
	                    else
	                        str += "<a href='javascript:void(0)' class='bia2'>" + i + "</a>";
	                }
	                str += "<a class='bia2'>...</a>";
	                str += "<a href='javascript:void(0)' class='bia2'>" + ye + "</a>";
	            }
	            $("#xyiz").html(str);
	        }

        </script>

</head>
<body>
    <form id="form1" runat="server">
         <div  style=" height:30px; line-height:30px; text-align:center;">
		用户名:<input name="txtAccount" type="text" id="txtAccount" />
        真实姓名:<input name="txtRealName" type="text" id="txtRealName" />
        <input type="button" name="btSearch" value="搜索" id="btSearch" />
        <a href="#" data-reveal-id="AddModal" data-animation="none">新增</a>
    </div>
	<div>
		<table class="MyTable" cellspacing="0" rules="all" border="1" id="gvUser" style="width:98%;border-collapse:collapse;">
		</table>
	</div>
        <div style="width:80%;display:inline-block;">
                <span id="fyeuk">
                    <span class="fol_a">
                        <a href="javascript:void(0)" class="fol_a1"><<</a>
                    </span>
                    <div id="xyiz">

                    </div>
                    <span class="fol_a">
                        <a href="javascript:void(0)" class="fol_a2">>></a>
                    </span>
                </span>
            </div>
        <div id="AddModal" class="reveal-modal" style="width:800px; margin-left:-400px; height:320px;">
	    <iframe src="UserAdd.aspx" frameborder="0" width="800" height="320"></iframe>
		<a class="close-reveal-modal">&#215;</a>
	</div>
	<div id="EditModal" class="reveal-modal" style="width:800px; margin-left:-400px; height:320px;">
	    <iframe src="" frameborder="0" width="800" height="320" id="EditFrame"></iframe>
		<a class="close-reveal-modal">&#215;</a>
	</div>
    </form>
</body>
</html>
