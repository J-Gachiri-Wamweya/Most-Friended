-- MOST FRIENDED

-- Given the following table, return a list of users and their corresponding friend count. 
-- Order the result by descending friend count, and in the case of a tie, by ascending user ID. 
-- Assume that only unique friendships are displayed

create database if not exists practicedb;
use practicedb;

create table if not exists friends_u(
user1 integer,
user2 integer);
/*
insert into friends_u (user1, user2) 
VALUES (1, 2), 
(1, 3), 
(1, 4), 
(2, 3);
*/
select * from friends_u;
with t1 as (
select * from friends_u
union all
select user2,user1 from friends_u
)
select user1 as user_id, count(*) as friend_count 
from t1 
group by user1 
order by friend_count desc,user_id;
