create table users(
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50), 
	email varchar(50)
);

insert into users(first_name, last_name, email) values
('Diego', 'Castro', 'diego@gmail.com'), --1
('Maria', 'Miranda', 'maria@gmail.com'), -- 2
('Auran', 'Blanco', 'auran@gmail.com'); -- 3


create table post (
	id serial primary key,
	title varchar(50),
	texto text,
	creator_id int references users(id)
);

insert into post(title, texto, creator_id)  values
('Post 1', 'Lorem ipsum dolor sit amet, consectetur', 1 ), --1
('Post 2', 'Maecenas vel nulla tristique', 2),--2
('Post 3', 'Etiam ornare laoreet convallis.', 3), --3
('Post 4', 'Maecenas vel nulla tristique locaperllo usus', 2), --4
('Post 5', 'Etiam ornare laoreet convallis yepes aleggro gime.', 3); --5

drop table post;

create table likes (   --tabla pivote
	id serial primary key,
	user_id int references users(id) ,
	post_id int references post(id)
);

insert into likes(user_id, post_id) values
(1,3),
(2,5),
(2,2),
(3,1),
(3,4);

select*from likes
--Trae todos los post y la informacion del uuario del campo creator_id

select*from post inner join users
on post.creator_id = users.id;

--Trae todos los post con la informacion de lo usuarios que le dieron like

--users -- likes -- post


SELECT *
FROM users
INNER JOIN likes ON users.id = likes.user_id
INNER JOIN post ON post.id = likes.post_id;

select*from users inner join likes on 
users.id = likes.user_id::integer inner join post on
post.id = likes.post_id::integer;