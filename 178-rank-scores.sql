178. 分数排名
一、sql结构
Create table If Not Exists Scores (Id int, Score DECIMAL(3,2));
Truncate table Scores;
insert into Scores (Id, Score) values ('1', '3.5');
insert into Scores (Id, Score) values ('2', '3.65');
insert into Scores (Id, Score) values ('3', '4.0');
insert into Scores (Id, Score) values ('4', '3.85');
insert into Scores (Id, Score) values ('5', '4.0');
insert into Scores (Id, Score) values ('6', '3.65');

二、思路
1、实现分数排名。
2、如果两个分数相同，则两个分数排名（Rank）相同
3、平分后的下一个名次应该是下一个连续的整数值。换句话说，名次之间不应该有“间隔”。

ps:这明显是mysql 8.0窗口函数 dense_rank()


三、解题
select Score,dense_rank() over (order by Score desc) as `Rank`  from Scores
