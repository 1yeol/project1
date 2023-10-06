charset utf8;
create sequence seq_stationlist;

create table stationlist(
    division varchar2(100), /*����: ����, ����*/
    tnumber varchar2(100) primary key, /*������ȣ*/
    starts varchar2(1000), /*�����������*/
    arrive varchar2(1000), /*������������*/
    operatingtime varchar2(100) /*�ҿ�ð�*/
)default CHARSET=utf8;

insert into stationlist values ('����', 'KTX-100', '���� 09:00' ,'�λ� 11:36', '02:36');
insert into stationlist values ('����', 'KTX-101', '���� 12:00' ,'�λ� 14:36', '02:36');
insert into stationlist values ('����', 'KTX-102', '���� 15:00' ,'�λ� 17:36', '02:36');
insert into stationlist values ('����', 'KTX-200', '�λ� 10:00' ,'���� 12:36', '02:36');
insert into stationlist values ('����', 'KTX-201', '�λ� 13:00' ,'���� 15:36', '02:36');
insert into stationlist values ('����', 'KTX-202', '�λ� 16:00' ,'���� 18:36', '02:36');

select * from stationlist;
commit;