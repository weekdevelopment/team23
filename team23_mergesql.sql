USE team23;

-- 이거 건드리지 마세요!!!! 이거 없으면 윈도우 호환성 안될 때 오류 해결 못합니다ㅠㅠㅠ
ALTER DATABASE teaspoon DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

SHOW TABLES;

COMMIT;

DROP TABLE member;

CREATE TABLE member(id VARCHAR(20) PRIMARY KEY,
pw varchar(300) not null,
name varchar(50),
email varchar(100) not null,
tel varchar(20) not null,
addr1 varchar(200),
addr2 varchar(100),
postcode varchar(10),
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
birth date,
pt int default 0,
visited int default 0
);

SELECT * FROM member;

DESC member;

INSERT INTO member VALUES ('admin', '1234', '관리자','admin@buddy.com', '01012341234', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO member VALUES ('kang', '1234', '강영현','kang@buddy.com', '01011112222', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO member VALUES ('park', '1234', '박정우','park@buddy.com', '01033334444', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

UPDATE member SET pw='$2a$10$B1eSQwtXQMZIht3sHOWS7.a/wOmnXT9T3EqYwl7qBbOfAuj8YuKvW';


COMMIT;


--교육 매거진
CREATE TABLE edumag(
link VARCHAR(100) NOT NULL,
no INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(200) NOT NULL,
content VARCHAR(1000),
resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
imagesLink varchar (1000) NULL,
visited INT(11) DEFAULT 0
);
​
INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/-FhhsWwemmE?si=YZE55dqm1u8wuoS4',
DEFAULT,
'200% 효과 보는 문제집 선택과<br> 활용법에 대해 알아보아요!',
'아이 수준에 맞는 문제집은 어떻게 고를 수 있을까요?<br>
정답률 70%를 기억해 주세요.<br>
70%라는 수치가 높아 보일 수 있지만<br>
반대로 생각하면 모르는 게 30%나 있다는 뜻입니다. <br>
사실 이 30%를 메꿔 가는 것도 아이들에게는 어려운 일이에요. <br>
70%의 정답률로 아이들의 자존감을 상승시키고, <br>
30%의 오답률로 아이들의 도전 정신을 자극시켜 주세요.',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=a5c485fd-f453-4220-90b9-45b0d4baed95&fileName=yoon1.png',
DEFAULT
);

INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/Z8JPndQQlpk?si=YjMcACtsZyxxkeCI',
DEFAULT,
'공부 잘하는 아이들은 모두<br>어떤 공통점이 있을까요?',
'1. 절박함 & 공부 정서가 안정된 아이들<br>
고등학생이 되면 공부를 해야 할 학습의 양이 폭발합니다.<br>
이때에는 그냥 열심히 하는 것만으로는 부족합니다.<br>
진로 목표가 있든, 절박함이 있든<br>
안정된 공부 정서를 가지고 공부 습관을 잘 키운 아이들이 이를 이겨냅니다.<br>
2. 기본이 잡혀 있는 영어 또는 수학<br>
영어와 수학이 둘 다 기본이 잡혀 있지 않으면,<br>
진도를 못 따라 가는 게 문제가 아니라<br>
여러가지 공부 계획부터 시간까지 무너지게 됩니다.<br> ',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=aeab0724-5c0e-472f-8028-b1f87ab1751f&fileName=young1.png',
DEFAULT
);

INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/wu2N-A1aP4k?si=qrRzra7zt-JgeWjl',
DEFAULT,
'연산 속도가 느리다면<br> 어떤 해결방안이 있을까요?',
'Q1)&nbsp;
실수할까봐 몇 번이나 검산하다 보니 속도가 너무 늦어요.<br>
어떻게 하면 좋을까요?<br>
<br>
Q2)&nbsp;
연산은 어느 정도로, 언제까지 해야 할까요?<br>
<br>
Q3)&nbsp;
연산을 할 때 손으로 풀지 않고 암산으로 푸는데 정답은 다 맞혀요.<br>
그러면 그냥 둬도 괜찮을까요?<br> 풀이과정을 쓰게 해야 할까요?<br>
<br>
Q4)&nbsp;
기본 연산서의 정답율이 90% 이상이면 상위 연산서를 풀어야 할까요,<br>
아니면 다음 학기 선행을 해야 할까요?<br>
<br>
Q5)&nbsp;
연산에만 몰두하면 응용력이 떨어질 것 같은데,<br>
연산에서 자연스럽게 응용으로 넘어가는 방법이 궁금합니다.<br>
<br>
Q6)&nbsp;
연산과 사고력 수학 중 어떤 것이 더 중요한가요?<br>',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=fa1a96e6-769c-4fab-bb54-5cb831c1db2b&fileName=sun1.png',
DEFAULT
);

INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/mzYeZauhOXA?si=LOl3kYmsl3jNgV8l',
DEFAULT,
'꿀팁 가득한<br>원어민 실력인 준혁이의 영어 노출방법',
'드디어 준혁이의 아빠표 영어 1편이 찾아왔어요.<br>
기존의 영어학원과  다른 준혁 아빠표 영어의 방법과 이를 위한 방법들에 대해서 담아봤어요.<br>
이번 인터뷰를 참고하셔서 또 하나의 좋은 공부법을 얻어가셨으면 좋겠습니다!<br>
<br>
<br>
Q1)&nbsp;준혁 아빠표 영어가 영어학원과 다른 점은 무엇인가요?<br><br>
Q2)&nbsp;준혁이의 영어 노출 방법이 궁금해요.<br><br>
Q3)&nbsp;영어 공부에 앞서 잊지 말아야 할 영어를 대하는 태도가 있을까요?<br><br>
Q4)&nbsp;영어 교육은 언제 시작하는 것이 좋을까요?<br><br>',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=1b5b7f79-7525-4f2d-a5e9-2b1031ffe0a0&fileName=gwang1.png',
DEFAULT
);

INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/H_A6ywlTOck?si=zKfMo7D9G994x9xn',
DEFAULT,
'나와 다르다고만 생각하지 말고,<br>내 아이의 마음을 이해해보아요.',
'아이가 속마음을 말하지 않는다면<br>
말하지 않는 본인만의 이유가 있습니다.<br>
내향적인 성격이라 말을 하지 못하는 것일 수도 있고,<br>
속마음을 이야기했는데 안 좋은 경험을 했기 때문일 수도 있어요.<br>
아이의 마음을 이해해 줘야 합니다.<br>
이를 통해 자연스럽게 감정을 표현할 수 있도록 도와주셔야 합니다.',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=fdae3718-ce3e-42f5-93a0-9403168ad54e&fileName=oh1.png',
DEFAULT
);

INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/IaQxLi0wT2s?si=eGu_jPPLNozyD64q',
DEFAULT,
'수학 문제를 풀 때 우리 아이가<br> 실수가 많다면 꼭 따라해보세요!',
'1. 문제집 뒤의 단원 평가, 실력 평가 활용하기<br>
문제집 뒤에 있는 단원 평가나 실력 평가를 찢어서 시험지처럼 활용해 주세요.<br>
실제 시험을 보는 것처럼 시간을 정해서 훈련을 시켜주면 도움이 됩니다.<br> 
2. 실력 점검의 날<br>
시험을 보는 날에는 공부를 추가로 시키지 말아주세요.<br>
여태까지 배운 내용을 점검받는 날로 아이가 생각할 수 있도록 해주세요.<br>
3. 시험에 대한 부담감 하락<br>
집에서 시험을 보는 훈련을 시켜준다면<br>
나중에 학교에서 시험을 볼 때 아이의 부담감을 내려줄 수 있어요.',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=2c3ea6a5-0dee-402e-8731-0d9c1cb3fa44&fileName=yoon2.png',
DEFAULT
);

INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/3gl6xHMMxcs?si=NYX_OkmAPfNpJSH1',
DEFAULT,
'우리 아이의 문해력이 쑥쑥 자라는<br> 책 읽기 습관은 무엇일까요?',
'올바른 독후 활동을 위한 마지막은,<br>
부모와 함께 대화 나누기입니다.<br>
대부분 처음에 책을 읽을 때에만 같이 읽으면 된다고 생각하지만,<br>
초등학교 내내 여러 가지 주제에 대해 같이 읽는 게 중요합니다.<br>
아이들이 책을 읽지 않아 비문학으로 건너가지 못하는 이유 중의 하나가<br>
분위기가 형성이 안 되기 때문입니다.<br>
하지만 부모와 함께 읽는다면<br>
자연스럽게 책의 수준과 종류를 업그레이드 시키는 분위기가 만들어질 거예요.',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=cc8d5421-7c37-445f-94da-6f2774cde61f&fileName=young2.png',
DEFAULT
);

INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/lfU1KOFE9bE?si=-7gID7Dj1htkQTMV',
DEFAULT,
'예전과 많이 달라져버린 수학,<br> 어떻게 공부하면 좋을까요?',
'수학 문제집만 하더라도 종류가 너무나도 많죠. <br>
개념서, 유형서, 심화서 등<br>등
이러한 문제집의 종류를 파악하고 자녀의 수준에 맞는 문제집을 고르는 법<br>
나아가 문제집을 어떻게 활용해야 하는지까지<br>
한선쌤이 수학을 어떻게 씹어 먹어야 하는지 알려드릴게요!',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=1f1b3e11-3bae-483d-afe1-2d9ea496d8d2&fileName=sun2.png',
DEFAULT
);

INSERT INTO edumag VALUES(
'https://www.youtube.com/embed/44frx8ZUgw4?si=wmjX4uhyFjX_AF0d',
DEFAULT,
'우리 아이 어떤 영상을 봐야할까요?<br> 영상 노출에 대해 자주 듣는 질문들!',
'아이들은 100% 이해를 못 해도 영어로 된 영상들을 보면서<br>
영어가 만만해지고 익숙해져요.<br>
이 자체만으로도 굉장히 의미가 있어요.<br>
우리가 아이들에게 재미있는 영상을 보여주려는 이유가<br>
반복을 통해 영어에 익숙해지게 하는데 의의가 있거든요.<br>
아이가 좋아하는 영상과 학습용 영상을 병행해서 보여주면<br>
학습 효과를 더 높일 수 있어요.',
DEFAULT,
'/team23/edumag/ckImgSubmit.do?uid=0f0aef4e-0e4c-4d9e-abc0-87639ed32927&fileName=gwang2.png',
DEFAULT
);

COMMIT;

SELECT * FROM edumag;


DROP TABLE edumagComment;

--교육매거진 댓글
SELECT * FROM edumagComment

CREATE TABLE edumagComment(
dno INT PRIMARY KEY AUTO_INCREMENT,   -- (댓글번호) 자동발생
author VARCHAR(16) NOT NULL,   -- (댓글 작성자)
content VARCHAR(1000) NOT NULL,   -- (댓글 내용)
regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (댓글 등록일)
par INT(11) NOT NULL   -- (해당 게시글 번호)
);

INSERT INTO edumagComment VALUES(
DEFAULT,
'seo',
'좋은 정보 감사합니다!',
DEFAULT,
'1'
);

INSERT INTO edumagComment VALUES(
DEFAULT,
'lee',
'우왕~ 참고할게욧!',
DEFAULT,
'1'
);

INSERT INTO edumagComment VALUES(
DEFAULT,
'han',
'허허,,, 그렇군요,,,',
DEFAULT,
'1'
);

-- 자유게시판
CREATE TABLE free(
bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) NOT null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT -- 추천수
);

CREATE TABLE free_comment(
cno INT PRIMARY KEY AUTO_INCREMENT,
bno INT,
author VARCHAR(16) NOT NULL,
resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
content VARCHAR(200),
FOREIGN KEY(bno) REFERENCES free(bno) ON DELETE CASCADE
);

CREATE VIEW freecommentlist AS (SELECT a.cno AS cno, a.bno as bno, a.content AS content, a.author AS author, a.resdate AS resdate,
                                       b.name AS name FROM free_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);

CREATE TABLE reco (
rno INT AUTO_INCREMENT PRIMARY KEY,
bno INT REFERENCES free(bno) ON DELETE CASCADE,
id VARCHAR(20),
flag INT DEFAULT 0
);

-- 교재게시판
CREATE TABLE booktalk(
bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) NOT null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT -- 추천수
);

CREATE TABLE booktalk_comment(
cno INT PRIMARY KEY AUTO_INCREMENT,
bno INT,
author VARCHAR(16) NOT NULL,
resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
content VARCHAR(200),
FOREIGN KEY(bno) REFERENCES booktalk(bno) ON DELETE CASCADE
);

CREATE VIEW booktalkcommentlist AS (SELECT a.cno AS cno, a.bno as bno, a.content AS content, a.author AS author, a.resdate AS resdate,
                                           b.name AS name FROM booktalk_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);

CREATE TABLE bookreco (
rno INT AUTO_INCREMENT PRIMARY KEY,
bno INT REFERENCES booktalk(bno) ON DELETE CASCADE,
id VARCHAR(20),
flag INT DEFAULT 0
);


--이벤트 게시판
create table event(
bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) not null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT DEFAULT 0,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT DEFAULT 0 -- 추천수
);

DROP table EVENT;

SELECT * FROM winner;


--당첨자 게시판
create table winner(
bno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
title VARCHAR(100) not null,   -- 글제목
content VARCHAR(1500) not null,    -- 글내용
regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
visited INT DEFAULT 0,    -- 조회수
id VARCHAR(20),    -- 작성자
rec INT DEFAULT 0 -- 추천수
);

insert into event values(default, '이벤트 글 제목1입니다.', '여기는 이벤트 글1에 대한 내용입니다.', default, DEFAULT, 'admin', default);

COMMIT;

DROP TABLE survey;

--설문 게시판
CREATE TABLE survey(
  sno int auto_increment primary key,
  title VARCHAR(200) NOT NULL,
  q1 varchar(200),
  q2 varchar(200),
  q3 varchar(200),
  q4 varchar(200),
  q5 varchar(200),
  q6 varchar(200),
  q7 varchar(200),
  q8 varchar(200),
  q9 varchar(200),
  q10 varchar(200),
  regdate timestamp default current_timestamp,
  ans int default 0,
  lev int default 0,
  par INT DEFAULT 0,
  author VARCHAR(100),
  visited INT(11) DEFAULT 0,
  content VARCHAR(1500)
);


INSERT INTO survey VALUES (DEFAULT, '설문 1', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 2', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 3', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 4', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 5', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 6', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 7', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 8', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 9', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);
INSERT INTO survey VALUES (DEFAULT, '설문 10', '', '', '', '', '', '', '', '', '', '', DEFAULT, DEFAULT, DEFAULT, NULL);

COMMIT;

update survey set q1='설문 1', q2='설문 2', q3='설문 3', q4='설문 4', q5='설문 5', q6='설문 6', q7='설문 7', q8='설문 8', q9='설문 9', q10='설문 10' where sno=1;


SELECT * FROM event;


-- 자주 묻는 질문 테이블 생성
CREATE TABLE faq (
                     fno int PRIMARY KEY AUTO_INCREMENT,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);

COMMIT;

-- 자주 묻는 질문 더미 데이터 
INSERT INTO faq VALUES (DEFAULT, '질문1', '답변1입니다', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '질문2', '답변2입니다', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '질문3', '답변3입니다', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '질문4', '답변4입니다', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '질문5', '답변5입니다', DEFAULT);

-- 공지사항 테이블 생성 
create table notice(
                       nno int primary KEY AUTO_INCREMENT,
                       title varchar(200) not NULL,
                       content varchar(1000),
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit int DEFAULT 0
);

-- 커뮤니티 전용 공지사항 더미글 추가 10건

INSERT INTO notice VALUES(DEFAULT, "공지사항 1번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 2번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 3번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 4번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 5번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);

INSERT INTO notice VALUES(DEFAULT, "공지사항 6번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 7번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 8번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 9번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 10번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);

INSERT INTO notice VALUES(DEFAULT, "공지사항 11번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 12번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 13번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 14번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);
INSERT INTO notice VALUES(DEFAULT, "공지사항 15번", "금주의 공지 전달드립니다~!", DEFAULT, DEFAULT);

-- 묻고 답하기(질문, 답변) 테이블 생성
CREATE TABLE qna(
                    qno int PRIMARY KEY AUTO_INCREMENT,   			            -- 번호
                    title VARCHAR(100) NOT NULL,   					-- 제목
                    content VARCHAR(1000) NOT NULL,   				-- 내용
                    author VARCHAR(16),   							-- 작성자
                    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    -- 등록일
                    visit INT DEFAULT 0,   							-- 조회수
                    lev INT DEFAULT 0, 								-- 질문(0), 답변(1)
                    par INT DEFAULT 0,										-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
                    secret BOOLEAN DEFAULT false,				    -- 비밀글 유무
                    FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev, secret) VALUES('질문1', '질문입니다. 1', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=1;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문2', '질문입니다. 2', 'park', 0, true);

UPDATE qna SET par=qno WHERE lev=0 AND qno=2;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문3', '질문입니다. 3', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=3;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문4', '질문입니다. 4', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=4;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문5', '질문입니다. 5', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=5;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문6', '질문입니다. 6', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=6;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문7', '질문입니다. 7', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=7;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문8', '질문입니다. 8', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=8;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문9', '질문입니다. 9', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=9;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문10', '질문입니다. 10', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=10;

-- 답변

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문1에 대한 답변', '답변입니다. 1', 'admin', 1, 1, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문2에 대한 답변', '답변입니다. 2.', 'admin', 1, 2, true);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문3에 대한 답변', '답변입니다. 3', 'admin', 1, 3, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문4에 대한 답변', '답변입니다. 4', 'admin', 1, 4, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문5에 대한 답변', '답변입니다. 5', 'admin', 1, 5, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문6에 대한 답변', '답변입니다. 6', 'admin', 1, 6, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문7에 대한 답변', '답변입니다. 7', 'admin', 1, 7, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문8에 대한 답변', '답변입니다. 8', 'admin', 1, 8, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문9에 대한 답변', '답변입니다. 9', 'admin', 1, 9, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문10에 대한 답변', '답변입니다. 10', 'admin', 1, 10, false);

COMMIT;

-- QnA 리스트 뷰 생성 
create view qnalist1 AS  (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.visit AS visit, a.lev AS lev,
       a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);

-- qna JOIN & VIEW 생성 ( 내가 쓴 글에 이용)
CREATE VIEW qnalist2 AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.visit AS visit, a.lev AS lev,
                                a.par AS par, b.id AS id FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);


-- Notice 댓글 테이블 생성
​
DROP TABLE notice_comment;

create table notice_comment(
   cno INT PRIMARY KEY AUTO_INCREMENT,
   nno INT,
   author VARCHAR(16) NOT NULL,
   resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   content VARCHAR(200),
   FOREIGN KEY(nno) REFERENCES notice(nno) ON DELETE CASCADE
);
​
-- 공지사항 댓글 더미 데이터 추가
INSERT INTO notice_comment(nno, author, content) VALUES(1, 'park', '댓글 기능 더미데이터1');
INSERT INTO notice_comment(nno, author, content) VALUES(2, 'park', '댓글 기능 더미데이터2');
INSERT INTO notice_comment(nno, author, content) VALUES(3, 'kang', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(4, 'so', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(5, 'kang', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(6, 'kang', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(7, 'park', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(8, 'so', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(1, 'kang', '댓글 기능 더미데이터3');
INSERT INTO notice_comment(nno, author, content) VALUES(1, 'so', '댓글 기능 더미데이터3');
​
-- notice comment 리스트 뷰 생성 
create view noticelist AS (SELECT a.cno AS cno, a.nno as nno, a.content AS content, a.author AS author, a.resdate AS resdate,
       b.name AS name FROM notice_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);
      
-- qna 댓글 테이블 생성
​
create table qna_comment(
   cno INT PRIMARY KEY AUTO_INCREMENT,
   qno INT,
   author VARCHAR(16) NOT NULL,
   resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   content VARCHAR(200),
   FOREIGN KEY(qno) REFERENCES qna(qno) ON DELETE CASCADE
);
​
-- 더미 데이터 추가
INSERT INTO qna_comment(qno, author, content) VALUES(1, 'park', '댓글 기능 더미데이터1');
INSERT INTO qna_comment(qno, author, content) VALUES(3, 'park', '댓글 기능 더미데이터2');
INSERT INTO qna_comment(qno, author, content) VALUES(3, 'kang', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(4, 'so', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(7, 'kang', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(8, 'kang', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(8, 'park', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(2, 'so', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(1, 'kang', '댓글 기능 더미데이터3');
INSERT INTO qna_comment(qno, author, content) VALUES(1, 'so', '댓글 기능 더미데이터3');
​
-- qna comment 리스트
create view qnacommentlist AS (SELECT a.cno AS cno, a.qno as qno, a.content AS content, a.author AS author, a.resdate AS resdate,
       b.name AS name FROM qna_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);


SELECT n.nno, COUNT(nc.cno) AS count
        FROM notice n
            LEFT JOIN notice_comment nc ON n.nno = nc.nno
        GROUP BY n.nno;