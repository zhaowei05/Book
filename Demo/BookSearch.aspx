<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookSearch.aspx.cs" Inherits="Demo.BookSearch" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/fayeysb.css" rel="stylesheet" />
    <title>图书搜索</title>
     <link href="css/content.css" rel="stylesheet" type="text/css" />
    <script>
        var no=1;
        var size = 24;
        var ye = 0;
        var count = 0;
        var typeId = 0;
        var parentId = 0;
        var bookName = "";
        $(function () {
            parentId = 0;
            $.ajaxSetup({
                async: false
            });
            typeId = getUrlParam('TypeId');
            bookName = getUrlParam('Key');
            babaid();
            bindata();
            //类别响应
            $("#searchType").on("click", ".dif_ad", function () {
                typeId = $(this).prop("id").split('_')[1];
                no = 1;
                babaid();
                bindata();
            })
            //条件去除
            $("#searchWhere").on("click", ".fota", function () {
                var st = $(this).prop("id").split('_')[0];
                if (st == 'typeId')
                    typeId = 0;
                if (st == 'parentId')
                    parentId = 0;
                if (st == 'bookName')
                    bookName = "";
                no = 1;
                bindata();
            })
            //搜索
            $("#btSearchf").click(function () {
                typeId = 0;
                bookName = $("#txtKey").val();
                if ($("#DropDownList1").val() == 0 && parentId!=0) {
                    parentId = 0;
                }
                else {
                    parentId = $("#DropDownList1").val(); 
                }
                no = 1;
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
        //请求父级
        function babaid()
        {
            $.post("Myrespson.aspx", { web: "BookSearch", kou: "babaid", TypeId: typeId }, function (data) {
                if (data.ParentId==0) {
                    parentId = typeId;
                }
                else {
                    parentId = data.ParentId;
                }
            }, 'json')
        }

        //数据绑定
        function bindata() {
            $.post("../Myrespson.aspx", { web: "BookSearch", kou: "Search", Pageint: no, Pagesize: size, TypeId: typeId, ParentId: parentId, BookName: bookName }, function (datajson) {
                mytjbin();
                lolokk();
                binsearch($.parseJSON(datajson.split('_')[1]));
                count = datajson.split('_')[0];
                mgfkbin(count);
            }, "text")

        }
        //条件绑定
        function mytjbin() {
            var str = "搜索条件:";
            if (parentId == 0 || parentId==undefined)
            {
                str += "<span  clss='' >全部<a href='#' class='fota' id='parentId_0' >×</a></span>";
            }
            $.post("Myrespson.aspx", { web: "BookSearch", kou: "babaid", TypeId: typeId }, function (data) {
                if (data.ParentId == 0) {
                    if (parentId != 0) {
                        str += "<span  clss='' >" + data.TypeName + "<a href='#' class='fota' id='parentId_" + data.TypeId + "' >×</a></span>";
                    }
                }
                else {
                    if (parentId != 0)
                    {
                        $.post("Myrespson.aspx", { web: "BookSearch", kou: "babaid", TypeId: parentId }, function (data) {
                            str += "<span  clss='' >" + data.TypeName + "<a href='#' id='parentId_" + data.TypeId + "' class='fota'  >×</a></span>";
                        }, 'json')
                    }
                    if (typeId != 0) {
                        $.post("Myrespson.aspx", { web: "BookSearch", kou: "babaid", TypeId: typeId }, function (data) {
                            str += "<span id='span_' clss='' >" + data.TypeName + "<a href='#' id='typeId_" + data.TypeId + "' class='fota'  >×</a></span>";
                        }, 'json')
                    }
                }
            }, 'json')
            
            if (bookName != "" && bookName!=null)
            {
                str += "<span  clss='' ><a>" + bookName + "</a><a href='#' class='fota'  id='bookName'>×</a></span>";
            }
            $("#searchWhere").html(str);
        }
        //书绑定
        function binsearch(datajson) {
            var str = "";
            str +="";
            for (var i = 0; i < datajson.length; i++) {
                str+="<div class='bookListItem'>";
                str+="<div class='bookListImg'><a href='BookDetail.aspx?BookId="+datajson[i].BookId+"'><img src='uploadfile/"+datajson[i].PicPath+"' width='150' height='180' /></a></div>";
                str+="<div class='bookListName'><a href='BookDetail.aspx?BookId="+datajson[i].BookId+"'>"+datajson[i].BookName+"</a></div>";
                str+="<div class='bookListPrice'><span style='margin-right:10px;'>¥:"+(datajson[i].BookPrice * datajson[i].BookDisCount).toFixed(2)+"</span><span style='text-decoration:line-through;'>¥:"+(datajson[i].BookPrice ).toFixed(2)+"</span></div>";
                str+="</div>";
            }
            $("#bookSearch").html(str);
        }
        //类别绑定
        function lolokk() {
            var cr=0;
            if (parentId != undefined)
                cr = parentId;
            var str = "";
            str += "<div style='font-weight:bold; text-align:left; background-color:#f3f3f3;'><span style=' margin-left:20px;'>类别:</span></div>";
            $.post("Myrespson.aspx", { web: "BookSearch", kou: "binzije", TypeId: cr }, function (data) {
                for (var i = 0; i < data.length; i++) {
                    str += "<div><a href='#' class='dif_ad' id='a_" + data[i].TypeId + "' >" + data[i].TypeName + "</a></div>";
                }
                $("#searchType").html(str);
            }, "json")
        }
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return decodeURIComponent(r[2]); return null; //返回参数值
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="searche" runat="server">
    <a id="btSearchf" href="#" style="display:block; width:100px; height:40px; line-height:40px; float:left; font-family:'Microsoft YaHei';font-size:16px; text-decoration:none; text-align:center; background-color:#ff2832; color:White;">搜 索</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mian" runat="server">
    <div id="clo">
        <div id="searchWhere"  runat="server" clientidmode="Static">
        </div>
        <div id='searchType'>
        </div>
        <div id='bookSearch'>
        </div>
    </div>
    <div style="width:80%;display:inline-block;">
        <div id="fyeuk">
            <span class="fol_a">
                <a href="javascript:void(0)" class="fol_a1"><<</a>
            </span>
            <div id="xyiz">

            </div>
            <span class="fol_a">
                <a href="javascript:void(0)" class="fol_a2">>></a>
            </span>
        </div>
    </div>
</asp:Content>
