create database DBBook
go
use DBBook
go

--系统权限
create table MyPower
(
	PowerId varchar(50) primary key not null, --主键
	MotherId varchar(50) null, --母级权限
	PowerName nvarchar(50), --权限名称
	MenuName nvarchar(50), --菜单名称
	PowerPage nvarchar(100), --菜单打开链接地址（*代表不跳转到具体功能页面，而是跳转到下级菜单展示信息页面）
)

--系统角色
create table MyRole
(
	RoleId int primary key identity(1,1), --主键
	RoleName nvarchar(100),  --角色名称
	RoleRemark text, --系统角色描述
	RolePowerList text,  -- 角色权限列表
)

--系统用户
create table MyUser
(
	UserId int primary key identity(1,1), --主键
	RoleId int,  --角色编号，外键（与角色表关联）
	UserAccount varchar(50),  --用户名
	UserPwd varchar(50),   --密码
	UserRealName nvarchar(50), --真实姓名
	UserPhone nvarchar(50), --用户联系电话
	UserPowerList text, --用户权限列表
	UserTime smalldatetime default(getdate()) --信息添加时间
)


--图书类型
create table BookType
(
  TypeId	int		identity	primary key,		--编号,非空,主键
  TypeName	varchar(25)			not null,			--类型名称,非空	
  ParentId	int		not null						--父节点编号,非空	
)

--图书信息
create table BookInfo
(
	BookId			int					identity	primary key,					--编号
	TypeId			int					not null	references BookType(TypeId),	--类型编号
	BookCode		char(13)			not null,						--条形码
	BookName		varchar(50)			not null,						--书名
	BookPrice		numeric(18,2)		not null,						--价格
	BookDisCount	numeric(4,1)		not null,						--折扣	
	BookAuthor		varchar(25)			not null,						--作者	
	BookPress		varchar(25)			not null,						--出版社	
	PressTime		datetime			not null,						--出版时间	
	PicPath			varchar(25)			not null,						--图片路径
	SellCount		int					not null,						--销售数量
	BookRemark      text												--图书介绍
)

--会员
create table Member
(
	MemberId int primary key identity(1,1),--主键编号
	MemberAcc varchar(50) not null, --用户名
	MemberPwd varchar(50) not null, --密码
	MemberCode varchar(50) not null,--身份证
	MemberName varchar(50) not null,--真实姓名
	MemberPhone varchar(50) not null,--电话
	MemberAddress varchar(200) not null, --地址
	MemberMail varchar(50) not null,--邮箱
	MemberAddTime smalldatetime default(getdate()) --会员注册时间
)

--订单
create table MyOrder
(
	OrderId int primary key identity(1,1),--主键编号
	OrderCode varchar(50) not null,--订单号(年月日时分秒+会员编号)
	MemberId int not null,--会员编号
	OrderPeople varchar(50) not null,--收货人
	OrderPhone varchar(50) not null,--收货电话
	OrderAddress varchar(200) not null,--收货地址
	OrderAllMoney money not null, --订单总金额	
	OrderStatus int not null,--订单状态(1-新订单，2-发货中，3-等待收货，4-已收货，5-用户删除)
	OrderTime smalldatetime default(getdate()) --订单时间	
)

--订单明细
create table OrderDetail
(
	OrderDetailId int primary key identity(1,1),--主键编号
	OrderId int not null,--订单编号
	BookId int not null,--图书编号
	BookSalePrice money not null,--图书销售价格
	BookSaleCount int not null,--单本图书销售数量
)

--购物车
create table BookCart
(
	CartId int primary key identity(1,1),--自动编号
	MemberId int not null,--会员编号
	BookId int not null,--图书编号
	BookCount int not null,--图书数量
	IsSelect int default(1) not null,--是否选中（1-选中，0-未选中）
)


