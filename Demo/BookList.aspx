<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="Demo.BookList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><%=ViewState["BookList"] %></title>
    <link href="css/content.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mian" runat="server">
    <div>
    	<div id="bookList">
             <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="bookListItem">
                        <div class="bookListImg"><a href='BookDetail.aspx?BookId=<%# Eval("BookId") %>'><img src='uploadfile/<%# Eval("PicPath") %>' width="150" height="180" /></a></div>
                        <div class="bookListName"><a href='BookDetail.aspx?BookId=<%# Eval("BookId") %>'><%# Eval("BookName") %></a></div>
                        <div class="bookListPrice">
                            <span style="margin-right:10px;">
                                ¥:<%# (decimal.Parse( Eval("BookPrice").ToString())*decimal.Parse( Eval("BookDisCount").ToString())).ToString("n") %></span><span style='text-decoration:line-through;'>¥:<%# Eval("BookPrice").ToString().Split('.')[0] %></span></div>			
			        </div>
                </ItemTemplate>
            </asp:Repeater>
		</div>
    </div>
</asp:Content>
