181. 超过经理收入的员工

一、sql结构
drop table Employee;
Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, ManagerId int);
Truncate table Employee;
insert into Employee (Id, Name, Salary, ManagerId) values ('1', 'Joe', '70000', '3');
insert into Employee (Id, Name, Salary, ManagerId) values ('2', 'Henry', '80000', '4');
insert into Employee (Id, Name, Salary, ManagerId) values ('3', 'Sam', '60000', null);
insert into Employee (Id, Name, Salary, ManagerId) values ('4', 'Max', '90000', null);


二、思路
子查询
自连接

三、解题
select Name as Employee  from
(
  select name, Salary, (select s2.Salary from Employee s2 where s2.Id = s1.ManagerId) as m_salary
  from Employee s1
) s3 where Salary > m_salary;

这里需要用inner join 如果只用join那么性能不好。自连接一定不要用left join
SELECT b.Name AS Employee
FROM Employee a INNER JOIN Employee b
ON b.ManagerId IS NOT NULL AND b.ManagerId=a.Id AND b.Salary >a.Salary;
