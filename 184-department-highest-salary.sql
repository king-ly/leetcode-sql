184. 部门工资最高的员工

一、sql结构
drop table If Exists Employee;
drop table If Exists Department;
Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, DepartmentId int);
Create table If Not Exists Department (Id int, Name varchar(255));
Truncate table Employee;
insert into Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('2', 'Jim', '90000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('3', 'Henry', '80000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('4', 'Sam', '60000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('5', 'Max', '90000', '1');
Truncate table Department;
insert into Department (Id, Name) values ('1', 'IT');
insert into Department (Id, Name) values ('2', 'Sales');

二、思路
1、找出每个部门工资最高的员工
2、每个部门
3、最高

ps：rank() 进行排序。

三、解题
select Department , Employee , Salary from (
select s1.id, s2.Name as Department , s1.name as Employee , Salary ,rank() over(partition by s1.DepartmentId order by Salary desc ) as rn
from Employee s1 left join Department  s2
on s1.DepartmentId = s2.id where s2.id is not null
) s3 where rn=1 order by id

