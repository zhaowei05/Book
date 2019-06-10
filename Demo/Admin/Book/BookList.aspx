<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="Demo.Admin.Book.BookList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../../js/jquery.js"></script>
    <link href="../css/css.css" rel="stylesheet" />
    <link href="../../css/fayeysb.css" rel="stylesheet" />
    <script>
        var no = 1;
        var size = 10;
        var typeId = 0;
        var parentId = 0;
        var bookName = "";
        $(function () {
            
            prlibin();
            Twotbin();
            bindata();
            $("#ddlOneType").change(function () {
                Twotbin();
            })
            $("#btSearch").click(function () {
                typeId = $("#ddlTwoType").val();
                parentId = $("#ddlOneType").val();
                bookName = $("#txtName").val();
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
            //删除
            $(".MyTable").on('click', '.avr', function () {
                var cr = confirm("确定要删除吗?");
                if(cr==true)
                {
                    var url = "../../Myrespson.aspx";
                    var start = { web: 'BookSearch', kou: 'delete', BookId: $(this).prop('id').split('_')[1] };
                    $.ajax({
                        type: 'post',
                        url: url,
                        data: start,
                        dataType: 'text',
                        success: function (dt) {
                            if (dt == 1)
                                bindata();
                            else
                                alert("未知错误！");
                        }
                    });
                }
                else
                    return;
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
            function bindata() {
                var str = "<tr class='titletr'><th scope='col'>类型</th><th scope='col'>条码</th><th scope='col'>书名</th><th scope='col'>价格</th><th scope='col'>折扣</th><th scope='col'>销售数量</th><th scope='col'>操作</th></tr>";
                var url = "../../Myrespson.aspx";
                var start = { web: 'BookSearch', kou: 'Search', TypeId: typeId, ParentId: parentId, BookName: bookName, Pageint: no, Pagesize: size };
                $.ajax({
                    url: url,
                    async:true,
                    data: start,
                    type: 'post',
                    dataType: 'text',
                    success: function (datajson) {
                        mgfkbin(datajson.split('_')[0]);
                        var data = $.parseJSON( datajson.split('_')[1]);
                        for (var i = 0; i < data.length; i++) {
                            str += "<tr>";
                            str += "<td>" + data[i].BookType.TypeName + "</td><td>" + data[i].BookCode + "</td>";
                            str += "<td>" + data[i].BookName + "</td><td>" + data[i].BookPrice + "</td>";
                            str += "<td>" + data[i].BookDisCount + "</td><td>" + data[i].SellCount + "</td>";
                            str += "<td style='width:100px;'><a href='BookEdit.aspx?BookId=" + data[i].BookId + "'>编辑</a>&nbsp;&nbsp;&nbsp;<a class='avr' href='javascript:void(0)' id='a_" + data[i].BookId + "'>删除</a>  </td>";
                            str += "</tr>";
                        }
                        
                        $(".MyTable").html(str);
                    }
                });
            }
        })
        

        function prlibin() {
            var url = "../../Myrespson.aspx";
            var start={web:'BookSearch',kou:'binzije',TypeId:0};
            $.ajax({
                url: url,
                data: start,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $("#ddlOneType").html(tonyu(data));
                }
            })
        }

        function Twotbin() {
            $("#ddlTwoType").html("<option value='0'>--全部--</option>");
            if ($("#ddlOneType").val() == 0)
                return;
            var url = "../../Myrespson.aspx";
            var start = { web: 'BookSearch', kou: 'binzije', TypeId: $("#ddlOneType").val() };
            $.ajax({
                url: url,
                data: start,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $("#ddlTwoType").html(tonyu(data));
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

        function tonyu(datajson)
        {
            var str = "<option value='0'>--全部--</option>";
            for (var i = 0; i < datajson.length; i++) {
                str += "<option value='" + datajson[i].TypeId + "'>" + datajson[i].TypeName + "</option>";
            }
            return str;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style=" height:30px; line-height:30px; text-align:center;">
    	类别：<select name="ddlOneType" id="ddlOneType">
    	</select>
        <select name="ddlTwoType" id="ddlTwoType">
		</select>
    	书名：
        <input name="txtName" type="text" id="txtName" />
        <input type="button" name="btSearch" value="搜索" id="btSearch" />
        <a href="BookAdd.aspx">添加</a>
        <input type="hidden" name="hdOneType" id="hdOneType" value="0" />
        <input type="hidden" name="hdTwoType" id="hdTwoType" value="0" />
    </div>
        <div>
            <table class="MyTable" cellspacing="0" rules="all" border="1" id="gvBook" style="width:98%;border-collapse:collapse;">
            </table>
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
        </div>
        
    </form>
</body>
</html>
