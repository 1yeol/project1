charset utf8;
create sequence seq_stationlist;

create table stationlist(
    division varchar2(100), /*구분: 직통, 경유*/
    tnumber varchar2(100) primary key, /*열차번호*/
    starts varchar2(1000), /*열차출발정보*/
    arrive varchar2(1000), /*열차도착정보*/
    operatingtime varchar2(100) /*소요시간*/
)default CHARSET=utf8;

insert into stationlist values ('직통', 'KTX-100', '서울 09:00' ,'부산 11:36', '02:36');
insert into stationlist values ('직통', 'KTX-101', '서울 12:00' ,'부산 14:36', '02:36');
insert into stationlist values ('직통', 'KTX-102', '서울 15:00' ,'부산 17:36', '02:36');
insert into stationlist values ('직통', 'KTX-200', '부산 10:00' ,'서울 12:36', '02:36');
insert into stationlist values ('직통', 'KTX-201', '부산 13:00' ,'서울 15:36', '02:36');
insert into stationlist values ('직통', 'KTX-202', '부산 16:00' ,'서울 18:36', '02:36');

select * from stationlist;
commit;