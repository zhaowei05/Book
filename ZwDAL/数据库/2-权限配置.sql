--��ʼ��֮ǰ��Ҫ��յı�����
truncate table MyPower

--һ��Ȩ��
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('999','0','ϵͳ����','ϵͳ����','javascript:void(0);')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('998','0','��������','��������','javascript:void(0);')

insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('001','0','��Ա����','��Ա����','/Admin/Member/MemberList.aspx')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('002','0','��Ʒ����','��Ʒ����','javascript:void(0);')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('003','0','��������','��������','/Admin/Order/OrderList.aspx')

--����Ȩ��--ϵͳ����
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('999001','999','��ɫ����','��ɫ����','/Admin/Role/RoleList.aspx')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('999002','999','�û�����','�û�����','/Admin/User/UserList.aspx')
--����Ȩ��--��������
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('998001','998','������Ϣ','������Ϣ','/Admin/Self/InfoEdit.aspx')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('998002','998','����ά��','����ά��','/Admin/Self/PwdEdit.aspx')

--����Ȩ��--��Ʒ����
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('002001','002','��Ʒ���͹���','��Ʒ���͹���','/Admin/Book/BookTypeList.aspx')
insert into MyPower(PowerId,MotherId,PowerName,MenuName,PowerPage)
values('002002','002','��Ʒ��Ϣ����','��Ʒ��Ϣ����','/Admin/Book/BookList.aspx')





