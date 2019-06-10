
--系统权限
select * from MyPower


--系统角色
select * from MyRole


--系统用户
select * from MyUser
select *from(
select ROW_NUMBER()over(order by UserId) rowid,MyUser.*,MyRole.RoleName,MyRole.RolePowerList from MyUser left join MyRole on MyUser.RoleId=MyRole.RoleId  where 1=1) Tamp where rowid between 1 and 5

select *from(
select ROW_NUMBER()over(order by UserId) rowid,* from MyUser) Tamp where rowid between (1-1)*(5-1) and 1*5

delete from MyUser  where UserId=1
Update MyUser set RoleId=1

select count(*) from MyUser where 1=1


--图书类型
select * from BookType


--图书信息
select * from BookInfo where BookName like '%M%' and TypeId=3

select * from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId where 1=1 and BookType.ParentId=1 and BookType.TypeId=

select * from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId  where 1=1 and BookName like'%程%' and BookName like '%C%'

select BookInfo.*,BookType.TypeName,BookType.ParentId from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId 

insert into BookInfo(TypeId,BookCode,BookName,BookPrice,BookDisCount,BookAuthor,BookPress,PressTime,PicPath,SellCount,BookRemark) values(@TypeId,@BookCode,@BookName,@BookPrice,@BookDisCount,@BookAuthor,@BookPress,@PressTime,@PicPath,@SellCount,@BookRemark)

select *from(
select ROW_NUMBER()over(order by BookId ) rowid,BookInfo.*,BookType.TypeName,BookType.ParentId from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId   where 1=1 and PressTime between '2000-01-01' and '2011-01-01'  ) Tamp where rowid between (1-1)*5+1 and 1*5 

--会员
select * from Member
insert into Member(MemberAcc,MemberPwd,MemberCode,MemberName,MemberPhone,MemberAddress,MemberMail,MemberAddTime) values(@MemberAcc,@MemberPwd,@MemberCode,@MemberName,@MemberPhone,@MemberAddress,@MemberMail,GETDATE())

--订单
select * from MyOrder

select * from MyOrder where OrderTime between '' and ''

select MyOrder.*,Member.MemberAcc from MyOrder left join Member on Member.MemberId=MyOrder.MemberId

select * from MyOrder where MemberId=1 order by OrderStatus

update MyOrder set OrderStatus=4 where OrderId=3 

insert into MyOrder(OrderCode,MemberId,OrderPeople,OrderPhone,OrderAddress,OrderAllMoney,OrderStatus.OrderTime)
values(@OrderCode, @MemberId,@OrderPeople,@OrderPhone, @OrderAddress,@OrderAllMoney,@OrderStatus, GETDATE())
--订单明细
select * from OrderDetail

select * from(
select row_number() over(order by OrderStatus)rowid,OrderDetail.*,BookInfo.BookName,BookInfo.PicPath,MyOrder.OrderTime,MyOrder.OrderCode,MyOrder.OrderStatus,MyOrder.OrderAllMoney,MyOrder.MemberId from OrderDetail 
left join BookInfo on OrderDetail.BookId=BookInfo.BookId 
left join MyOrder on OrderDetail.OrderId=MyOrder.OrderId where MemberId=1  ) tamp where rowid between 1 and 4




select count(*) from OrderDetail left join MyOrder on OrderDetail.OrderId=MyOrder.OrderId where MemberId=1

select *from(
select ROW_NUMBER()over(order by OrderDetailId ) rowid ,OrderDetail.*,BookInfo.BookName,BookInfo.PicPath,MyOrder.OrderTime,MyOrder.OrderCode,MyOrder.OrderStatus,MyOrder.OrderAllMoney,MyOrder.MemberId from OrderDetail left join BookInfo on OrderDetail.BookId=BookInfo.BookId  left join MyOrder on  MyOrder.OrderId=OrderDetail.OrderId   where MemberId=1 ) tamp where rowid between 1 and 2 

select ROW_NUMBER()over(order by OrderId ) rowid  from MyOrder 

--购物车
select * from BookCart

select BookCart.*,BookInfo.PicPath,BookInfo.BookName,BookInfo.BookPrice,BookInfo.BookDisCount from BookCart left join BookInfo on BookCart.BookId=BookInfo.BookId 




