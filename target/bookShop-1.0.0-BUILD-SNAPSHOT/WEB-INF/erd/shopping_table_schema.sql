use bookshop;

-- ȸ������ ���̺�
CREATE TABLE t_shopping_member(
                                  `member_id` varchar(20) PRIMARY KEY comment 'ȸ�����̵�',
                                  `member_pw` varchar(30) NOT NULL comment '��й�ȣ',
                                  `member_name` varchar(50) NOT NULL comment '�̸�',
                                  `member_gender` varchar(10) comment '����',
                                  `member_hp` varchar(20) comment '�޴�����ȣ',
                                  `smssts_yn` varchar(5) comment '���ڼ��ŵ��ǿ���',
                                  `member_email` varchar(20) comment '�̸���',
                                  `emailsts_yn` varchar(5) comment '�̸��ϼ��ŵ��ǿ���',
                                  `zipcode` varchar(20) comment '�����ȣ',
                                  `road_address` varchar(50) comment '���θ�',
                                  `jibun_address` varchar(50) comment '����',
                                  `namuji_address` varchar(50) comment '�������ּ�',
                                  `member_birth` varchar(20) comment '����',
                                  `member_birth_gn` varchar(20) comment '�������',
                                  `join_date` date DEFAULT current_date comment '������',
                                  `del_yn` varchar(5) default 'n' comment 'Ż�𿩺�'
);
-- �ֹ� ���̺�
CREATE TABLE t_shopping_order
(
    order_seq_num bigint PRIMARY KEY comment '�ֹ���ǰ�Ϸù�ȣ',
    order_id bigint comment '�ֹ���ȣ',
    member_id varchar(20) comment '�ֹ��ھ��̵�', -- FK
    goods_id bigint comment '��ǰ��ȣ', -- FK
    orderer_name varchar(50) comment '�ֹ����̸�',
    goods_title varchar(100) comment '��ǰ�̸�',
    order_goods_qty smallint comment '�ֹ�����',
    goods_sales_price int comment '��ǰ�ǸŰ���',
    goods_file_name varchar(60) comment '��ǰ�̹��������̸�',
    receiver_name varchar(50) comment '�������̸�',
    receiver_hp varchar(20) comment '������ �޴�����ȣ',
-- �÷� ���� 	"receiver_hp2" varchar(20) comment '������ �޴�����ȣ2',
-- �÷� ����	"receiver_hp3" varchar(20) comment '������ �޴�����ȣ3',
-- �÷� ���� 	"receiver_tel1" varchar(20) comment '������ ���� ��ȭ��ȣ1',
-- �÷� ����	"receiver_tel2" varchar(20) comment '������ ���� ��ȭ��ȣ2',
-- �÷� ����	"receiver_tel3" varchar(20) comment '������ ���� ��ȭ��ȣ3',
    delivery_address varchar(100) comment '����ּ�',
    delivery_method varchar(40) comment '��۹��',
    delivery_message varchar(300) comment '����� ���� �޽���',
    gift_wrapping varchar(20) comment '��ǰ ���忩��',
    pay_method varchar(200) comment '�������',
    card_com_name varchar(50) comment '����ī��ȸ���̸�',
    card_pay_month varchar(20) comment '�Һΰ�����',
    pay_orderer_hp_num varchar(20) comment '�޴��� �����ȣ',
    delivery_state varchar(20) default 'delivery_prepared' comment '��ǰ��ۻ���',
    pay_order_time datetime default current_time comment '�����ð�',
    orderer_hp varchar(20) comment '�ֹ��� �޴�����ȣ'
);
-- ��ǰ���� ���̺�
CREATE TABLE t_shopping_goods(
                                 goods_id bigint AUTO_INCREMENT PRIMARY KEY comment '��ǰ��ȣ',
                                 goods_title varchar(100) NOT NULL comment '��ǰ����',
                                 goods_writer varchar(50) NOT NULL comment '�����̸�',
                                 goods_publisher varchar(50) NOT NULL comment '���ǻ��̸�',
                                 goods_price int NOT NULL comment '��ǰ����',
                                 goods_sales_price int NOT NULL comment '��ǰ�ǸŰ�',
                                 goods_published_date date NOT NULL comment '��ǰ������',
                                 goods_total_page int NOT NULL comment '��ǰ����������',
                                 goods_isbn varchar(50) NOT NULL comment 'isbn��ȣ',
                                 goods_delivery_price int NOT NULL comment '��ۺ�',
                                 goods_delivery_date date NOT NULL comment '��ǰ�����',
                                 goods_file_name varchar(50)comment '�̹������ϸ�',
                                 goods_status varchar(50) NOT NULL comment '��ǰ�з�',
                                 goods_intro varchar(2000) NOT NULL comment '��ǰ�Ұ�',
                                 goods_writer_intro varchar(2000) comment '���ڼҰ�',
                                 goods_publisher_comment varchar(2000) comment '���ǻ���',
                                 goods_recommendation varchar(2000) comment '��ǰ��õ��',
                                 goods_contents_order longtext comment '����',
                                 goods_entered_date date NOT NULL DEFAULT current_date comment '��ǰ�԰���'
);
-- ��ǰ �̹��� ���� ���̺�
CREATE TABLE t_goods_detail_image(
                                     image_id bigint PRIMARY KEY comment '�̹�����ȣ',
                                     goods_id bigint NOT NULL comment '��ǰ��ȣ',
                                     file_name varchar(50) NOT NULL comment '�̹������ϸ�',
                                     reg_id varchar(20) NOT NULL comment '����ھ��̵�',
                                     file_type varchar(40) NOT NULL comment '�̹�����������',
                                     goods_credate date DEFAULT current_date comment '�����'
);
-- ��ٱ��� ���̺�
CREATE TABLE t_shopping_cart(
                                cart_id int NOT NULL AUTO_INCREMENT PRIMARY KEY comment '��ٱ��Ϲ�ȣ',
                                member_id varchar(20) NOT NULL comment 'ȸ�����̵�',
                                goods_id bigint NOT NULL comment '��ǰ��ȣ',
                                cart_goods_qty smallint NOT NULL comment '��ǰ����',
                                credate date DEFAULT current_date comment '�����'
);
-- �Խ��� ���̺�
CREATE TABLE board (
                       brd_id bigint AUTO_INCREMENT PRIMARY KEY comment '�Խù� ��ȣ',
                       goods_id bigint comment '��ǰ��ȣ',
                       member_id varchar(20) NOT NULL comment 'ȸ�� ���̵�',
                       title varchar(100) NOT NULL comment '����',
                       content varchar(3000) NOT NULL comment '����',
                       reg_date date NOT NULL DEFAULT current_date comment '�ۼ���',
                       cate tinyint NOT NULL comment '�Խ��� ����',
                       view_cnt int NOT NULL DEFAULT 0 comment '��ȸ��',
                       com_status varchar(10) DEFAULT 'n' comment '�亯����'
);
-- �Խ��� ���� ���̺�
CREATE TABLE `categories` (
                              cate_no int AUTO_INCREMENT PRIMARY KEY comment '�Խ��� ��ȣ',
                              cate tinyint NOT NULL UNIQUE KEY comment '�Խ��� ����',
                              cate_name varchar(20) DEFAULT NULL comment '�Խ��� �̸�'
);
-- �Խ��� ��� ���̺�
CREATE TABLE `board_comment` (
                                 `com_id` bigint AUTO_INCREMENT PRIMARY KEY comment '��� ��ȣ',
                                 `brd_id` bigint NOT NULL comment '�Խù� ��ȣ',
                                 `com_content` varchar(100) NOT NULL comment '��� ����',
                                 `member_id` varchar(20) NOT NULL comment 'ȸ�� ���̵�',
                                 `reg_date` date NOT NULL DEFAULT current_date comment '�ۼ���',
                                 `mod_date` date DEFAULT NULL comment '������'
);
-- ��� ���� ���̺�
CREATE TABLE member_auth (
                             member_id varchar(20) comment 'ȸ�� ���̵�',
                             auth varchar(20) not null comment '���Ѹ�'
);

-- ���̵�����

-- t_shopping_member
insert into t_shopping_member(member_id, member_pw, member_name, member_gender, member_hp, smssts_yn, member_email, emailsts_yn, zipcode, road_address, jibun_address, namuji_address, member_birth, member_birth_gn) values
    ('lee', '1212', '�̺���', '101', '010-2222-3333','Y','lee@test.com','Y','13547','��� ������ �д籸 ���� 25(������)','��� ������ �д籸 ������ 79-1','��Ű���� 101ȣ','2000-5-10',2);
insert into t_shopping_member(member_id, member_pw, member_name, member_gender, member_hp, smssts_yn, member_email, emailsts_yn, zipcode, road_address, jibun_address, namuji_address, member_birth, member_birth_gn) values
    ('admin', '1212', '����', '101', '010-1111-2222','Y','admin@test.com','Y','06253','���� ������ ������� 298(���ﵿ)','���� ������ ���ﵿ 838','��Ű���� 101ȣ','2000-5-10',2);


-- shopping_goods
INSERT INTO T_SHOPPING_GOODS
(GOODS_ID, GOODS_TITLE, GOODS_WRITER, GOODS_PUBLISHER, GOODS_PRICE, GOODS_SALES_PRICE, GOODS_PUBLISHED_DATE, GOODS_TOTAL_PAGE, GOODS_ISBN, GOODS_DELIVERY_PRICE, GOODS_DELIVERY_DATE, GOODS_STATUS, GOODS_INTRO, GOODS_WRITER_INTRO, GOODS_PUBLISHER_COMMENT, GOODS_RECOMMENDATION, GOODS_CONTENTS_ORDER)
VALUES(344, '�ʺ��ڸ� ���� �ڹ� ���α׷���', '�̺���', '������', 30000, 27000, '2018-10-02', 996, '2323454566778', 2000, '2018-10-18 ', 'newbook', '7777', '77777', '7777', '7777', NULL);

INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(319, 344, 'image1.jpg', 'admin', 'main_image');

INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(320, 344, 'react_detail1.jpg', 'admin', 'detail_image1');


INSERT INTO T_SHOPPING_GOODS
(GOODS_ID, GOODS_TITLE, GOODS_WRITER, GOODS_PUBLISHER, GOODS_PRICE, GOODS_SALES_PRICE, GOODS_PUBLISHED_DATE, GOODS_TOTAL_PAGE, GOODS_ISBN, GOODS_DELIVERY_PRICE, GOODS_DELIVERY_DATE, GOODS_STATUS, GOODS_INTRO, GOODS_WRITER_INTRO, GOODS_PUBLISHER_COMMENT, GOODS_RECOMMENDATION, GOODS_CONTENTS_ORDER)
VALUES(354, '����� ������', '�̺���', '������', 27000, 21600, '2018-10-02', 996, '2323454566778', 2000, '2018-10-18 ', 'newbook', '7777', '77777', '7777', '7777', NULL);

INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(342, 354, '����� ������_����.jpg', 'admin', 'main_image');

INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(343, 354, '����� ������_��.jpg', 'admin', 'detail_image1');

INSERT INTO T_SHOPPING_GOODS
(GOODS_ID, GOODS_TITLE, GOODS_WRITER, GOODS_PUBLISHER, GOODS_PRICE, GOODS_SALES_PRICE, GOODS_PUBLISHED_DATE, GOODS_TOTAL_PAGE, GOODS_ISBN, GOODS_DELIVERY_PRICE, GOODS_DELIVERY_DATE, GOODS_FILE_NAME, GOODS_STATUS, GOODS_INTRO, GOODS_WRITER_INTRO, GOODS_PUBLISHER_COMMENT, GOODS_RECOMMENDATION, GOODS_CONTENTS_ORDER)
VALUES(400, '��¥ ���� �ǹ� ����', '������(������)', '������', 21000, 18900,
       '2022-02-15', 508, '9791191600704', 0,
       '2024-01-05', '�ǹ�����_����.jpg', 'bestseller',
-- goods intro
       '���� ���� ��Ȱ 10���� �ǹ� ���Ͽ�� ���� ��Ʃ�� ä���� ��ϸ鼭 ���� ������ �������� ����� �ذ��� �� �ִ� �پ��� ���� ����� ��Ҵ�. ����¥ ���� �ǹ� ������ �� ���̸� ���� �� ó���� ������� �����ϰ�, ���߷��� �ŵ쳯 �� �ִ�!
       ���� �ð� ������ ������ ������ �ŵ��Ͽ���, Office 365���� Microsoft 365�� �귣����� �����ϱ���� �پ��� ���, Ư�� ���� �迭 �Լ��� �߰��Ǹ鼭 ��ũ�θ� ������� �ʰ� ���� �κ��� �ذ��� �� �ֵ��� �����Ǿ���. �� å���� �Ұ��ϴ� ����� �� �ǹ� Ȱ�� ����� �����ٸ� ����� �����Ϳ��� Ư�� �ڷḦ �����ϰ� �м��ϱ�, �м��� �ڷḦ �Ѵ��� ���� ���� �ð�ȭ�ϱ�, �ݺ��Ǵ� �۾��� ȿ�������� �����ϱ� �� ȸ�翡�� ���ϴ� ���� ��� �ɷ��� ����� �پ���� �� ���� ���̴�.',
-- writer intro
       '�������� ���� ��Ȱ�� �ϸ鼭 �ǹ� ������ ������, ����� ������ 50���� �������ο����� ��Ʃ�� ä�ΰ� ���� ���� Ȩ�������� ��Ѵ�. ��� �������� ���߷��� �Ǳ� �ٶ��, ���� �� ���� ������ ���� ���� ���� �ʼ� ���İ� �ٽ� ��� �� ȸ�翡�� �� �ʿ��� ���� ���Ͽ츦 ����ġ�� ���� ������ �ִ�. ����ũ�μ���Ʈ���� �ְ� �������� ������ ���� MVP�̸�, �Ｚ����, ���̹�, ����� ����û �� ���� ��� �� ����� ������� ���� �� �������� �����ϰ� �ִ�.',
-- publisher comment
       '���� ������ ���� �׸�, �ǹ� Ȱ�뵵 100%, ��¥ ���� ���� ������ Ȱ���Ͽ� ���ʴ� ������, �ǹ��� ����� ��� �� �ֽ��ϴ�. 100% ������ ���� ������ ���Ǵ� ����!
       ��� ����
       �� ������ �������� ���� �ۼ����� ���� ��κ��� ������ ó���ϴ� ������
       �� �⺻���� ���� ������ ������, �� ó���� ������ ���Ի��
       �� ������ �м� �� �ð�ȭ�� ���� ������ ����Ϸ��� ������
       �� �Ϻ��ϰ� �غ��ؼ� ����ϰ� ���� ���� ������', NULL,
-- GOODS_CONTENTS_ORDER
       'CHAPTER 01 ���ۺ��� ���ٸ� �ǹ����� ���� Ȱ��
       CHAPTER 02 �ǹ��ڶ�� �ݵ�� �˾ƾ� �� ���� Ȱ��
       CHAPTER 03 ������ �޶����� ���� Ȱ���
       CHAPTER 04 �ϼ��� ���� ���� ���� �� ����ϱ�
       CHAPTER 05 ������ �������� ������ ���͸�����
       CHAPTER 06 ������ �ڵ�ȭ �� �м��� ���� ǥ & �ǹ� ���̺�
       CHAPTER 07 ���� Ȱ���� 10%�� ä�� �� �⺻ & �ʼ� �Լ� ������
       CHAPTER 08 �ǹ����� �ʿ��� ���� ������ �ð�ȭ�� ��� ��
       APPENDIX �� ���� ��');
-- detail image
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(10400, 400, '�ǹ�����_����.jpg', 'admin', 'main_image');
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(11400, 400, '�ǹ�����_��1.jpg', 'admin', 'detail_image1');
INSERT INTO T_SHOPPING_GOODS
(GOODS_ID, GOODS_TITLE, GOODS_WRITER, GOODS_PUBLISHER, GOODS_PRICE, GOODS_SALES_PRICE, GOODS_PUBLISHED_DATE, GOODS_TOTAL_PAGE, GOODS_ISBN, GOODS_DELIVERY_PRICE, GOODS_DELIVERY_DATE, GOODS_FILE_NAME, GOODS_STATUS, GOODS_INTRO, GOODS_WRITER_INTRO, GOODS_PUBLISHER_COMMENT, GOODS_RECOMMENDATION, GOODS_CONTENTS_ORDER)
VALUES(401, '������ ���õ� ���� ưư�ϰ� �����ϱ�', '�ǿ��ٸ� ���糪���� �� �̷̹� ����', '���', 27500, 24750,
       '2023-12-13', 380, '9791140707591', 0, '2024-01-05', '�����ڸ�������_����.jpg', 'newbook',
       '����� �ѷ��� ������ �ʴ� ������ �������� �ִ�
       �׸��� �� ������ ����� ����� �ı��ϰ� �ִ�
       �����ϱ� ���ؼ��� �ֺ��� �ٲ��
       ���� �����ϱ� ���ؼ��� �ֺ��� �ٲ�� �Ѵ�. ���� ������ �����ϴ� �ֺ� ȯ���� �ٲ�ٸ�, �״����� ���� ���⸦ ��� �Դ� �ֺ� ����� �ٲ�� �Ѵ�. �������� ���� ������ �����, ������ �����̾ �ָ��ϰ� ���� ���ε���� ���� ������ �ֺ��� ä���� �Ѵ�. �� �ڽ��� ���� ���ε������ �ٲٴ� �����δ� �����ϴ�. �Ҽ� �̵��, �������� ���� ���� Ȱ���ؼ� ���� ���ε���� ���� ������ �� �ֺ��� ä����.
       ����� ���߿��� ��Ż�� ���δ�
       ������ �����ϴ� ��Ҹ� �����ߴٸ� �״����� ����� ������ ���� �ǰ��� ��Ż�� �ʿ��ϴ�. �ǰ��� ��Ż�� �������̳� �����Ѵٰ� �Ǵ� �� �ƴϴ�. ���� �ൿ���� ������ �����ϴ� �ͺ��� �����ؾ� �Ѵ�. ������ �����ϴ� ���, ���̺� �ǿ��� ���� ������ ���ʽ�, �������� ���� ���翡�� ����, ����ũ���½�ũ ���, ������ ���� ��ġ��� ����Ȯ�� ȯȣ����, �Ǹ𵵷ο� Ÿ�̸ӷ� ���Ƿ��� ȿ�������� �����ϰ� �����ϴ� ���� �������. �׸��ϸ� ������ ��ſ��� ���� �� �ִ�.
       ', '(Fiodar Sazanavets)
�ǿ��ٸ��� �ַ� ����ũ�μ���Ʈ ����Ʈ���� ���� ������ �ٷ�� ���õ� Ǯ ���� ���� ����Ʈ���� �����Ͼ��. ���� �ֿ� ���� �оߴ� ASP.NET(�����ӿ�ũ�� �ھ�), SQL ����, ����, ��Ŀ, �繰���ͳ�(IoT), ����ũ�μ��� ��Ű��ó�� �پ��� ����Ʈ���� ����̴�.
�ǿ��ٸ��� ������, ����, �Ҹ�, ö��, ��� �� �پ��� �о߿��� ���ϸ� ����Ʈ���� �����Ͼ ����� �׾Ҵ�. �״� �پ��� ������Ʈ���� �ֵ����� ������ ������ ����Ʈ���� ������ ���� ��Ű��ó�� ������ �о߿����� ����� ������ �׾Ҵ�. ���� �系 ����Ʈ���� ����, ����Ʈ����� IoT �ϵ���� ���� �� �� ����Ʈ���� �پ��� ��� ������ �����ߴ�.
�ǿ��ٸ��� �ٸ� ����鿡�� ���α׷��� ����� ����ġ�� �� ������ �ִ�. �״� �ټ��� å�� ���α׷��� ���¸� �����ߴ�.', NULL, NULL, '1 �� �Ҽ� �̵� ���� ū ���ϱ�
2 ����� ���ͱ� - �� ��ũ�� ���� ����
3 �����ϰ� ������ ������ - ������ ���ز��� �����ϰ� �غ��ϱ�
4 ���� ü�ӹ��� ��¿� ��� ������ �Ǵ°�
5 ���� �����ϱ� - �Ҽ� �̵�� �����ϰ� Ȱ���ϱ�
6 ������ ���ʽ� - ���α׷��Ӱ� �̱� �ر� ���̺� �ǿ��� ��� �� �ִ� ��
7 ������ ������ �������� ���α׷��Ӱ� �Ǵ� �� � ������ �ִ°�
8 ����ũ���½�ũ�� �̷�� ���� �غ��ϱ�
9 ����Ȯ�� ȯȣ���� - ���� ���� ���� �Ϻ� ���
10 �Ǹ𵵷ο� Ÿ�̸ӷ� �� ���� ���ϱ�');
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(10401, 401, '�����ڸ�������_����.jpg', 'admin', 'main_image');
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(11401, 401, '�����ڸ�������_��.jpg', 'admin', 'detail_image1');
INSERT INTO T_SHOPPING_GOODS
(GOODS_ID, GOODS_TITLE, GOODS_WRITER, GOODS_PUBLISHER, GOODS_PRICE, GOODS_SALES_PRICE, GOODS_PUBLISHED_DATE, GOODS_TOTAL_PAGE, GOODS_ISBN, GOODS_DELIVERY_PRICE, GOODS_DELIVERY_DATE, GOODS_FILE_NAME, GOODS_STATUS, GOODS_INTRO, GOODS_WRITER_INTRO, GOODS_PUBLISHER_COMMENT, GOODS_RECOMMENDATION, GOODS_CONTENTS_ORDER)
VALUES(402, 'IT ������ ������(�ƹ��� ������ �� �ִ� IT �̾߱�)', '�ƹ��ؼ�', '���ɺϽ�', 19800, 17820,
       '2024-01-10', 416, '9791192932361', 0, '2024-01-03', 'monsters_����.jpg', 'newbook',
       '���ݱ��� �̷� å�� ������!
       ù �������� �ѱ�� ����, ������ ���� ������� �Ϻ��� ���Ե��� ������ ���̴�!
       �� å�� IT ������ ��ȭ�� Ǯ� ������, IT�� ���ʸ� Ȯ���ϰ� �ٷ� ����� �� �ִ� ������ �����մϴ�. ���� �پ��� ĳ���͵��� �����Ͽ� ������ ���ҿ� �°� ���� �ڵ带 �����ݴϴ�. �׸��� �ο������� �ʿ��� ������ IT ���� �ּ����� ä�� �־�����, �������ڵ� �����ϱ� ���� �� �濡 �����߽��ϴ�. �ƿ﷯ �����ڵ� ��ó ������ IT�� ���� �̾߱⵵ �߰��� ����� �ڳʷ� ��ҽ��ϴ�.
       ������ ������ 0�� 1�� ������ ���̰����� ������ �� �˾Ҵٸ�, �� å�� ���� �ڹ��� ĳ���͵�� �����غ��⸦ �ٶ��, ������ ���븦 Ű��� �θ�� ���� ���� ������ IT ���缭�ε� ��õ�մϴ�.', '�����ڵ��� �׷���� R&D ��ȹ�� ������� ����ý��� �� ���� ����Ʈ���� ���� ������ ����ߴ�. ��� �� �� ���� IT ��ŸƮ���� â�������� ���̹� ������ ���ѽ� �ϴ� ��������� ���� ����� ���� �Ǿ��µ�, �� ������ IT ȸ�翡 ���̹� ���� �����Ͼ�� ����ϰ� �� ��Ⱑ �Ǿ���. ����� �ܱ��� IT ȸ���� �����Ͼ ���� Head�� �ð� ������, ���� ��̷� �ν�Ÿ�׷��� IT ����� ĳ����ȭ ���� �ø��� ���� ��ȭ�� å���� �������� �Ǿ���.', '������� �ͼ���
�������� ģ����
������ ������ ĳ���ͷ� ��������!
�� å�� �۾��̰� ���� ��̷� IT ����� ĳ����ȭ���� �ν�Ÿ�׷��� �ø��� ���� ��ȭ�� å���� ���� ���Դϴ�. �� å�� ���� �۾��̰� �����ִ� ������ ������ ������(?)�� ������ �ִ��� ���� ������ �� �ְ�, �츮�� �𸣰� �����ļ� ū ���� ����(�� : �ڵ��� �޹���)�Ǵ� ���� �������� ���� �� �� �ֽ��ϴ�. �� �� ���� ���ϰ� ������ ������ ������� �ϴ� �ٶ��Դϴ�.', NULL, NULL);
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(10402, 402, 'monsters_����.jpg', 'admin', 'main_image');
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(11402, 402, 'monsters_��.jpg', 'admin', 'detail_image1');
INSERT INTO T_SHOPPING_GOODS
(GOODS_ID, GOODS_TITLE, GOODS_WRITER, GOODS_PUBLISHER, GOODS_PRICE, GOODS_SALES_PRICE, GOODS_PUBLISHED_DATE, GOODS_TOTAL_PAGE, GOODS_ISBN, GOODS_DELIVERY_PRICE, GOODS_DELIVERY_DATE, GOODS_FILE_NAME, GOODS_STATUS, GOODS_INTRO, GOODS_WRITER_INTRO, GOODS_PUBLISHER_COMMENT, GOODS_RECOMMENDATION, GOODS_CONTENTS_ORDER)
VALUES(403, 'AWS ������', '����� , ����ȣ , �輮�� ', '���', 38000, 34200, '2023-10-20', 480, '9791140706662', 0, '2024-01-03', 'AWS ������_����.jpg', 'bestseller', '�̷а� �ǽ����� ���� AWS!
�Թ��ڿ��� �� �´� �������� �����غ���!
AWS�� �پ��� �ۺ� Ŭ���� ���񽺸� �����ϰ� �ְ�, ���� Ŭ���� �÷��� �߿��� ������ 1���� �����ϰ� �ִ�. �̹� ���� ����� AWS�� �����߰ų� ������ ����ϰ� �ִ� ��ŭ, AWS�� ������ ����� �� �˰� �־�� �Ѵ�. ��AWS ���������� ��ǻ��, ��Ʈ��ŷ, ���Ϻл�, ���丮��, �����ͺ��̽�, IAM, ���� �����ϸ� �� �ֿ� ���񽺸� �߽����� ������ �����Ѵ�. �̷��� ������ �ǽ����� ���� ���񽺸� �ٷﺸ�� ������ ��� �����ϴ��� ����� ���� �� �ִ�. ������ �忡���� AWS ���񽺸� Ȱ���� ������Ʈ �ǽ����� �غ���. AWS�� ��𼭺��� ��� �����ؾ� ���� �𸣰ڴٸ� �� å���� ���� �Թ��غ���!', '�����
��� �̷��̳� ������ ���� ������ ���� Ȯ���ϰ�, ����ȭ�� ���·� �����ϴ� ���� �����Ѵ�. �̷��� ��ſ��� �������� ���� Ŭ���� ������ ���͵� �׷쿡�� �������� �����ϸ� ���� ���� Ȱ���� �ϰ� �ִ�. ����, Ŭ���� ���� ������ �����ϰ� �¶��� ���ǵ� ���ε��ϰ� �ִ�.
����ȣ
��Ʈ��ũ �������� 10�� �Ѱ� �����ϰ� �ְ�, ��ŸƮ������ ������ ��ϴ� ����ɽ� �����Ͼ�� ���ϰ� �ִ�. Ŭ���� ������ ���� ������ �н��ϰ�, ������ �����ϴ� ���͵����� ����� ��ϰ� �ִ�.', '�ƴ� ��ŭ ������ ���񽺸� �����ϰ�
ȿ�������� ��� �� �ִ�!
AWS�� ������ 1���� ���ϴ� Ŭ���� ���� �÷�������, �� ���迡 ��ģ �������� Ŭ���� ������ �����ϰ� �ִ�. ������ �پ��� �䱸�� ���� Ŭ���� ��ǻ�� ���񽺴� ���������� �����Ͽ��� �̷� ���� �����ϴ� ���񽺿� ��ɵ� �پ�������. AWS�� 200�� �̻��� Ŭ���� ���񽺸� �����ϸ�, �̸� �� Ȱ���ϱ� ���ؼ��� ���񽺸� �� �����ϰ� ������ �ʿ��� ���񽺸� ������ ��� ȿ�������� ��ϴ� ��ų�� �ʿ��ϴ�.
�� å�� ��ǻ��, ��Ʈ��ŷ, ���Ϻл�, ���丮��, �����ͺ��̽� �� ���� ���� ����ϴ� ���񽺸� �߽����� AWS�� �����ϴ� ���񽺸� �����Ѵ�. �⺻ ���� �ܿ��� ��� ��Ʈ��ŷ ���񽺿� ���� ������Ʈ�� ������ �⺻���� �������� ��� ���� �� �ִ�. �������� AWS �⺻ ����� �ٽ� ����� ������ ������ ���� �ϸ鼭�� ������ �� �ְ� �� �帶�� �ǽ� �ڳʸ� �־�����, �н��� �ڿ� �ٽ� ������ �� �ְ� ����࡯ �ڳʵ� �־ ����� �����ϰ� ���� ������� �ȼ������� å�̴�. �� �� �о�� �������� �� �ƴ�, ���������� �Թ��ϰ� �ʹٸ� �� å���� �����غ��� �����ϰ� ��õ�Ѵ�.', NULL, '1�� AWS��
1.1 Ŭ���� ��ǻ��
1.2 AWS ����
1.3 �ǽ� AWS �����ϱ� - ���� Ƽ��
2�� AWS ��ǻ�� ����
2.1 AWS ��ǻ�� ����
2.2 Amazon EC2 �Ұ�
2.3 �ǽ� Amazon EC2 �ν��Ͻ� ���� �� �����ϱ�
3�� AWS ��Ʈ��ŷ ����
3.1 ��Ʈ��ŷ�̶�
3.2 AWS ��Ʈ��ŷ �Ұ�
3.3 Amazon VPC �Ұ� 82
3.4 �ǽ� Amazon VPC�� �ۺ� �� �����̺� ����� �����ϱ�
4�� AWS ���Ϻл� ����
4.1 Amazon ELB ��� �Ұ�
4.2 �ǽ� ALB�� NLB�� �̿��� �ε� �뷱�� �����ϱ�
5�� AWS ���丮�� ����
5.1 ���丮�� ����
5.2 ���丮�� ���� �� �ֿ� ���
5.3 Amazon EBS
5.4 Amazon S3
5.5 �ǽ� �پ��� AWS ���丮�� ���� �����ϱ�
6�� AWS �����ͺ��̽� ����
6.1 �����ͺ��̽��� DBMS
6.2 AWS �����ͺ��̽� ����
6.3 �ǽ� �� ������ Amazon RDS �����ϱ�
7�� AWS ��� ��Ʈ��ŷ ����
7.1 DNS��
7.2 Amazon Route 53 ����
7.3 CDN�̶�
7.4 Amazon CloudFront��
7.5 �ǽ� Amazon CloudFront�� CDN ���� �����ϱ�
8�� AWS IAM ����
8.1 ��� �Ұ�
8.2 AWS IAM
8.3 �ǽ� AWS IAM ����� ���� �� ��å, ���� ���� Ȯ���ϱ�
9�� AWS ���� �����ϸ� ����
9.1 �����ϸ�
9.2 AWS ���� �����ϸ� ����
9.3 �ǽ� Amazon EC2 ���� �����ϸ� �����ϱ�
10�� ����������
10.1 ���������� �Ұ�
10.2 �ǽ� ���������� �����ϱ�
11�� ���������� ����ȭ
11.1 �ǽ� �Ұ�
11.2 �ǽ� 1 AWS ���񽺸� Ȱ���� ���������� �����ϱ�
11.3 �ǽ� 2 Ȯ�强�� �������� ����� ���������� �����ϱ�');
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(10403, 403, 'AWS ������_����.jpg', 'admin', 'main_image');
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(11403, 403, 'AWS ������_��.jpg', 'admin', 'detail_image1');
INSERT INTO T_SHOPPING_GOODS
(GOODS_ID, GOODS_TITLE, GOODS_WRITER, GOODS_PUBLISHER, GOODS_PRICE, GOODS_SALES_PRICE, GOODS_PUBLISHED_DATE, GOODS_TOTAL_PAGE, GOODS_ISBN, GOODS_DELIVERY_PRICE, GOODS_DELIVERY_DATE, GOODS_FILE_NAME, GOODS_STATUS, GOODS_INTRO, GOODS_WRITER_INTRO, GOODS_PUBLISHER_COMMENT, GOODS_RECOMMENDATION, GOODS_CONTENTS_ORDER)
VALUES(404, 'CODE', '���� ������ ����(��) �� ������ ����', '�λ���Ʈ', 35000, 31500, '2023-12-22', 624, '9788966264285', 0, '2024-01-03', 'CODE_����.jpg', 'newbook', '23�� ���� ���ƿ� ��ǻ�� ���� �о��� �ʵ���!
20���� �Ѵ� ���� ���� ��ǻ�� ���� �о��� �ʵ����μ� ���� ���ڸ� �����ϰ� ���� ��CODE���� ���ο� ��ǻ�� �ô뿡 ���� �����Ǿ����ϴ�. ��ǻ�� ������ ��н����� �̾߱���� ���� �� å�� �� ¥�� �Ϸ���Ʈ�� �����ϱ� ���� ������ ���ؼ� ��ǻ�Ϳ� ���� ���������� Ǯ����ϴ�. ������, ���� �����, �ü�, �� ������� ���ָ� ���ؼ� ��ǻ�ÿ� ���� ��� �� ������, �ΰ��� ��â���� ���뿡 ���� �浿�� �츮�� ���� ����ϴ� ��� ���� ��ġ�� � ������ ���ƴ��� Ȯ���� �� �ֽ��ϴ�.', '(Charles Petzold)
35�� ���� ���ο� ��ǻ�Ϳ� ���α׷��ֿ� ���� ������ å�� ��Դ�. �װ� �� å���δ� ��Programming Widows���� ������ 12�� �̻��� ���α׷��� å�� ��The Annotated Turing: A Guided Tour through Alan Turing��s Historic Paper on Computability and the Turing Machine(�ּ����� �ؼ��� Ʃ��: ��� ���ɼ��� Ʃ�� �ӽ��� �ٷ� �ٷ� Ʃ���� ������ ���� ���� �ؼ��� �Բ��ϴ� ����)���� �ִ�. ���� �״� ������������ �Ҽ������� �Ƴ��� ����巹 �ó�(Deirdre Sinnott)�� �ϴ�, ���̵��� �̸��� ���� �� ���� ����̿� �Բ� ���忡 ��� �ִ�. ���� ������Ʈ www.charlespetzold.com�� ��ϰ� �ִ�.', '20���� �Ѵ� ���� ���� ��ǻ�� ���� �о��� �ʵ����μ� ���� ���ڸ� �����ϰ� ���� ��CODE���� ���ο� ��ǻ�� �ô뿡 ���� ���Ӱ� �����Ǿ����ϴ�. ��ǻ�� ������ ��н����� �̾߱���� ���� �� å�� �� ¥�� �Ϸ���Ʈ�� �����ϱ� ���� ������ ���ؼ� ��ǻ�Ϳ� ���� ���������� Ǯ��� å�Դϴ�. ������, ���� �����, �ü�, �� ������� ���ָ� ���ؼ� ��ǻ�ÿ� ���� ��� �� ������, �ΰ��� ��â���� ���뿡 ���� �浿�� �츮�� ���� ����ϴ� ��� ���� ��ġ�� ��� ������ ���ƴ��� Ȯ���� �� �ֽ��ϴ�.
�̹� �����ǿ����� ��� ����Ʈ ����� �������� �ܼ��� �⺻ ������� ���ս��� ���� ������ �۾��� ������ �� �ֵ��� ������� �߾� ó�� ��ġ�� ���� ��Ʈ ������ ����Ʈ �������� �������� ����� Ž���ϰ� �ֽ��ϴ�. ���� ���ڴ� �� å�� ������ �����ϴ� ������Ʈ�� CodeHiddenLanguage.com�� �����, �� å�� ������ �ֿ� ȸ�ε��� ������ �׷��� �ִϸ��̼����� ǥ�������ν� �ش� ȸ�θ� ���� ���� ������ �� �ְ� �Ͽ����ϴ�.
�̹� �����ǿ����� ������ ���뿡�� ���� �κ��� �����Ǿ�����, ������ ���� ���ο� ����� �߰��Ǿ����ϴ�.
18�� �ð踦 ����� ���ô�
21�� ��� �� ��ġ
22�� �������Ϳ� ����
23�� CPU�� ���� ��ȣ��
24�� ����, ����, �׸��� ȣ��
28�� ���� �극��', '����ȣ (��Ŭ�� �ڵ塷 ����)
����CODE���� �߻�ȭ ������ ���缭 ��Ʈ�� ����Ʈ�� ����� �����е��� �ȳ��ϴ� å�Դϴ�. �̷��� �����ν� �Ų��� �ö�ƽ ���̽� �ڿ� ���� �ִ� ��ǻ���� ����� �ϳ��� ĳ�� �� �ֵ��� �����ݴϴ�. �� å�� ���� ��̿� �����̶�� �� ���� �䳢�� ���ÿ� �����鼭 ����Ʈ���� ���߰� ���� �ذ� ������ �� �ܰ� �������� �ٶ��ϴ�."
���� �Ѽ���(Scott Hanselman) (����ũ�μ���Ʈ ��Ʈ�� ���α׷� �������� Hanselminutes ��ĳ��Ʈ ������)
"������ ��CODE���� ��ÿ͵� ���ҽ��ϴ�. ���� ���� �ǳ״� ù ��° ���α׷��� ���� å�̾����ϴ�. �̾߱�� �����ؼ� �پ��� ������ ���� ���� �׾� �÷� �ڵ�� �ƴ϶� �ý��۱��� ������ �� �ְ� �� �־����ϴ�. �� å�� �ڵ�� ���α׷��ֿ� ���� å�� ���ÿ� �ý����� ���� �߻�ȭ�� ���� å�̱⵵ �մϴ�. �츮�� �ϻ������� ���ϴ� ��ǻ�� �ý��۰� ������ �����ؼ� ������ �� �ֵ��� ���� ������ �Ǹ��� ���� ���̿� ������ ���� ������ ������ �󸶳� ���� �����ϴ��� �˷� �ݴϴ�.', 'Chapter 1 ģ�� ģ������ ��ȭ
Chapter 2 ��ȣ�� ����
Chapter 3 ���ڿ� ���� ��ȣ
Chapter 4 ������ ������ ���ô�
Chapter 5 ����� �Ÿ����� �̾߱��ϱ�
Chapter 6 ���� ����ġ
Chapter 7 ���Ű� ������
Chapter 8 �����̿� �� ����Ʈ
Chapter 9 �츮�� ����ϴ� �� ���� ���ڵ�
Chapter 10 ������ �̿��� ��
Chapter 11 ��Ʈ, ��Ʈ, ��Ʈ
Chapter 12 ����Ʈ�� 16����
Chapter 13 ASCII���� �����ڵ����
Chapter 14 �� ����Ʈ�� �����ϱ�
Chapter 15 �����ε� �׷���?
Chapter 16 �׷��ٸ� ������ ����?
Chapter 17 �ǵ��� �ø��÷�
Chapter 18 �ð踦 ����� ���ô�
Chapter 19 �޸𸮸� ����� ���ô�
Chapter 20 ������ �ڵ�ȭ��Ű��
Chapter 21 ��� �� ��ġ
Chapter 22 �������Ϳ� ����
Chapter 23 CPU�� ���� ��ȣ��
Chapter 24 ����, �б�, �׸��� ȣ��
Chapter 25 �ֺ� ��ġ��
Chapter 26 �ü��
Chapter 27 �ڵ�
Chapter 28 ���� �극��');
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(10404, 404, 'CODE_����.jpg', 'admin', 'main_image');
INSERT INTO T_SHOPPING_GOODS
(GOODS_ID, GOODS_TITLE, GOODS_WRITER, GOODS_PUBLISHER, GOODS_PRICE, GOODS_SALES_PRICE, GOODS_PUBLISHED_DATE, GOODS_TOTAL_PAGE, GOODS_ISBN, GOODS_DELIVERY_PRICE, GOODS_DELIVERY_DATE, GOODS_FILE_NAME, GOODS_STATUS, GOODS_INTRO, GOODS_WRITER_INTRO, GOODS_PUBLISHER_COMMENT, GOODS_RECOMMENDATION, GOODS_CONTENTS_ORDER)
VALUES(409, 'Clean Code(Ŭ�� �ڵ�)', '�ι�Ʈ C. ��ƾ', '�λ���Ʈ', 33000, 29700, '2013-12-14', 584, '9788966260959', 0, '2024-01-03', 'Ŭ���ڵ�_����.jpg', 'steadyseller', '���α׷���, ����Ʈ���� ���е�, ������Ʈ ������, �� ����, �ý��� �м������� ������ ��
�� ���� �ڵ带 ����� å
��Clean Code(Ŭ�� �ڵ�)���� ������Ʈ ����(Object Mentor)�� ������ ���� ��� �������ϸ硯 Ŭ�� �ڵ带 ����� �ֻ��� ������ ����� �Ұ��ϰ� �ִ�. ����Ʈ���� ���� ������ ��ġ�� �ɾ� �ָ� ���α׷��� �Ƿ��� ������ ���̴�. �������� ��¸� �Ѵٸ�. � ����� �ʿ��ϳİ�? �ڵ带 �о�� �Ѵ�. ���� ���� �ڵ带. �׸��� �ڵ带 �����鼭 �� �ڵ��� ������ ������, �׸��� ������ �ؾ� �Ѵ�. �� �� �߿��ϰԴ� �������μ� �ڽ��� ���ϴ� ��ġ�� �������μ� �ڱ� ��ǰ�� ���� ����� ���ƺ��� �ȴ�.', '���� �ι�Ʈ C. ��ƾ Robert C. Martin�� "�� ������(Uncle Bob)"�� �Ҹ��⵵ �Ѵ�. 1970����� ����Ʈ���� �������� Ȱ��������, ������Ʈ ����(Object Mentor) ���� â�����̸� ��ǥ��. ������Ʈ ����� C++, �ڹ�, C#, ���, ��ü����, ������ ����, UML, ������ �����, �ͽ�Ʈ�� ���α׷��� �о߿��� �� ������ ������ �̲��� ������ ǳ���� ������Ʈ�� �̷������. ���� å���� ��Agile Software Development, Principles, Patterns, and Practices��, ��The Clean Coder��, ��UML for Java Programmers�� ���� �ִ�.', '���� �ڵ嵵 ���ƴ� ����. ������ �ڵ尡 �������� ���ϸ� ���� ������ ����. �ų� �������� �ڵ�� ������ �ð��� ����� �ڿ��� ����ȴ�. �׷��� �� ������ ����. �ι�Ʈ ��ƾ�� �� å���� �������� �з������� �����Ѵ�. �״� ������Ʈ ����(ObjectMentor)�� ������ ���� ��� �������ϸ硯 Ŭ�� �ڵ带 ����� �ֻ��� ������ ����� ������ å �� �ǿ� ��Ұ�, �� å�� ����Ʈ���� ���� ������ ��ġ�� �ɾ� �ָ� ���α׷��� �Ƿ��� ������ ���̴�. �������� ��¸� �Ѵٸ�. � ����� �ʿ��ϳİ�? �ڵ带 �о�� �Ѵ�. ���� ���� �ڵ带. �׸��� �ڵ带 �����鼭 �� �ڵ��� ������ ������, �׸��� ������ �ؾ� �Ѵ�. �� �� �߿��ϰԴ� �������μ� �ڽ��� ���ϴ� ��ġ�� �������μ� �ڱ� ��ǰ�� ���� ����� ���ƺ��� �ȴ�. �� å�� ���� ���ڴ� ���� ������ �˰� �ȴ�.
-. ���� �ڵ�� ���� �ڵ带 �����ϴ� ���
-. ���� �ڵ带 �ۼ��ϴ� ����� ���� �ڵ带 ���� �ڵ�� �ٲٴ� ���
-. ���� �̸�, ���� �Լ�, ���� ��ü, ���� Ŭ������ �ۼ��ϴ� ���
-. �������� ���������� �ڵ� ������ ���ߴ� ���
-. �ڵ� ���� ��߸��� �ʰ� ���� ó���� �Ϻ��ϰ� �����ϴ� ���
-. ���� �׽�Ʈ�� �׽�Ʈ �ֵ� ������ �����ϴ� ���', NULL, NULL);
INSERT INTO T_GOODS_DETAIL_IMAGE
(IMAGE_ID, GOODS_ID, FILE_NAME, REG_ID, FILE_TYPE)
VALUES(10409, 409, 'Ŭ���ڵ�_����.jpg', 'admin', 'main_image');

-- t_shopping_order
Insert into t_shopping_order (order_seq_num,order_id,member_id,goods_id,orderer_name,goods_title,order_goods_qty,goods_sales_price,goods_file_name,receiver_name,receiver_hp,delivery_address, delivery_method, delivery_message, gift_wrapping, pay_method, card_com_name, card_pay_month, pay_orderer_hp_num, delivery_state, pay_order_time, orderer_hp) values (88,92,'lee',344,'�̺���','�ʺ��ڸ� ���� �ڹ����α׷���',1,30000,'image1.jpg','�̺���','010-2222-3333','�����ȣ:13547 ���θ� �ּ�:��� ������ �д籸 ���� 25 (������) [���� �ּ�:��� ������ �д籸 ������ 79-1] ��Ű���� 101ȣ','�Ϲ��ù�',null,'no','�ſ�ī�� ī���:�Ｚ, �Һΰ�����:�Ͻú�','�Ｚ','�Ͻú�','�ش����','cancel_order','2023/12/20','010-2222-3333');
Insert into t_shopping_order (order_seq_num,order_id,member_id,goods_id,orderer_name,goods_title,order_goods_qty,goods_sales_price,goods_file_name,receiver_name,receiver_hp,delivery_address, delivery_method, delivery_message, gift_wrapping, pay_method, card_com_name, card_pay_month, pay_orderer_hp_num, delivery_state, pay_order_time, orderer_hp) values (89,93,'lee',354,'�̺���','����� ������',1,21600,'����� ������_����.jpg','�̺���','010-2222-3333','�����ȣ:13547 ���θ� �ּ�:��� ������ �д籸 ���� 25 (������) [���� �ּ�:��� ������ �д籸 ������ 79-1] ��Ű���� 101ȣ','�Ϲ��ù�',null,'no','�ſ�ī�� ī���:�Ｚ, �Һΰ�����:�Ͻú�','�Ｚ','�Ͻú�','�ش����','delivering','2023/12/20','010-2222-3333');
Insert into t_shopping_order (order_seq_num,order_id,member_id,goods_id,orderer_name,goods_title,order_goods_qty,goods_sales_price,goods_file_name,receiver_name,receiver_hp,delivery_address, delivery_method, delivery_message, gift_wrapping, pay_method, card_com_name, card_pay_month, pay_orderer_hp_num, delivery_state, pay_order_time, orderer_hp) values (90,94,'lee',354,'�̺���','����� ������',1,21600,'����� ������_����.jpg','�̺���','010-2222-3333','�����ȣ:13547 ���θ� �ּ�:��� ������ �д籸 ���� 25 (������) [���� �ּ�:��� ������ �д籸 ������ 79-1] ��Ű���� 101ȣ','�Ϲ��ù�',null,'no','�ſ�ī�� ī���:�Ｚ, �Һΰ�����:�Ͻú�','�Ｚ','�Ͻú�','�ش����','cancel_order','2023/12/20','010-2222-3333');

-- �Խ��� ���� ���̺� ������
insert into categories(cate, cate_name) values(1, '��������');
insert into categories(cate, cate_name) values(2, '���� ����');
insert into categories(cate, cate_name) values(31, 'ȯ��');
insert into categories(cate, cate_name) values(32, '���');
insert into categories(cate, cate_name) values(33, '��Ÿ');
insert into categories(cate, cate_name) values(4, '��ǰ �ı�');


-- �Խ��� ���̺� ���� ������
-- cate 1) '��������' (������ �ۼ�)
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '������ ���� �ֹ��ݾ� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '���� ��� ���� �� ������ �޹� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '���� �������� ���� ��� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '��Ź ��޿� �޹��� ���� ��� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '��������ó����ħ ���� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '�Ǹ� ���� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', 'ǰ�� ���� ���԰� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '���� ���� �������� ���� ��� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '�ŵ��� �԰� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '���� ���� �ҷ��� ���� ó�� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '���� �������� ���� ��� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '�Ǹ� ���� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '��Ź ��޿� �޹��� ���� ��� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '������ ���� �ֹ��ݾ� ���� �ȳ�', '���������Դϴ�.', 1);
INSERT INTO board(member_id, title, content, cate) VALUES('admin', '�ų� �̺�Ʈ ��÷�� ��ǥ', '2024 ���� ��, ���� �� ���� ��������. �ų� �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�. �Ʒ��� �޴��� ��ȣ�� Ȯ�����ּ���.', 1);

-- cate 2) '���� ����' (����� �ۼ�)
INSERT INTO board(member_id, title, content, cate, com_status) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2, 'y');
INSERT INTO board(member_id, title, content, cate, com_status) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2, 'y');
INSERT INTO board(member_id, title, content, cate, com_status) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2, 'y');
INSERT INTO board(member_id, title, content, cate, com_status) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2, 'y');
INSERT INTO board(member_id, title, content, cate, com_status) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2, 'y');
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);
INSERT INTO board(member_id, title, content, cate) VALUES('lee', '�����մϴ�.', '�����մϴ�.', 2);

-- cate 31) 'ȯ��' (����� �ۼ�)
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', 'ȯ�� �����Դϴ�.', 'ȯ�� �����Դϴ�.', 31);

-- cate 32) '���' (����� �ۼ�)
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��� �����Դϴ�.', '��� �����Դϴ�.', 32);

-- cate 33) '��Ÿ' (����� �ۼ�)
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate, com_status) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33, 'y');
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '��Ÿ �����Դϴ�.', '��Ÿ �����Դϴ�.', 33);

-- cate 4) '��ǰ �ı�' (����� �ۼ�)
INSERT INTO board(goods_id, member_id, title, content, cate) VALUES(400, 'lee', '�ʹ� ���� ���� �ƾ��!', '���� �� �ؼ� �� ����̾��µ� �� ���� ���п� ���� ������ϴ�!', 4);


-- �Խ��� ��� ���̺� ���� ������
-- cate 2) '���� ����' (����� �ۼ�)�� ���� ��� (������ �ۼ�)
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(16, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(17, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(18, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(19, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(20, '�亯�Դϴ�.', 'admin');

-- cate 31) 'ȯ��' (����� �ۼ�)�� ���� ��� (������ �ۼ�)
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(31, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(32, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(33, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(34, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(35, '�亯�Դϴ�.', 'admin');

-- cate 32) '���' (����� �ۼ�)�� ���� ��� (������ �ۼ�)
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(46, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(47, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(48, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(49, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(50, '�亯�Դϴ�.', 'admin');

-- cate 33) '��Ÿ' (����� �ۼ�)�� ���� ��� (������ �ۼ�)
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(61, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(62, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(63, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(64, '�亯�Դϴ�.', 'admin');
INSERT INTO board_comment(brd_id, com_content, member_id) VALUES(65, '�亯�Դϴ�.', 'admin');


-- �ֹ����̺� �������� ����
--
-- ALTER TABLE t_shopping_order ADD FOREIGN key(member_id) REFERENCES t_shopping_member(member_id) ON DELETE CASCADE;
-- ALTER TABLE t_shopping_order ADD FOREIGN key(goods_id) REFERENCES t_shopping_goods(goods_id) ON DELETE CASCADE;
-- ��ǰ �̹��� ���� ���̺� �������� ����
-- ALTER TABLE t_goods_detail_image ADD FOREIGN key(goods_id) REFERENCES t_shopping_goods(goods_id) ON DELETE CASCADE;
-- ��ٱ��� ���̺� �������� ����
-- ALTER TABLE t_shopping_cart ADD FOREIGN key(member_id) REFERENCES t_shopping_member(member_id) ON DELETE CASCADE;
-- ALTER TABLE t_shopping_cart ADD FOREIGN key(goods_id) REFERENCES t_shopping_goods(goods_id) ON DELETE CASCADE;
-- �Խ��� ���̺� �������� ����
-- ALTER TABLE board ADD FOREIGN key(goods_id) REFERENCES t_shopping_goods(goods_id) ON DELETE CASCADE;
-- ALTER TABLE board ADD FOREIGN key(member_id) REFERENCES t_shopping_member(member_id) ON DELETE CASCADE;
-- ALTER TABLE board ADD FOREIGN key(cate) REFERENCES categories(cate) ON DELETE CASCADE;
--  �Խ��� ��� ���̺� ��������
--  ALTER TABLE board_comment ADD FOREIGN key(member_id) REFERENCES t_shopping_member(member_id) ON DELETE CASCADE;
--  ALTER TABLE board_comment ADD FOREIGN key(brd_id) REFERENCES board(brd_id) ON DELETE CASCADE;
--  ��� ���� �������� ����
-- ALTER TABLE member_auth ADD FOREIGN key(member_id) REFERENCES t_shopping_member(member_id) ON DELETE CASCADE;

