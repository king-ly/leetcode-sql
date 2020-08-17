两数之和

一、sql结构
Create table Person (PersonId int, FirstName varchar(255), LastName varchar(255))
Create table Address (AddressId int, PersonId int, City varchar(255), State varchar(255))
Truncate table Person
insert into Person (PersonId, LastName, FirstName) values ('1', 'Wang', 'Allen')
Truncate table Address
insert into Address (AddressId, PersonId, City, State) values ('1', '2', 'New York City', 'New York')


二、思路
无论 person 是否有地址信息，都需要基于上述两表提供 person 的以下信息：
ps:这表明person是主表。也就是说Address表可以为空。

Person left join Address  使用左连接就可以解决这个问题


三、解题
select s1.FirstName, s1.LastName, s2.City, s2.State from Person s1
left join Address s2 on s1.PersonId = s2.PersonId