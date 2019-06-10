<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MemberPage.master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="Demo.Member.OrderList" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        #fyeuk {
            height: 20px;
            margin: 10px auto;
            text-align: center;
            position: relative;
            display: inline-block;
            left: 50%;
        }

        .clear {
            clear: both;
        }

        #fyeuk > div {
            height: 20px;
            float: left;
        }

        #xyiz {
            text-align: center;
            margin-left: 42px;
            margin-right: 42px;
        }

        .fol_a2 {
            position: absolute;
            left: 93%;
            top: 0px;
            display: block;
            height: 100%;
            width: 30px;
            text-decoration: none;
            border: solid 1px #1f80d8;
            text-align: center;
            line-height: 20px;
            border-radius: 4px;
        }

        .fol_a1 {
            position: absolute;
            right: 93%;
            display: block;
            height: 100%;
            width: 30px;
            text-decoration: none;
            border: solid 1px #1f80d8;
            text-align: center;
            line-height: 20px;
            border-radius: 4px;
        }

        #xyiz > a {
            display: block;
            float: left;
            width: auto;
            margin-left: 3px;
            margin-right: 3px;
            text-align: center;
            line-height: 20px;
        }

        .bia {
            text-decoration: underline;
            color: #000000;
        }

        .bia2 {
            text-decoration: none;
        }
    </style>
    <script>
        $(function () {
            var no = 1;
            var size = 4;
            var OrderId = 0;
            var count = 0;
            bindata();
            
            $("#memOrder").on("click", ".asc", function () {
                var url = "../Myrespson.aspx";
                var order=$(this).prop('id').split("_")[1];
                var start = { web: "OrderList", kou: "Delete", OrderId: order };
                $.ajax({
                    type: "post",
                    url: url,
                    data: start,
                    dataType: "text",
                    success: function (soin) {
                        if (soin == 1)
                            bindata();
                        else
                            alert("未知错误！");
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

            function bindata() {
                var start = { web: "OrderList", kou: "listOr", Pageint: no, Pagesize: size };
                $.ajax({
                    type:"post",
                    url: "../Myrespson.aspx",
                    data: start,
                    dataType:"text",
                    success: function (dttext) {
                        count = dttext.split("(fan_ker)")[0];
                        mgfkbin(count);
                        var dt = $.parseJSON(dttext.split("(fan_ker)")[1]);
                        var str = "";
                        for (var i = 0; i < dt.length; i++) {
                            var ind = dt[i].MyOrder.OrderStatus;
                            var cor = ind == 1 ? '新订单' : ind == 2 ? '发货中' : ind == 3 ? '等待收货' : ind == 4 ? '已收货' : ""
                            if (ind != 5)
                            {
                                str += "<div class='orderItem'>";
                                if (OrderId != dt[i].OrderId) {
                                    str += "<div class='orderTitle'><ul>";
                                    str += "<li class='orderTime'>" + dt[i].MyOrder.OrderTime + "</li>";
                                    str += "<li class='OrderCode'>订单号:" + dt[i].MyOrder.OrderCode + "</li>";
                                    str += "<li class='OrderStatus'>订单状态:" + cor + "</li>";
                                    str += "<li>订单总金额:" + dt[i].MyOrder.OrderAllMoney.toFixed(2) + "</li>";
                                    if (ind == 4)
                                    {
                                        str += "<li class='orderDelete' style=' width:160px;  text-align:right; '><a href='javascript:void(0)' class='asc' id='a_" + dt[i].OrderId + "' >删除</a></li>";
                                    }
                                    str += "</ul></div>";
                                    OrderId = dt[i].OrderId;
                                }

                                str += "<div class='detailItem'>";
                                str += "<div class='detailImg'><img src='../uploadfile/" + dt[i].BookInfo.PicPath + "' /></div>";
                                str += "<div class='detailBookName'><div>" + dt[i].BookInfo.BookName + "</div></div>";
                                str += "<div class='detailCount'><div>数量：" + dt[i].BookSaleCount + "</div></div>";
                                str += "<div class='detailOnePrice'><div>销售单价：" + dt[i].BookSalePrice + "</div></div>";
                                str += "<div class='detailAllPrice'><div>总价：" + (dt[i].BookSaleCount * dt[i].BookSalePrice).toFixed(2) + "</div></div>";
                                str += "<div class='detailBuy'><div><a href='/BookDetail.aspx?bookId=" + dt[i].BookId + "' target='_blank'>再次购买</a></div></div>";
                                str += " </div>";
                                str += "</div>";
                            }
                            
                        }
                        $("#memOrder").html(str);
                    }
                })
                
            }
            //数据刷新绑定
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
        })

    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Right" runat="server">
     <div id="memRight">
					<div class="rightTopTitle">
			    订单中心
			</div>
         <div id="memOrder">

         </div>
             <div style="width:80%;display:inline-block;">
                 <div id="fyeuk">
            <div class="fol_a">
                <a href="javascript:void(0)" class="fol_a1"><<</a>
            </div>
            <div id="xyiz">

            </div>
            <div class="fol_a">
                <a href="javascript:void(0)" class="fol_a2">>></a>
            </div>
        </div>
             </div>

</asp:Content>
