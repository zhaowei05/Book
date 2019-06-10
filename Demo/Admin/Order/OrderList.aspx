<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="Demo.Admin.Order.OrderList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单查询</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
    <script src="../../js/jquery.ui.datepicker-zh-CN.js" type="text/javascript"></script>
    <link href="../../css/fayeysb.css" rel="stylesheet" />
       <script type="text/javascript">
           var no = 1;
           var size = 5;
           var startdate ="";
           var enddate = "";
           var dtct = 0;
           $(function () {
               bindata();
	            //加载时间选择控件
				$("#txtStart").datepicker({inline: true,
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
	//            if($("#txtStart").val() == "")
	//                $("#txtStart").datepicker('setDate',new Date(new Date().getFullYear(),new Date().getMonth(),1));
	
				$("#txtEnd").datepicker({inline: true,
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
	//            if($("#txtEnd").val() == "")
               //                $("#txtEnd").datepicker('setDate',new Date());  

				$("#btSearch").click(function () {
				    startdate = $("#txtStart").val();
				    enddate = $("#txtEnd").val();
				    if ($("#txtEnd").val()!="") {
				        enddate += " 23:59:59";
				    }
				    dtct = $("#ddlStatus").val();
				    bindata();
				})

				$("#gvOrder").on("click", ".delete", function () {
				    if (confirm("确定删除吗？"))
				    {
				        var id = $(this).prop("id").split("_")[1];
				        var url = "../SopuRespe.aspx";
				        var start = { web: 'Order', kou: 'delete', OrderId: id };
				        $.ajax({
				            url: url,
				            data: start,
				            type: 'post',
				            datatype: 'text',
				            success: function (da) {
				                if (da == 1)
				                    bindata();
				                else
				                    alert("未知错误！")
				            }
				        })
				    }
				    
				})
				$("#gvOrder").on("click", ".update", function () {
				    var id = $(this).prop("id").split("_")[1];
				    var url = "../SopuRespe.aspx";
				    var start = { web: 'Order', kou: 'update', OrderId: id };
				    $.ajax({
				        url: url,
				        data: start,
				        type: 'post',
				        datatype: 'text',
				        success: function (da) {
				            if (da == 1)
				                bindata();
				            else
				                alert("未知错误！")
				        }
				    })
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
	            var start = { web: 'Order', kou: 'list', startdate: startdate, enddate: enddate, OrderStatus: dtct, PageInt: no, Pagesize: size };
	            $.ajax({
	                url: url,
	                data: start,
	                type: 'post',
	                datatype: 'text',
	                success: function (data) {
	                    mgfkbin(data.split('||')[0]);
	                    var datajson = $.parseJSON(data.split('||')[1]);
	                    str += '<tr class="titletr"><th scope="col">订单号</th><th scope="col">会员</th><th scope="col">总金额</th><th scope="col">收货人</th><th scope="col">联系电话</th><th scope="col">收货地址</th><th scope="col">订单时间</th><th scope="col">订单状态</th><th scope="col">操作</th></tr>';
	                    for (var i = 0; i < datajson.length; i++) {
	                        var isk = datajson[i].OrderStatus;
	                        var nou = isk == 1 ? "新订单" : isk == 2 ? "发货中" : isk == 3 ? "等待收货" : isk == 4 ? "已收货" : isk == 5 ? "用户删除" : "数据错误";
	                        str += "<tr>";
	                        str += "<td>" + datajson[i].OrderCode + "</td>";
	                        str += "<td>" + datajson[i].Member.MemberAcc + "</td>";
	                        str += "<td>" + datajson[i].OrderAllMoney + "</td>";
	                        str += "<td>" + datajson[i].OrderPeople + "</td>";
	                        str += "<td>" + datajson[i].OrderPhone + "</td>";
	                        str += "<td>" + datajson[i].OrderAddress + "</td>";
	                        str += "<td>" + datajson[i].OrderTime + "</td>";
	                        str += "<td>" + nou + "</td>";
	                        str += "<td style='width:160px;'>";
	                        str += "<a href='OrderDetail.aspx?OrderId=" + datajson[i].OrderId + "'>订单明细</a>&nbsp;";
	                        str += "<a id='update_" + datajson[i].OrderId + "' class='update' href='#'>订单状态</a>&nbsp";
	                        str += "<a  id='delete_" + datajson[i].OrderId + "' class='delete' href='#'>删除</a>";
	                        str += " </td></tr>";
	                    }
	                    $("#gvOrder").html(str);
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
        	开始时间:<input name="txtStart" type="text" value="" id="txtStart" />
        	结束时间:<input name="txtEnd" type="text" value="" id="txtEnd" />
        	订单状态:<select name="ddlStatus" id="ddlStatus">
						<option selected="selected" value="0">所有订单</option>
						<option value="1">新订单</option>
						<option value="2">发货中</option>
						<option value="3">等待收货</option>
						<option value="4">已收货</option>
						<option value="5">用户删除</option>
				</select>
        <input type="button" name="btSearch" value="搜  索" id="btSearch" />
    	</div>
        <div>
			<table class="MyTable" cellspacing="0" rules="all" border="1" id="gvOrder" style="width:98%;border-collapse:collapse;">
				
			</table>
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
    </form>
</body>
</html>
