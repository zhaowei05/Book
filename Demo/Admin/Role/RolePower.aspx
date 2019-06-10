<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RolePower.aspx.cs" Inherits="Demo.Admin.Role.RolePower" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>角色权限</title>
        <link href="../css/css.css" rel="stylesheet" type="text/css" />
        <script src="../../js/jquery.js" type="text/javascript"></script>
	    <script type="text/javascript">
	        $(function () {
	            var RolePowerList = '<%=ViewState["RolePowerList"]%>';
	            $("#HiddenField1").val(RolePowerList);
	            var arrPower = RolePowerList.split(",");
	            for (var i = 0; i < arrPower.length; i++) {
	                //$("#ck_" + i).attr("checked", "true");
	                $("#ck_" + arrPower[i]).prop("checked", "true");
	            }	
	            $("input[name=ckPower]").change(function () {
	                var objs = $("input[name=ckPower]");
	                var selfId = this.id.split("_")[1]; //取出自己ID的数字部分
	                for (var i = 0; i < objs.length; i++) {
	                    var objId = objs[i].id.split("_")[1]; //取出循环过程中每个多选框的数字部分
	                    //选择的是上一级，且切换所有的下级                  
	                    if (selfId.length < objId.length && selfId == objId.substr(0, selfId.length)) //判断是否是下级
	                    {
	                        objs[i].checked = this.checked;
	                    }
	                }
	                //选择的是下级，并且选择的是checked=true，则将上级也变成true
	                if (selfId.length > 3 && this.checked == true) {
	                    $("#ck_" + selfId.substr(0, selfId.length - 3)).prop("checked", "true");
	                }
	                //选择的是下级,并且选择的是checked=false,并且同级别所有都为false,则将上级checked也变成false
	                if (selfId.length > 3 && this.checked == false) {
	                    var rchecked = false;  //假设父级默认没有选中
	                    for (var i = 0; i < objs.length; i++) {
	                        var objId = objs[i].id.split("_")[1];
	                        if (selfId.length = objId.length && selfId.substr(0, selfId.length - 3) == objId.substr(0, objId.length - 3)) {
	                            if (objs[i].checked == true)
	                                rchecked = true;
	                        }
	                    }
	                    $("#ck_" + selfId.substr(0, selfId.length - 3)).prop("checked", rchecked); //低版本jq，使用attr
	                }
	            })

	            $("input[name=ckPower]").change(function () {
	                var kou = $("input[name=ckPower]");
	                var objId = "";
	                for (var i = 0; i < kou.length; i++) {
	                    if (kou[i].checked == true) {
	                        if (objId != "")
	                            objId += ",";
	                        objId += kou[i].id.split("_")[1];
	                    }
	                }
	                $("#HiddenField1").val(objId);
	            })
	        })
	        
	    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPowerTitle" class="divtitle">权限配置-<asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>
        <div>
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <div style="height:30px; line-height:30px;">
                        <input type="checkbox" id='ck_<%# Eval("PowerId") %>' value='<%# Eval("PowerId") %>' name="ckPower" />
                        <span style=" font-weight:bold;"><%# Eval("PowerName") %></span>
                        <asp:HiddenField ID="HiddenField2" Value='<%# Eval("PowerId") %>' runat="server" />
                    </div>
                    <div style=" clear:both;">
                    <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                    <div style=" width:150px; float:left; display:block; height:30px; line-height:30px">
                                         <input type="checkbox" id='ck_<%# Eval("PowerId") %>' value='<%# Eval("PowerId") %>' name="ckPower" />
                                        <%# Eval("PowerName") %>                          
                                    </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                    <hr />
                </ItemTemplate>
            </asp:Repeater>
            <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" Value="" runat="server" />
            <asp:Button ID="btUpdatePower" runat="server" Text="确定" ClientIDMode="Static" OnClick="btUpdatePower_Click" />
            <a href="RoleList.aspx">返 回</a>
    </form>
</body>
</html>
