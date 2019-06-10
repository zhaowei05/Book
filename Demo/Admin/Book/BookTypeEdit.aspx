<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookTypeEdit.aspx.cs" Inherits="Demo.Admin.Book.BookTypeEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/css.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
         var txtName =" <%=ViewState["txtName"]%>";
        var parentId = <%= ViewState["ParentId"]%>;
        var typeId=<%= ViewState["TypeId"]%>;    
        $(function () {
            bindata();
            $("#txtName").val(txtName);

            $("#btAdd").click(function () {
                var url="../SopuRespe.aspx";
                var start={web: 'Book', kou: 'update', ParentId: $("#ddlParent").val(), TypeName: $("#txtName").val(),TypeId:typeId };
                $.ajax({
                    type:'post',
                    url:url,
                    data:start,
                    datatype:'text',
                    success:function (isyesno) {
                        if(isyesno==1)
                        {
                            alert("修改成功");
                            window.parent.location.reload();
                        }
                        else 
                            alert("未知错误!");
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
                asycn:false,
                url: url,
                data: start,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    
                    if(parentId==0||parentId==undefined)
                        $("#ddlParent").append("<option selected='true' value='0'>顶级分类</option>");
                    else
                        $("#ddlParent").append("<option value='0'>顶级分类</option>");
                    for (var i = 0; i < data.length; i++) {
                        if(parentId==data[i].TypeId )
                            $("#ddlParent").append("<option selected='true' value=" + data[i].TypeId + ">" +( data[i].TypeName) + "</option>");
                        else
                            $("#ddlParent").append("<option value=" + data[i].TypeId + ">" +( data[i].TypeName) + "</option>");
                    }
                    //data[i].TypeId==0?"顶级分类":
                }
            })
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
          <table style="width:800px; margin-top:0px;" class="MyTable">
            <tr class="titletr"><td colspan="2" style="text-align:center;">图书类型修改</td></tr>
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
                    <input type="button" name="btAdd" value="修改类别" id="btAdd" />
                    
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
