DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
  uid      SERIAL primary key not null ,
  username varchar(30) not null,
  password varchar(30) not null,
  realname varchar(30) not null,
  email    varchar(50) not null,
  gender   varchar(2)  not null,
  regtime     time     not null,
  description text,
  avatar      varchar(100) not null
);

CREATE TABLE messages (
  mid      SERIAL primary key not null,
  content  text not null,
  posttime time not null, 
  uid      integer not null references users(uid)
);

INSERT INTO users(username, password, realname, email, gender, regtime, description, avatar) 
  VALUES('wangba', '12345678', 'Bie', 'wang.8@gmail.com', 'M', now(), '', 'http://www.avatarsdb.com/avatars/koala11.jpg');

INSERT INTO messages(content, posttime, uid)
  VALUES('Today is a good day!', now(), 1);

INSERT INTO messages(content, posttime, uid)
  VALUES('快乐的鳖....', now(), 1);

INSERT INTO messages(content, posttime, uid)
  VALUES('Wonderful~~~~ haha haha haha', now(), 1);
