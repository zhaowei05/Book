
--ϵͳȨ��
select * from MyPower


--ϵͳ��ɫ
select * from MyRole


--ϵͳ�û�
select * from MyUser

select *from(
select ROW_NUMBER()over(order by UserId) rowid,* from MyUser) Tamp where rowid between (1-1)*(5-1) and 1*5

delete from MyUser  where UserId=1
Update MyUser set RoleId=1

select count(*) from MyUser where 1=1


--ͼ������
select * from BookType

--ͼ����Ϣ
select * from BookInfo

select * from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId  where 1=1 and BookName like'%��%' and BookName like '%C%'

select BookInfo.*,BookType.TypeName,BookType.ParentId from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId 

insert into BookInfo(TypeId,BookCode,BookName,BookPrice,BookDisCount,BookAuthor,BookPress,PressTime,PicPath,SellCount,BookRemark) values(@TypeId,@BookCode,@BookName,@BookPrice,@BookDisCount,@BookAuthor,@BookPress,@PressTime,@PicPath,@SellCount,@BookRemark)

select *from(
select ROW_NUMBER()over(order by BookId ) rowid,BookInfo.*,BookType.TypeName,BookType.ParentId from BookInfo left join  BookType on BookInfo.TypeId=BookType.TypeId   where 1=1 and PressTime between '2011-01-01' and '2011-01-01'  ) Tamp where rowid between (1-1)*5+1 and 1*5 

--��Ա
select * from Member

select count(*) from Member where MemberAcc=0

insert into Member(MemberAcc,MemberPwd,MemberCode,MemberName,MemberPhone,MemberAddress,MemberMail,MemberAddTime) values
(@MemberAcc,@MemberPwd,@MemberCode,@MemberName,@MemberPhone,@MemberAddress,@MemberMail,GETDATE())

insert into Member(MemberAcc,MemberPwd,MemberCode,MemberName,MemberPhone,MemberAddress,MemberMail,MemberAddTime) values
('zhaowei00','123456','421081199911060513','��ΰ','18827137079','000','1950307707@qq.com',GETDATE())

select count(*) from Member where MemberAcc='zhaowei0'
--����
select * from MyOrder

select MyOrder.*,Member.MemberAcc from MyOrder left join Member on Member.MemberId=MyOrder.MemberId

insert into MyOrder(OrderCode,MemberId,OrderPeople,OrderPhone,OrderAddress,OrderAllMoney,OrderStatus.OrderTime)
values(@OrderCode, @MemberId,@OrderPeople,@OrderPhone, @OrderAddress,@OrderAllMoney,@OrderStatus, GETDATE())
--������ϸ
select * from OrderDetail

select OrderDetail.*,BookInfo.BookName from OrderDetail left join BookInfo on OrderDetail.BookId=BookInfo.BookId 

select *from(
select ROW_NUMBER()over(order by OrderDetailId ) rowid ,OrderDetail.*,BookInfo.BookName,BookInfo.PicPath,MyOrder.OrderTime,MyOrder.OrderCode,MyOrder.OrderStatus,MyOrder.OrderAllMoney,MyOrder.MemberId from OrderDetail left join BookInfo on OrderDetail.BookId=BookInfo.BookId  left join MyOrder on  MyOrder.OrderId=OrderDetail.OrderId   where MemberId=1 ) tamp where rowid between 1 and 2 

select ROW_NUMBER()over(order by OrderId ) rowid  from MyOrder 

--���ﳵ
select * from BookCart

select BookCart.*,BookInfo.PicPath,BookInfo.BookName,BookInfo.BookPrice,BookInfo.BookDisCount from BookCart left join BookInfo on BookCart.BookId=BookInfo.BookId 

select * from BookCart where MemberId=1 and BookId=12

select * from BookCart where MemberId =1 and BookId = 12


update BookCart set IsSelect=0 where CartId=2

