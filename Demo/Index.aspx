<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Demo.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>书城首页</title>
	    <link href="css/index.css" rel="stylesheet" type="text/css" />
	    <script src="js/slidr.js" type="text/javascript"></script>
		<script type="text/javascript">
		    $(function () {
		        //自动播放
		        slidr.create('adPPT', {
		            //after: function(e) { console.log('in: ' + e.in.slidr); }, //幻灯片转换结束后的回调函数
		            //before: function(e) { console.log('out: ' + e.out.slidr); }, //在幻灯片过渡开始之前的回调函数
		            breadcrumbs: true,  //显示或隐藏面包屑
		            controls: 'border',  //显示或隐藏控制箭头。‘边框’、‘拐角’或‘没有’(`border`, `corner` or `none`)
		            direction: 'horizontal', //新幻灯片的默认方向。“水平”或“垂直”(horizontal,vertical)
		            fade: false,  //幻灯片过渡是否应该淡入/淡出
		            keyboard: true, //是否启用鼠标键盘导航
		            overflow: false, //是否在SLLDR边界上溢出转换
		            pause: false, //在运行时是否暂停鼠标操作
		            theme: '#222', //设置面包屑/控件的颜色主题
		            timing: { 'cube': '0.5s ease-in' }, //自定义动画定时应用。{“过渡”：“计时”}。(`{'transition': 'timing'}`)
		            touch: true, //是否启用移动设备的触摸导航
		            transition: 'cube' //要应用的默认转换。“立方体”、“线性”、“渐变”或“无”。(`cube`, `linear`, `fade`, or `none`)
		        }).add('h', ['a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a1'])
				.auto(5000);
		    })
		</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mian" runat="server">
        <div>
		<div id="bodyBanner">
		    <div id="slaeTop">
            <asp:Repeater ID="RepeSellCount" runat="server">
                    <HeaderTemplate><div class="myTitle">销售排行</div></HeaderTemplate>
                    <ItemTemplate>
                        <div class="bookItem">

                            <div class="bookImg"><a href='BookDetail.aspx?BookId=<%#Eval("BookId")%>'><img src='uploadfile/<%# Eval("PicPath") %>' width="100" height="120" /></a></div>
                            <div class="bookTxt">
                                <div><a href='#'><%# Eval("BookName") %></a></div>
                                <div class="bookPrice" style='text-decoration:line-through;'>原价:<%# Eval("BookPrice").ToString().Split('.')[0] %>元
                                </div>
                                <div class="bookPrice">现价:<%# (decimal.Parse(Eval("BookPrice").ToString())*decimal.Parse(Eval("BookDisCount").ToString())).ToString("n")%></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
		    <div id="adPPT">
					<a href="#" data-slidr="a1"><img  src="img/adsense/bookad1.jpg"   /></a>
					<a href="#" data-slidr="a2"><img  src="img/adsense/bookad2.jpg"  /></a>
					<a href="#" data-slidr="a3"><img  src="img/adsense/bookad3.jpg" /></a>
					<a href="#" data-slidr="a4"><img  src="img/adsense/bookad4.jpg"  /></a>
					<a href="#" data-slidr="a5"><img  src="img/adsense/bookad5.jpg"  /></a>
		            <a href="#" data-slidr="a6"><img  src="img/adsense/bookad6.jpg"  /></a>
		            <a href="#" data-slidr="a7"><img  src="img/adsense/bookad7.jpg"  /></a>
		            <a href="#" data-slidr="a8"><img  src="img/adsense/bookad8.jpg"  /></a>
		    </div>
		    <div id="discountTop">
                <asp:Repeater ID="RepeBookDisCount" runat="server">
                    <HeaderTemplate><div class="myTitle">打折优惠</div></HeaderTemplate>
                    <ItemTemplate>
                        <div class="bookItem">
                            <div class="bookImg"><a href='BookDetail.aspx?BookId=<%#Eval("BookId") %>'><img src='uploadfile/<%#Eval("PicPath") %>    ' width="100" height="120" /></a></div>
                            <div class="bookTxt">
                                <div><a href='#'><%#Eval("BookName") %></a></div>
                                <div class="bookPrice" style='text-decoration:line-through;'>原价:<%# Eval("BookPrice").ToString().Split('.')[0] %>元
                                </div>
                                <div class="bookPrice">现价:<%# (decimal.Parse(Eval("BookPrice").ToString())*decimal.Parse(Eval("BookDisCount").ToString())).ToString("n")%></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
		    </div>
		</div>

		<div id="newBook">
		    <div id="newBookTitle" class="myTitle myBottomBorder">新书上架</div>
		    <div id="newBookList">
                <asp:Repeater ID="RepeBookId" runat="server">
                    <ItemTemplate>
                        <div class="bookListItem">
	                        <div class="bookListImg"><a href='BookDetail.aspx?BookId=<%#Eval("BookId")%>'><img src='uploadfile/<%# Eval("PicPath") %>' width="150" height="180" /></a></div>
	                        <div class="bookListName"><a href='#'><%# Eval("BookName") %></a></div>
	                        <div class="bookListPrice">
	                            <span style="margin-right:10px;">¥:<%# (decimal.Parse(Eval("BookPrice").ToString())*decimal.Parse(Eval("BookDisCount").ToString())).ToString("n")%></span><span style='text-decoration:line-through;'>¥:<%#Eval("BookPrice").ToString().Split('.')[0]%></span></div>
	                    </div>
                    </ItemTemplate>
                </asp:Repeater>
		    </div>
		</div>

		<div id="typeBook">
 			<div class="myTitle myBottomBorder typeBookTitle">计算机与互联网</div>
 			<div id="typeBookList">
                 <asp:Repeater ID="RepeFulew" runat="server">
                     <ItemTemplate>
                         <div class="bookListItem">
                            <div class="bookListImg"><a href='BookDetail.aspx?BookId=<%#Eval("BookId")%>'><img src='uploadfile/<%# Eval("PicPath") %>' width="150" height="180" /></a></div>
                            <div class="bookListName"><a href='#'><%# Eval("BookName") %></a></div>
                            <div class="bookListPrice">
                                <span style="margin-right:10px;">¥:<%# (decimal.Parse(Eval("BookPrice").ToString())*decimal.Parse(Eval("BookDisCount").ToString())).ToString("n")%></span><span style='text-decoration:line-through;'>¥:<%#Eval("BookPrice").ToString().Split('.')[0]%></span></div>
                        </div>
                     </ItemTemplate>
                 </asp:Repeater>
			</div>
 			<div class="myTitle myBottomBorder typeBookTitle">文学</div>
            <div id="typeBookList">
                <asp:Repeater ID="RepeWexue" runat="server">
                    <ItemTemplate>
                        <div class="bookListItem">
	                        <div class="bookListImg"><a href='BookDetail.aspx?BookId=<%#Eval("BookId")%>'><img src='uploadfile/<%# Eval("PicPath") %>' width="150" height="180" /></a></div>
	                        <div class="bookListName"><a href='#'><%# Eval("BookName") %> </a></div>
	                        <div class="bookListPrice">
	                            <span style="margin-right:10px;">¥:<%# (decimal.Parse(Eval("BookPrice").ToString())*decimal.Parse(Eval("BookDisCount").ToString())).ToString("n")%></span><span style='text-decoration:line-through;'>¥:<%#Eval("BookPrice").ToString().Split('.')[0]%></span></div>
	                    </div>
                    </ItemTemplate>
                </asp:Repeater>
			</div>
		</div>
    </div>
</asp:Content>
