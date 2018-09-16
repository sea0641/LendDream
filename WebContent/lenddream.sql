CREATE TABLE user1 (
  userName varchar(20) DEFAULT NULL,
  userNickname varchar(20) DEFAULT NULL,
  userID varchar(20) NOT NULL,
  userPassword1 varchar(20) DEFAULT NULL,
  userPassword2 varchar(20) DEFAULT NULL,
  userMail1 varchar(20) DEFAULT NULL,
  userMail2 varchar(20) DEFAULT NULL,
  userPhone varchar(20) DEFAULT NULL,
  userAddress varchar(50) DEFAULT NULL,
  userdibs varchar(100) DEFAULT NULL,
  img varchar(20) DEFAULT NULL,
  PRIMARY KEY (userID)
) ENGINE=InnoDB;

--원활한 사용을 위해 데이터를 미리 넣어주세요!
--사용자 추가
INSERT INTO user1 VALUES ("강지은","지은","kge1381","5339","5339","kge1381","naver.com","01035815339","서울시 강서구 화곡동","","zeun.jpg");
INSERT INTO user1 VALUES ("박수연","수여니","sandy","5339","5339","sandy","naver.com","01033335555","경기도 광명시", "","syeunn.jpg");
INSERT INTO user1 VALUES ("박세아","세아","blueseaangel","5339","5339","blueseaangel","naver.com","01033335555","서울시 서초구","","seah.jpg");

CREATE TABLE product (
	 prod_num int(100) primary key auto_increment,
     id varchar(20),
     prod_name varchar(30),
     category varchar(30),
     description text,
     price varchar(30),
     from_d varchar(30),
     to_d varchar(30),
     img varchar(20),
     view int(11) DEFAULT 0,
     lend_count int(100) DEFAULT 0,
     foreign key (id)
     references user1(userID) on delete cascade on update cascade
)ENGINE=InnoDB;

--물품 추가
insert into product(id,prod_name,category,description,price,from_d,to_d,img,view,lend_count) values("kge1381","칼하트에코백","잡화","이것은 에코백입니당","3000","2018-06-06","2018-10-06","bag.jpg",32,4);
insert into product(id,prod_name,category,description,price,from_d,to_d,img,view,lend_count) values("kge1381","책","책","거의 새책입니다. 잼써용","1000","2018-06-06" , "2018-09–06","book.jpg",70,2);
insert into product(id,prod_name,category,description,price,from_d,to_d,img,view,lend_count) values("blueseaangel","카메라","전자제품","화질이 좋은 카메라입니다. ","4000","2018-06-06","2018-12–06","camera.jpg",120,10);
insert into product(id,prod_name,category,description,price,from_d,to_d,img,view,lend_count) values("sandy","통기타","악기","소리가 좋은 기타입니다. ","3000","2018-06-06","2018-11-30","guitar.jpg",30,7);
insert into product(id,prod_name,category,description,price,from_d,to_d,img,view,lend_count) values("sandy", "인라인스케이트", "운동기구", "재밌는 운동을 할 수 있어요~", "2000", "2018-06-06", "2018-09–06", "inline.jpg",66,22);
insert into product(id,prod_name,category,description,price,from_d,to_d,img,view,lend_count) values("sandy","노트북","전자제품","최신 노트북입니다.ㅎㅅㅎ","8000","2018-06-06","2018-12–06","notebook2.jpg",90,4);
insert into product(id,prod_name,category,description,price,from_d,to_d,img,view,lend_count) values("blueseaangel","정장","옷","신상 정장입니다. 거의 안입었어요","4000","2018-06-06","2018-08–10","suit2.jpg",20,8);

CREATE TABLE lend (
	 lend_num int(100) primary key auto_increment,
     id varchar(20),
     prod_num int(100),
     from_d varchar(30),
     to_d varchar(30),
     price1 varchar(30),
     price2 varchar(30),
     delivery varchar(10),
     foreign key (id) references user1(userID) on delete cascade on update cascade,
     foreign key (prod_num) references product(prod_num) on delete cascade on update cascade
)ENGINE=InnoDB;

create table reply(
    re_num int(11) not null primary key auto_increment,
    prod_num int(11) not null,
    userID varchar(20) not null,
    DATE datetime,
    message varchar(20) not null,
    foreign key (prod_num) references product(prod_num)
)ENGINE=InnoDB;