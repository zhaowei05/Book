<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="Demo.Admin.Member.MemberList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    	<link href="../css/css.css" rel="stylesheet" type="text/css" /><link href="../../reveal/reveal.css" rel="stylesheet" type="text/css" />   
    <script src="../../reveal/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="../../reveal/jquery.reveal.js" type="text/javascript"></script>
    <script src="../../js/jquery.js"></script>
    <link href="../../css/fayeysb.css" rel="stylesheet" />
    	<script type="text/javascript">
    	var no = 1;
    	var size = 5;
    	var membername = "";
    	$(function () {
    	    bindata();
    	    $("#gvMember").on("click", ".update", function () {
    	        var id = $(this).prop('id').split('_')[1];
    	        $("#EditFrame").attr("src", "MemberEdit.aspx?MemberId=" + id);
            })
            $("#gvMember").on("click", ".delete", function () {
                if (confirm("确定删除吗？"))
                {
                    var url = "../SopuRespe.aspx";
                    var start = { web: "Member", kou: "delete", MemberId: $(this).prop('id').split('_')[1] };
                    $.ajax({
                        url: url,
                        data: start,
                        type: 'post',
                        datatype: 'text',
                        success: function (dt) {
                            if(dt==1)
                                bindata();
                            else
                            alert('未知错误!');
                        }
                    })
                }
                else {
                    return;
                }
            })
            $("#btSearch").click(function () {
                membername = $("#txtAccount").val();
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
            str += '<tr class="titletr"><th scope="col">用户名</th><th scope="col">身份证号</th><th scope="col">真实姓名</th><th scope="col">联系电话</th><th scope="col">联系邮箱</th><th scope="col">操作</th></tr>';
            var url = "../SopuRespe.aspx";
            var start = { web: "Member", kou: "list", MemberName: membername, PageInt: no, PageSize: size };
            $.ajax({
                url: url,
                type: 'post',
                data: start,
                datatype: 'text',
                success: function (data) {
                    mgfkbin(data.split("||")[0]);
                    var json = $.parseJSON(data.split("||")[1]);
                    for (var i = 0; i < json.length; i++) {
                        str += "<tr>";
                        str += "<td>" + json[i].MemberAcc + "</td>";
                        str += "<td>" + json[i].MemberCode + "</td>";
                        str += "<td>" + json[i].MemberName + "</td>";
                        str += "<td>" + json[i].MemberPhone + "</td>";
                        str += "<td>" + json[i].MemberMail + "</td>";
                        str += "<td style='width:100px;'>";
                        str += "<a href='#' id='a_" + json[i].MemberId + "' class='update' data-reveal-id='EditModal' data-animation='none'>编辑</a>&nbsp;";
                        str += "<a href='#' id='del_" + json[i].MemberId + "' class='delete' >删除</a>";
                        str += "</td></tr>";
                    }
                    $("#gvMember").html(str);
                }
            })
        }
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
         <div style=" height:30px; line-height:30px; text-align:center;">
        用户名:<input name="txtAccount" type="text" id="txtAccount" />
        <input type="button" name="btSearch" value="搜索" id="btSearch" />
    </div>
    <div>
        <div>
			<table class="MyTable" cellspacing="0" rules="all" border="1" id="gvMember" style="width:98%;border-collapse:collapse;">
				
			</table>
		</div>
    </div>
        <div style="width:90%;display:inline-block;">
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
    <div id="EditModal" class="reveal-modal" style="width:800px; margin-left:-400px; height:360px;">
        <iframe src="" frameborder="0" width="800" height="360" id="EditFrame"></iframe>
	    <a class="close-reveal-modal">&#215;</a>
    </div>
    </form>
</body>
</html>
