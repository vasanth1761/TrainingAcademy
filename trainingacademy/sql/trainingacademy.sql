create table users(
user_id int  primary key auto_increment,
user_name varchar(100) not null,
user_mailid varchar(100) not null, 
user_phonenumber varchar(100) not null,
user_password varchar(100) not null
);

create table payment_details(
learner_id int,
course_id varchar(100) not null,
course_name varchar(100) not null,
payment_type varchar(100) not null,
account_number varchar(100) not null,
enroll_date varchar(100) not null,
amount int not null,
constraint user_id_fk foreign key(learner_id)References users(user_id)
);

create table question
(
id int primary key auto_increment,
questions varchar(100),
option_1 varchar(100),
option_2 varchar(100),
option_3 varchar(100),
option_4 varchar(100),
correct_answer varchar(100),
category varchar(100)
);

CREATE TABLE Videos (
    VideoID INT PRIMARY KEY AUTO_INCREMENT,
    VideoTitle VARCHAR(255),
    VideoLink VARCHAR(1000), 
    Category VARCHAR(50),
    Content TEXT
);

create table learner_comments(
learner_id int,
learner_name varchar(50),
learner_course varchar(50),
learner_comments varchar(200),
constraint user_id_fk4 foreign key(learner_id)References users(user_id)
);

create table learner_result(
learner_id int,
learner_name varchar(50),
learner_course varchar(50),
learner_score varchar(50),
learner_percentage varchar(50),
constraint user_id_fk5 foreign key(learner_id)References users(user_id)
);

