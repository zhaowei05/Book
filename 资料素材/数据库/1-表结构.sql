create database DBBook
go
use DBBook
go

--ϵͳȨ��
create table MyPower
(
	PowerId varchar(50) primary key not null, --����
	MotherId varchar(50) null, --ĸ��Ȩ��
	PowerName nvarchar(50), --Ȩ������
	MenuName nvarchar(50), --�˵�����
	PowerPage nvarchar(100), --�˵������ӵ�ַ��*������ת�����幦��ҳ�棬������ת���¼��˵�չʾ��Ϣҳ�棩
)

--ϵͳ��ɫ
create table MyRole
(
	RoleId int primary key identity(1,1), --����
	RoleName nvarchar(100),  --��ɫ����
	RoleRemark text, --ϵͳ��ɫ����
	RolePowerList text,  -- ��ɫȨ���б�
)

--ϵͳ�û�
create table MyUser
(
	UserId int primary key identity(1,1), --����
	RoleId int,  --��ɫ��ţ���������ɫ�������
	UserAccount varchar(50),  --�û���
	UserPwd varchar(50),   --����
	UserRealName nvarchar(50), --��ʵ����
	UserPhone nvarchar(50), --�û���ϵ�绰
	UserPowerList text, --�û�Ȩ���б�
	UserTime smalldatetime default(getdate()) --��Ϣ���ʱ��
)


--ͼ������
create table BookType
(
  TypeId	int		identity	primary key,		--���,�ǿ�,����
  TypeName	varchar(25)			not null,			--��������,�ǿ�	
  ParentId	int		not null						--���ڵ���,�ǿ�	
)

--ͼ����Ϣ
create table BookInfo
(
	BookId			int					identity	primary key,					--���
	TypeId			int					not null	references BookType(TypeId),	--���ͱ��
	BookCode		char(13)			not null,						--������
	BookName		varchar(50)			not null,						--����
	BookPrice		numeric(18,2)		not null,						--�۸�
	BookDisCount	numeric(4,1)		not null,						--�ۿ�	
	BookAuthor		varchar(25)			not null,						--����	
	BookPress		varchar(25)			not null,						--������	
	PressTime		datetime			not null,						--����ʱ��	
	PicPath			varchar(25)			not null,						--ͼƬ·��
	SellCount		int					not null,						--��������
	BookRemark      text												--ͼ�����
)

--��Ա
create table Member
(
	MemberId int primary key identity(1,1),--�������
	MemberAcc varchar(50) not null, --�û���
	MemberPwd varchar(50) not null, --����
	MemberCode varchar(50) not null,--���֤
	MemberName varchar(50) not null,--��ʵ����
	MemberPhone varchar(50) not null,--�绰
	MemberAddress varchar(200) not null, --��ַ
	MemberMail varchar(50) not null,--����
	MemberAddTime smalldatetime default(getdate()) --��Աע��ʱ��
)

--����
create table MyOrder
(
	OrderId int primary key identity(1,1),--�������
	OrderCode varchar(50) not null,--������(������ʱ����+��Ա���)
	MemberId int not null,--��Ա���
	OrderPeople varchar(50) not null,--�ջ���
	OrderPhone varchar(50) not null,--�ջ��绰
	OrderAddress varchar(200) not null,--�ջ���ַ
	OrderAllMoney money not null, --�����ܽ��	
	OrderStatus int not null,--����״̬(1-�¶�����2-�����У�3-�ȴ��ջ���4-���ջ���5-�û�ɾ��)
	OrderTime smalldatetime default(getdate()) --����ʱ��	
)

--������ϸ
create table OrderDetail
(
	OrderDetailId int primary key identity(1,1),--�������
	OrderId int not null,--�������
	BookId int not null,--ͼ����
	BookSalePrice money not null,--ͼ�����ۼ۸�
	BookSaleCount int not null,--����ͼ����������
)

--���ﳵ
create table BookCart
(
	CartId int primary key identity(1,1),--�Զ����
	MemberId int not null,--��Ա���
	BookId int not null,--ͼ����
	BookCount int not null,--ͼ������
	IsSelect int default(1) not null,--�Ƿ�ѡ�У�1-ѡ�У�0-δѡ�У�
)


