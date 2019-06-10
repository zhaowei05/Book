<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookTypeList.aspx.cs" Inherits="Demo.Admin.Book.BookTypeList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    	<title>图书类型列表</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<link href="../../reveal/reveal.css" rel="stylesheet" type="text/css" /> 
        <script src="../../reveal/jquery-1.4.4.min.js" type="text/javascript"></script>
    	<script src="../../reveal/jquery.reveal.js" type="text/javascript"></script>
        <script src="../../js/jquery.js"></script>
    	<script type="text/javascript">
    	 var strf = "";
    	 $(function () {
    	     prlibin();
    	     $("#frdiv").on('click', '.update', function () {
    	         var id = $(this).prop('id').split('_')[1];
    	         $("#EditFrame").attr("src", "BookTypeEdit.aspx?TypeId=" + id);
    	     });
    	     
    	     $("#frdiv").on('click', '.delete', function () {
    	         
    	         if (confirm("确定要删除吗"))
    	         {
    	             var url = "../SopuRespe.aspx";
    	             var start = { web: 'Book', kou: 'delete', TypeId: $(this).prop("id").split('_')[1] };
    	             $.ajax({
    	                 type: 'post',
    	                 url: url,
    	                 data: start,
    	                 dataType: 'text',
    	                 success: function (text) {
    	                     if (text == 1)
    	                         prlibin();
    	                     else
    	                         alert("未知错误！");
    	                 }
    	             })
    	         }
    	         else {
    	             return;
    	         }
    	     });
        })
    	 function prlibin() {
    	     $("#frdiv").html("");
            var url = "../../Myrespson.aspx";
            var start = { web: 'BookSearch', kou: 'binzije', TypeId: 0 };
            $.ajax({
                url: url,
                data: start,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        var str = "";
                        str += "<div style='height:30px; line-height:30px; border-bottom:solid 1px gray;'>";
                        str += "<div class='typeName'>" + data[i].TypeName + "</div>";
                        str += "<div class='typeOperate'>";
                        str += "<a href='#' id='a_" + data[i].TypeId + "' class='update' data-reveal-id='EditModal' data-animation='none'>编辑</a>&nbsp;";
                        str += "<a  class='delete' id='delect_" + data[i].TypeId + "' href='#'>删除</a>";
                        str += " </div></div>";
                        $("#frdiv").append(str);
                        boidd(data[i].TypeId);
                    }
                }
            })
        }

        function boidd(typeId)
        {
            var url = "../../Myrespson.aspx";
            var start = { web: 'BookSearch', kou: 'binzije', TypeId: typeId };
            $.ajax({
                async:false,
                url: url,
                data: start,
                type: 'post',
                dataType: 'json',
                success: function (dataj) {
                    var str = "";
                    for (var i = 0; i < dataj.length; i++) {
                        str += "<div style='height:30px;padding-left:30px; line-height:30px; border-bottom:dashed 1px gray;'>";
                        str += "<div class='typeName'>" + dataj[i].TypeName + "</div>";
                        str += "<div class='typeOperate'>";
                        str += "<a href='#' id='a_" + dataj[i].TypeId + "' class='update' data-reveal-id='EditModal' data-animation='none'>编辑</a>&nbsp;";
                        str += "<a  id='delect_" + dataj[i].TypeId + "' class='delete' href='#'>删除</a>";
                        str += " </div></div>";
                    }
                    $("#frdiv").append(str);
                }
            })
        }
        </script>
    <style type="text/css">
        .typeName{ width:80%; float:left;}
        .typeOperate{ width:20%; float:right; text-align:right;}
    </style>	
</head>
<body>
    <form id="form1" runat="server">
        <div class="divtitle" clientidmode="Static">图书类型管理</div>
        <div style=" margin:6px; height:30px; line-height:30px;">
            <a href="#" id="add_a" data-reveal-id="AddModal" data-animation="none">新增</a>&nbsp;
            <a href="#" onclick="prlibin()">刷 新</a>
        </div>
        <div style=" margin:6px;" id="frdiv">

        </div>
		<div id="AddModal" class="reveal-modal" style="width:800px; margin-left:-400px; height:320px;">
		    <iframe src="BookTypeAdd.aspx" frameborder="0" width="800" height="320"></iframe>
			<a class="close-reveal-modal">&#215;</a>
		</div>

		<div id="EditModal" class="reveal-modal" style="width:800px; margin-left:-400px; height:320px;">
		    <iframe src="" frameborder="0" width="800" height="320" id="EditFrame"></iframe>
			<a class="close-reveal-modal">&#215;</a>
		</div>		
    </form>
</body>
</html>
