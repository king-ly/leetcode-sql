197. 上升的温度

一、sql结构
drop table if exists Weather;
Create table If Not Exists Weather (Id int, RecordDate date, Temperature int);
Truncate table Weather;
insert into Weather (Id, RecordDate, Temperature) values ('1', '2015-01-01', '10');
insert into Weather (Id, RecordDate, Temperature) values ('2', '2015-01-02', '25');
insert into Weather (Id, RecordDate, Temperature) values ('3', '2015-01-03', '20');
insert into Weather (Id, RecordDate, Temperature) values ('4', '2015-01-04', '30');

二、思路
1、来查找与之前（昨天的）日期相比温度更高的所有日期的 Id。
ps：每条记录都和自己的前一天相比，如果比前一天温度高就显示出来

lag() 窗口函数，得到前一天的记录



三、解题
select id from
   (
       select Id, RecordDate, Temperature, lag(Temperature, 1) over (order by RecordDate) as lag_Temperature,
       lag(RecordDate, 1) over (order by RecordDate) as lag_RecordDate
       from Weather
   ) s1
where s1.Temperature > lag_Temperature and RecordDate = date_add(lag_RecordDate, interval 1 day);

四、踩坑
1、记录跨日【5-1，5-3】中间的5-2没有了。这样就有问题。
这里用到data_add()函数，用于sql date的加减
