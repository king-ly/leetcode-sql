185. 部门工资前三高的所有员工
一、sql结构
drop table if Exists Employee;
drop table if exists Department;
Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, DepartmentId int);
Create table If Not Exists Department (Id int, Name varchar(255));
Truncate table Employee;
insert into Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '85000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('2', 'Henry', '80000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('3', 'Sam', '60000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('4', 'Max', '90000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('5', 'Janet', '69000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('6', 'Randy', '85000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('7', 'Will', '70000', '1');
Truncate table Department;
insert into Department (Id, Name) values ('1', 'IT');
insert into Department (Id, Name) values ('2', 'Sales');

二、思路
1、部门
2、前三高。也就是说不跳号[1,2,2,3]
ps：
dense_rank() 不会跳号【1,2,2,3】
rank() 跳号 【1，2，2，4】

三、解题
select Department , Employee , Salary from (
select s1.id, s2.Name as Department , s1.name as Employee , Salary ,dense_rank() over(partition by s1.DepartmentId order by Salary desc ) as rn
from Employee s1 left join Department  s2
on s1.DepartmentId = s2.id where s2.id is not null
) s3 where rn < 4 order by id