create database teaspoon;

USE teaspoon;

CREATE TABLE free(bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
                  title VARCHAR(100) NOT null,   -- 글제목
                  content VARCHAR(1500) not null,    -- 글내용
                  regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
                  visited INT,    -- 조회수
                  id VARCHAR(20),    -- 작성자
                  rec INT -- 추천수
);

insert into free values (DEFAULT, '제목1', '내용1', DEFAULT, 0, 'admin', 0);
insert into free values (DEFAULT, '제목2', '내용2', DEFAULT, 0, 'king', 0);
SELECT * FROM free;

CREATE TABLE reco (
    rno INT AUTO_INCREMENT PRIMARY KEY,
    bno INT REFERENCES free(bno) ON DELETE CASCADE,
    id VARCHAR(20),
    flag INT DEFAULT 0
);

