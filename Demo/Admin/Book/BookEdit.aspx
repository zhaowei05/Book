<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookEdit.aspx.cs" Inherits="Demo.Admin.Book.BookEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    		<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css" />
	    <style type="text/css">
	        div{ overflow:visible;}
	        .lefttd{width:100px; text-align:right;}
	        .righttd{width:400px; }
	        .red{ color:Red;}
	    </style>
    	<script src="../../js/jquery.js" type="text/javascript"></script>
    	<script src="../../kindeditor/kindeditor-all.js" type="text/javascript"></script>
    	<script src="../../kindeditor/lang/zh-CN.js" type="text/javascript"></script>
    	<script src="../../js/jquery-ui.js" type="text/javascript"></script>
    	<script src="../../js/jquery.ui.datepicker-zh-CN.js" type="text/javascript"></script>
    
	    <script type="text/javascript">
            var typeId=<%=ViewState["TypeId"]%>;
	        var parentId=<%=ViewState["ParentId"]%>;
	        $(function () {
	            prlibin();

	            Twotbin();

	            $("#hdTwoType").val(typeId);

	            $("#ddlOneType").change(function () {
	                parentId=$(this).val();
	                Twotbin();
	            })
	            $("#LinkButton1").click(function () {
	                $(this).prop("href","../../uploadfile/"+$("#hdPicPath").val());
	            })
	            //检查图书类型
	            function CheckType() {
	                if ($("#ddlOneType").val() == 0 || $("#ddTwoType").val() == 0) {
	                    $("#spanType").html("请选择图书类型!");
	                    return false;
	                }
	                else {
	                    $("#spanType").html("");
	                    return true;
	                }
	            }
	            //检查条码
	            function CheckCode() {
	                if ($("#txtBookCode").val() == "") {
	                    $("#spanCode").html("请填写图书条码!");
	                    return false;
	                }
	                else if($("#txtBookCode").val().length > 13)
	                {
	                     $("#spanCode").html("条码长度不能超过13!");
	                    return false;               
	                }
	                else {
	                    $("#spanCode").html("");
	                    return true;
	                }
	            }
	            //检查图书名称
	            function CheckName() {
	                if ($("#txtBookName").val() == "") {
	                    $("#spanName").html("请填写图书名称!");
	                    return false;
	                }
	                else {
	                    $("#spanName").html("");
	                    return true;
	                }
	            } 
	            //检查图书作者
	            function CheckAuthor(){
	                 if ($("#txtBookAuthor").val() == "") {
	                    $("#spanAuthor").html("请填写图书作者!");
	                    return false;
	                }
	                else {
	                    $("#spanAuthor").html("");
	                    return true;
	                }       
	            }     
	            //检查图书价格
	            function CheckPrice(){
	                 if ($("#txtBookPrice").val() == "") {
	                    $("#spanPrice").html("请填写图书价格!");
	                    return false;
	                }
	                else if(isNaN($("#txtBookPrice").val()) == true){
	                     $("#spanPrice").html("图书价格必须是数字!");
	                    return false;               
	                }
	                else {
	                    $("#spanPrice").html("");
	                    return true;
	                }            
	            }
	            //检查图书折扣
	            function CheckDiscount(){
	                  if ($("#txtBookDisCount").val() == "") {
	                    $("#spanDiscount").html("请填写图书折扣!");
	                    return false;
	                }
	                else if(isNaN($("#txtBookDisCount").val()) == true){
	                     $("#spanDiscount").html("图书折扣必须是数字!");
	                    return false;               
	                }
	                else if(parseFloat($("#txtBookDisCount").val()) <=0 || parseFloat($("#txtBookDisCount").val()) > 1){
	                     $("#spanDiscount").html("图书折扣必须是0-1之间的小数!");
	                    return false;               
	                }
	                else {
	                    $("#spanDiscount").html("");
	                    return true;
	                }           
	            }
	            //检查出版社
	            function CheckPress(){
	                 if ($("#txtBookPress").val() == "") {
	                    $("#spanPress").html("请填写图书出版社!");
	                    return false;
	                }
	                else {
	                    $("#spanPress").html("");
	                    return true;
	                }           
	            }
	            //检查图书出版时间
	            function CheckPressTime(){
	                var reg = /^((19\d{2})|(20\d{2}))-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2]\d|3[0-1])$/;
	                var datenows = new Date();
	                if ($("#txtPressTime").val() == "") {
	                    $("#spanPressTime").html("请填写图书出版时间!");
	                    return false;
	                }
	                else if (reg.test($("#txtPressTime").val()) == false) {

	                    $("#spanPressTime").html("出版时间格式不正确!");
	                    return false;
	                }
	                else if (Math.ceil(datenows.getFullYear()) + Math.ceil(datenows.getMonth())+1 + Math.ceil(datenows.getDate()) < Math.ceil($("#txtPressTime").val().split('-')[0]) + Math.ceil($("#txtPressTime").val().split('-')[1]) + Math.ceil($("#txtPressTime").val().split('-')[2]))
	                {
	                        $("#spanPressTime").html("请选择过去!");
	                        return false;
	                }
	                else {
	                    $("#spanPressTime").html("");
	                    return true;
	                }           
	            }
	            //检查上传图片
	            function CheckUploadImg(){
	                  if ($("#hdPicPath").val() == "") {
	                    $("#spanUploadInfo").html("请选择图书的上传图片!");
	                    return false;
	                }
	                else {
	                    $("#spanUploadInfo").html("");
	                    return true;
	                }           
	            }
	            //检查图书介绍
	//            function CheckRemark(){
	//                  if ($("#txtBookRemark").val() == "") {
	//                    $("#spanRemark").html("请填写图书介绍!");
	//                    return false;
	//                }
	//                else {
	//                    $("#spanRemark").html("");
	//                    return true;
	//                }           
	//            }
	            //一级分类切换的时候重新绑定二级分类
	            //选择二级分类的时候给隐藏框赋值
	            $("#ddlTwoType").change(function(){
	                var typeId = $("#ddlTwoType").val();
	                $("#hdTwoType").val(typeId);
	            })
	
	            $("#btUpload").click(function () {
	                $("#form1").attr("target", "frameFile");
	            })
	            $("#btAdd").click(function () {
	                if (CheckType() & CheckCode() & CheckName() & CheckAuthor() & CheckPrice() & CheckDiscount() & CheckPress() & CheckUploadImg() & CheckPressTime()) {
	                    return true;
	                }
	                else {
	                    return false;
	                }
	            })

	            
	
	            //加载KindEditor编辑器
	            KindEditor.ready(function (k) {
	                KindEditor.options.filterMode = false; //关闭过滤模式，保留所有标签
	                window.editor = k.create('#txtBookRemark', {
	                    allowImageUpload: false,
	                    allowFlashUpload: false,
	                    allowMediaUpload: false,
	                    allowFileUpload: false
	                });           
	            })
	            //加载时间选择控件
				$("#txtPressTime").datepicker({inline: true,
						changeMonth:true, //显示选择月份的下拉列表
						changeYear:true,//显示选择年份的下拉列表
						showOtherMonths: true, //显示上月和下月空出来的日期
						selectOtherMonths: true, //可以显示上月和下月空出来的日期
						showWeek:false,//显示日期对应的星期
						//showButtonPanel:true,//显示"关闭"按钮面板
						//closeText:"关闭",//设置关闭按钮的文本
						yearRange:'1950:2020',//设置年份的范围
						dateFormat:'yy-mm-dd',//设置显示在文本框中的日期格式
						//showAnim:"slideDown"//设置显示或隐藏日期选择窗口的方式。可以设置的方式有："show"、"slideDown"、"fadeIn"
				});
	        })

	        function boiii() {
	            if (CheckType() & CheckCode() & CheckName() & CheckAuthor() & CheckPrice() & CheckDiscount() & CheckPress() &
                CheckPressTime() & CheckUploadImg()) {
	                $("#form1").attr("target", "_self");
	                return true;
	            }
	            else {
	                return false;
	            }
	        }

	        function prlibin() {
	            var url = "../../Myrespson.aspx";
	            var start = { web: 'BookSearch', kou: 'binzije', TypeId: 0 };
	            $.ajax({
	                url: url,
                    async:true,
	                data: start,
	                type: 'post',
	                dataType: 'json',
	                success: function (data) {
	                    $("#ddlOneType").html(tonyufa(data));
	                }
	            })
	        }

	        function Twotbin() {
	            $("#ddlTwoType").html("<option value='0'>--全部--</option>");
	            if ($("#ddlOneType").val() == 0)
	                return;
	            var url = "../../Myrespson.aspx";
	            var start = { web: 'BookSearch', kou: 'binzije', TypeId: parentId };
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

	        function tonyufa(datajson) {
	            var str = "<option value='0'>--全部--</option>";
	            for (var i = 0; i < datajson.length; i++) {
	                if(datajson[i].TypeId ==parentId)
	                {
	                    str += "<option selected='true' value='" + datajson[i].TypeId + "'>" + datajson[i].TypeName + "</option>";    
	                }
	                else{
	                    str += "<option value='" + datajson[i].TypeId + "'>" + datajson[i].TypeName + "</option>";    
	                }
	            }
	            return str;
	        }
	        function tonyu(datajson) {
	            var str = "<option value='0'>--全部--</option>";
	            for (var i = 0; i < datajson.length; i++) {
	                if(datajson[i].TypeId ==typeId)
	                {
	                    str += "<option selected='true' value='" + datajson[i].TypeId + "'>" + datajson[i].TypeName + "</option>";    
	                }
	                else{
	                    str += "<option value='" + datajson[i].TypeId + "'>" + datajson[i].TypeName + "</option>";  
	                }}
	            typeId=0;
	            parentId=0;
	            return str;
	        }
	    </script>
    
</head>
<body>
    <form id="form1" runat="server">
            <table style="width:1000px; margin-top:0px;" class="MyTable">
            <tr class="titletr"><td colspan="4" style="text-align:center;">图书添加</td></tr>
            <tr>
                <td class="lefttd">图书类型:</td>
                <td class="righttd">
                    <select name="ddlOneType" id="ddlOneType">
					</select>
                    <input type="hidden" name="hdOneType" id="hdOneType" />
                    <select name="ddlTwoType" id="ddlTwoType">

					</select>
                    <asp:HiddenField ID="hdTwoType" ClientIDMode="Static" runat="server" />
                    <span id="spanType" class="red"></span>
                </td>
                <td class="lefttd">条码:</td>
                <td class="righttd">
                    <asp:TextBox ID="txtBookCode" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanCode" class="red"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">图书名称:</td>
                <td class="righttd">
                    <asp:TextBox ID="txtBookName" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanName" class="red"></span>
                </td>
                <td class="lefttd">图书作者:</td>
                <td class="righttd">
                    <asp:TextBox ID="txtBookAuthor" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanAuthor" class="red"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">图书价格:</td>
                <td class="righttd">
                    <asp:TextBox ID="txtBookPrice" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanPrice" class="red"></span>
                </td>
                <td class="lefttd">图书折扣:</td>
                <td class="righttd">
                    <asp:TextBox ID="txtBookDisCount" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanDiscount" class="red"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">出版社:</td>
                <td class="righttd">
                    <asp:TextBox ID="txtBookPress" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanPress" class="red"></span>
                </td>
                <td class="lefttd">出版时间:</td>
                <td class="righttd">
                    <asp:TextBox ID="txtPressTime" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <span id="spanPressTime" class="red"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">图片:</td>
                <td colspan="3">
                    <asp:FileUpload ID="myFile" ClientIDMode="Static" runat="server" />
                    <asp:Button ID="btUpload" ClientIDMode="Static" runat="server" Text="上传" OnClick="btUpload_Click" />
                    <span id="spanUploadInfo" class="red" ClientIDMode="Static" runat="server" ></span>
                    <a href="#" target="_blank" ID="LinkButton1">查看</a>
                    <asp:HiddenField ID="hdPicPath" ClientIDMode="Static" runat="server" />         
                </td>
            </tr>
            <tr>
                <td class="lefttd">图书介绍:</td>
                <td colspan="3">
                    <asp:TextBox style="height:400px;width:100%;" TextMode="MultiLine" rows="2" cols="20" ID="txtBookRemark" ClientIDMode="Static" runat="server"></asp:TextBox>
                    <br />
                    <span id="spanRemark" class="red"></span>
                </td>
            </tr>
            <tr>
                <td class="lefttd">&nbsp;</td>
                <td colspan="3">
                    <asp:Button ID="btAdd" ClientIDMode="static" runat="server" Text="保 存" OnClick="btAdd_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
