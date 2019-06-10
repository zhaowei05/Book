--初始化之前需要清空的表数据
truncate table MyPower

--一级权限
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('999','0','系统管理','系统管理','javascript:void(0);')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('998','0','个人中心','个人中心','javascript:void(0);')

insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('001','0','会员管理','会员管理','/Admin/Member/MemberList.aspx')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('002','0','商品管理','商品管理','javascript:void(0);')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('003','0','订单管理','订单管理','/Admin/Order/OrderList.aspx')

--二级权限--系统管理
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('999001','999','角色管理','角色管理','/Admin/Role/RoleList.aspx')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('999002','999','用户管理','用户管理','/Admin/User/UserList.aspx')
--二级权限--个人中心
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('998001','998','基本信息','基本信息','/Admin/Self/InfoEdit.aspx')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('998002','998','密码维护','密码维护','/Admin/Self/PwdEdit.aspx')

--二级权限--商品管理
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('002001','002','商品类型管理','商品类型管理','/Admin/Book/BookTypeList.aspx')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('002002','002','商品信息管理','商品信息管理','/Admin/Book/BookList.aspx')





