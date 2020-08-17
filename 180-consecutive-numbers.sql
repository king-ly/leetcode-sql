180. 连续出现的数字

一、sql结构
Create table If Not Exists Logs (Id int, Num int);
Truncate table Logs;
insert into Logs (Id, Num) values ('1', '1');
insert into Logs (Id, Num) values ('2', '1');
insert into Logs (Id, Num) values ('3', '1');
insert into Logs (Id, Num) values ('4', '2');
insert into Logs (Id, Num) values ('5', '1');
insert into Logs (Id, Num) values ('6', '2');
insert into Logs (Id, Num) values ('7', '2');

二、思路
1、查找所有至少连续出现三次的数字。
2、至少3次
3、连续

ps：
mysql窗口函数  向下取值：lead() /   向上取值：lag()
也就是说可以使用向下取值，得到N行值，第N+1行的值，第N+2行的值。
如果 val(N) = val(N+1) = val(N+2)  说明 n,n+1,n+2 这三行是连续的。

ps：还有个去问题。如果这个值是4行，5行更多的行都是连续的，我们只判断了3行连续。那么就会有重复的值出现。
distinct

-----------------------------
id   num   num2  num3    is_consecutive
1     2      2     2        true
2     2      2     2        true
3     2      2     null
4     2      null  null
这是连续4行连续，就会得到两条记录。


三、解题
select distinct Num as ConsecutiveNums from
(
   select id,Num,
          case
              when Num = lead(Num, 1) over () && Num = lead(Num, 2) over () then 1
              else 0 end as 'consecutive'
   from Logs
) s1
where s1.consecutive=1;

或者：

select distinct num as ConsecutiveNums  from
(
    select num,lead(num,1)over()as num1,lead(num,2)over()as num2
    from logs
) as c
where c.num = c.num1 and c.num1 = c.num2
