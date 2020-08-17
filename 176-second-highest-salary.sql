第二高的薪水

一、sql结构
Create table If Not Exists Employee (Id int, Salary int)
Truncate table Employee
insert into Employee (Id, Salary) values ('1', '100')
insert into Employee (Id, Salary) values ('2', '200')
insert into Employee (Id, Salary) values ('3', '300')

二、思路
1、第二高的薪水。
ps: 这就涉及到了排序的问题。在mysql8.0之后出现了窗口函数
rank() 函数，当指定字段数值相同，则会产生相同序号记录，且产生序号间隙【1 2 2 4】
dense_rank() 函数，当指定字段数值相同，则会产生相同序号记录，且不会产生序号间隙 【1 2 2 3】
row_number() 函数，不区分是否记录相同，产生自然序列【1 2 3 4】

2、如果不存在第二高的薪水，那么查询应返回 null
ps：
当查询结果记录数为0时。是不显示结果集的。

-----------------------
输出0行
SecondHighestSalary
-----------------------

解决方法:sql的聚合函数可以做到。当没有符合条件记录时，也会得到一条记录：
-----------------------
输出1行
SecondHighestSalary
<null>
----------------------

三、解题
select max(Salary) SecondHighestSalary from
(
    select s1.Salary, rank() over (order by s1.Salary desc) ro
    from Employee s1
) s2
where s2.ro=2
