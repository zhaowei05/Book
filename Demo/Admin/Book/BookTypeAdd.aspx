<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookTypeAdd.aspx.cs" Inherits="Demo.Admin.Book.BookTypeAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书类型添加</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.js"></script>
    <script>
        $(function () {
            bindata();

            $("#btAdd").click(function () {
                if (!istxtName())
                    return;
                var url = "../SopuRespe.aspx";
                var start = { web: 'Book', kou: 'Add', ParentId: $("#ddlParent").val(), TypeName: $("#txtName").val() };
                $.ajax({
                    url: url,
                    data:start,
                    type: 'post',
                    datatype: 'text',
                    success: function (istext) {
                        if (istext == 1)
                        {
                            alert("添加成功！");
                            window.parent.location.reload();
                        }  
                        else 
                            alert("未知错误！");
                    }
                })
            })
        })
        function istxtName() {
            if ($("#txtName").val() == '')
            {
                $("#spanName").html("分类名称不能为空!");
                return false;
            }
            else {
                $("#spanName").html("");
                return true;
            }
        }
        function bindata()
        {
            var url = "../../Myrespson.aspx";
            var start = { web: 'BookSearch', kou: 'binzije', TypeId: 0 };
            $.ajax({
                url: url,
                data: start,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $("#ddlParent").append("<option value='0'>顶级分类</option>");
                    for (var i = 0; i < data.length; i++) {
                        $("#ddlParent").append("<option value=" + data[i].TypeId + ">" + data[i].TypeName + "</option>");
                    }
                    
                }
            })
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <table style="width:800px; margin-top:0px;" class="MyTable">
            <tr class="titletr"><td colspan="2" style="text-align:center;">图书类型添加</td></tr>
            <tr>
                <td class="lefttd">父级分类:</td>
                <td>
                    <select name="ddlParent" id="ddlParent">
					</select>
                </td>
            </tr>
            <tr>
                <td class="lefttd">分类名称:</td>
                <td>
                    <input name="txtName" type="text" id="txtName" />
                    <span id="spanName" style=" color:Red;"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">&nbsp;</td>
                <td>
                    <input type="button" name="btAdd" value="新增类别" id="btAdd" />
                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
