DROP TABLE IF EXISTS transaction_prod;

DROP TABLE IF EXISTS transaction;

DROP TABLE IF EXISTS product;

DROP TABLE IF EXISTS category;

DROP TABLE IF EXISTS subscription;

DROP TABLE IF EXISTS users;

DROP SEQUENCE IF EXISTS seq_product_prod_no;

DROP SEQUENCE IF EXISTS seq_transaction_tran_no;

DROP SEQUENCE IF EXISTS seq_category_category_no;

CREATE SEQUENCE IF NOT EXISTS seq_product_prod_no INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE IF NOT EXISTS seq_transaction_tran_no INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE IF NOT EXISTS seq_category_category_no INCREMENT BY 1 START WITH 10000;

CREATE TABLE IF NOT EXISTS users
(
    user_id    TEXT,
    user_name  TEXT NOT NULL,
    password   TEXT NOT NULL,
    role       TEXT DEFAULT 'user',
    ssn        TEXT,
    cell_phone TEXT,
    addr       TEXT,
    email      TEXT,
    reg_date   DATE DEFAULT CURRENT_DATE,
    CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS subscription
(
    subscriber_id TEXT,
    seller_id     TEXT,
    CONSTRAINT subscription_pk PRIMARY KEY (subscriber_id, seller_id),
    CONSTRAINT subscription_subscriber_fk FOREIGN KEY (subscriber_id) REFERENCES users (user_id),
    CONSTRAINT subscription_seller_fk FOREIGN KEY (seller_id) REFERENCES users (user_id)
);

CREATE TABLE IF NOT EXISTS category
(
    category_no   INTEGER,
    category_name TEXT NOT NULL,
    PRIMARY KEY (category_no),
    UNIQUE (category_name)
);

CREATE TABLE IF NOT EXISTS product
(
    prod_no         INTEGER,
    register        TEXT,
    prod_name       TEXT    NOT NULL,
    prod_detail     TEXT,
    manufacture_day DATE DEFAULT CURRENT_DATE,
    price           INTEGER NOT NULL,
    image_file      TEXT,
    reg_date        DATE DEFAULT CURRENT_DATE,
    stock           INTEGER NOT NULL,
    category_no     INTEGER,
    CONSTRAINT product_pk PRIMARY KEY (prod_no),
    CONSTRAINT prod_category_fk FOREIGN KEY (category_no) REFERENCES category (category_no),
    CONSTRAINT prod_register_fk FOREIGN KEY (register) REFERENCES users (user_id)
);

CREATE TABLE IF NOT EXISTS transaction
(
    tran_no          INTEGER,
    buyer_id         TEXT NOT NULL,
    payment_option   CHAR(3),
    receiver_name    TEXT,
    receiver_phone   TEXT,
    demailaddr       TEXT,
    dlvy_request     TEXT,
    tran_status_code CHAR(3),
    order_date       DATE DEFAULT CURRENT_DATE,
    dlvy_date        DATE DEFAULT CURRENT_DATE,
    CONSTRAINT transaction_pk PRIMARY KEY (tran_no),
    CONSTRAINT transaction_buyer_id FOREIGN KEY (buyer_id) REFERENCES users (user_id),
    CONSTRAINT transaction_payment_option CHECK (payment_option IN ('0', '1')),
    CONSTRAINT transaction_trans_status_code CHECK (tran_status_code IN ('0', '1', '2', '3'))
);

CREATE TABLE IF NOT EXISTS transaction_prod
(
    tran_no  INTEGER NOT NULL,
    prod_no  INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    CONSTRAINT tp_pk PRIMARY KEY (tran_no, prod_no),
    CONSTRAINT tp_tran_no_fk FOREIGN KEY (tran_no) REFERENCES transaction (tran_no),
    CONSTRAINT tp_prod_no_fk FOREIGN KEY (prod_no) REFERENCES product (prod_no),
    CONSTRAINT tp_quantity_num_range CHECK (quantity >= 0)
);

INSERT INTO users
    ( user_id,
      user_name,
      password,
      role,
      ssn,
      cell_phone,
      addr,
      email,
      reg_date )
VALUES
    ( 'admin',
      'admin',
      '1234',
      'admin',
      NULL,
      NULL,
      '서울시 서초구',
      'admin@mvc.com',
      TO_DATE('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS') );

INSERT INTO users
    ( user_id,
      user_name,
      password,
      role,
      ssn,
      cell_phone,
      addr,
      email,
      reg_date )
VALUES
    ( 'manager',
      'manager',
      '1234',
      'admin',
      NULL,
      NULL,
      NULL,
      'manager@mvc.com',
      TO_DATE('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS') );

INSERT INTO users
VALUES
    ( 'user01',
      'SCOTT',
      '1111',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user02',
      'SCOTT',
      '2222',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user03',
      'SCOTT',
      '3333',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user04',
      'SCOTT',
      '4444',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user05',
      'SCOTT',
      '5555',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user06',
      'SCOTT',
      '6666',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user07',
      'SCOTT',
      '7777',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user08',
      'SCOTT',
      '8888',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user09',
      'SCOTT',
      '9999',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user10',
      'SCOTT',
      '1010',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user11',
      'SCOTT',
      '1111',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user12',
      'SCOTT',
      '1212',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user13',
      'SCOTT',
      '1313',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user14',
      'SCOTT',
      '1414',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user15',
      'SCOTT',
      '1515',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user16',
      'SCOTT',
      '1616',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user17',
      'SCOTT',
      '1717',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user18',
      'SCOTT',
      '1818',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user19',
      'SCOTT',
      '1919',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user20',
      'SCOTT',
      '2020',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user21',
      'SCOTT',
      '2121',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user22',
      'SCOTT',
      '2222',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO users
VALUES
    ( 'user23',
      'SCOTT',
      '2323',
      'user',
      NULL,
      NULL,
      NULL,
      NULL,
      CURRENT_DATE );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      'vaio vgn FS70B',
      '소니 바이오 노트북 신동품',
      TO_DATE('2012/05/14', 'YYYY-MM-DD'),
      2000000,
      'AHlbAAAAtBqyWAAA.jpg',
      TO_DATE('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
      10 );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      '자전거',
      '자전거 좋아요~',
      TO_DATE('2012/05/14', 'YYYY-MM-DD'),
      10000,
      'AHlbAAAAvetFNwAA.jpg',
      TO_DATE('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),
      8 );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      '보르도',
      '최고 디자인 신품',
      TO_DATE('2012/02/01', 'YYYY-MM-DD'),
      1170000,
      'AHlbAAAAvewfegAB.jpg',
      TO_DATE('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),
      0 );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      '보드세트',
      '한시즌 밖에 안썼습니다. 눈물을 머금고 내놓음 ㅠ.ㅠ',
      TO_DATE('2012/02/17', 'YYYY-MM-DD'),
      200000,
      'AHlbAAAAve1WwgAC.jpg',
      TO_DATE('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),
      13 );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      '인라인',
      '좋아욥',
      TO_DATE('2012/08/19', 'YYYY-MM-DD'),
      20000,
      'AHlbAAAAve37LwAD.jpg',
      TO_DATE('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),
      2 );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      '삼성센스 2G',
      'sens 메모리 2Giga',
      TO_DATE('2012/11/21', 'YYYY-MM-DD'),
      800000,
      'AHlbAAAAtBqyWAAA.jpg',
      TO_DATE('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),
      1 );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      '연꽃',
      '정원을 가꿔보세요',
      TO_DATE('2012/10/22', 'YYYY-MM-DD'),
      232300,
      'AHlbAAAAtDPSiQAA.jpg',
      TO_DATE('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),
      0 );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      '삼성센스',
      '노트북',
      TO_DATE('2012/02/12', 'YYYY-MM-DD'),
      600000,
      'AHlbAAAAug1vsgAA.jpg',
      TO_DATE('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
      0 );

UPDATE product
SET
    category_no = (
        SELECT
            category_no
        FROM category
        WHERE category_name = 'sample-category'
    );

-- Sample data ====== start

INSERT INTO category
    ( category_no,
      category_name )
VALUES
    ( 10001,
      'sample-category-2' ),
    ( 10002,
      'sample-category-3' ),
    ( 10003,
      'sample-category-4' ),
    ( 10004,
      'sample-category-5' );

INSERT INTO product
    ( prod_no,
      prod_name,
      prod_detail,
      manufacture_day,
      price,
      image_file,
      reg_date,
      stock,
      category_no )
VALUES
    ( NEXTVAL('seq_product_prod_no'),
      'product-001',
      'sample-001',
      CURRENT_DATE,
      100,
      'sample_ive.webp',
      CURRENT_DATE,
      0,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-002',
      'sample-002',
      CURRENT_DATE,
      200,
      'sample_ive.webp',
      CURRENT_DATE,
      10,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-003',
      'sample-003',
      CURRENT_DATE,
      300,
      'sample_ive.webp',
      CURRENT_DATE,
      20,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-004',
      'sample-004',
      CURRENT_DATE,
      400,
      'sample_ive.webp',
      CURRENT_DATE,
      30,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-005',
      'sample-005',
      CURRENT_DATE,
      500,
      'sample_ive.webp',
      CURRENT_DATE,
      40,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-006',
      'sample-006',
      CURRENT_DATE,
      600,
      'sample_ive.webp',
      CURRENT_DATE,
      50,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-007',
      'sample-007',
      CURRENT_DATE,
      700,
      'sample_ive.webp',
      CURRENT_DATE,
      60,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-008',
      'sample-008',
      CURRENT_DATE,
      800,
      'sample_ive.webp',
      CURRENT_DATE,
      70,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-009',
      'sample-009',
      CURRENT_DATE,
      900,
      'sample_ive.webp',
      CURRENT_DATE,
      80,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-010',
      'sample-010',
      CURRENT_DATE,
      1000,
      'sample_ive.webp',
      CURRENT_DATE,
      90,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-011',
      'sample-011',
      CURRENT_DATE,
      1100,
      'sample_ive.webp',
      CURRENT_DATE,
      100,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-012',
      'sample-012',
      CURRENT_DATE,
      1200,
      'sample_ive.webp',
      CURRENT_DATE,
      110,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-013',
      'sample-013',
      CURRENT_DATE,
      1300,
      'sample_ive.webp',
      CURRENT_DATE,
      120,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-014',
      'sample-014',
      CURRENT_DATE,
      1400,
      'sample_ive.webp',
      CURRENT_DATE,
      130,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-015',
      'sample-015',
      CURRENT_DATE,
      1500,
      'sample_ive.webp',
      CURRENT_DATE,
      140,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-016',
      'sample-016',
      CURRENT_DATE,
      1600,
      'sample_ive.webp',
      CURRENT_DATE,
      150,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-017',
      'sample-017',
      CURRENT_DATE,
      1700,
      'sample_ive.webp',
      CURRENT_DATE,
      160,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-018',
      'sample-018',
      CURRENT_DATE,
      1800,
      'sample_ive.webp',
      CURRENT_DATE,
      170,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-019',
      'sample-019',
      CURRENT_DATE,
      1900,
      'sample_ive.webp',
      CURRENT_DATE,
      180,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-020',
      'sample-020',
      CURRENT_DATE,
      2000,
      'sample_ive.webp',
      CURRENT_DATE,
      190,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-021',
      'sample-021',
      CURRENT_DATE,
      2100,
      'sample_ive.webp',
      CURRENT_DATE,
      200,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-022',
      'sample-022',
      CURRENT_DATE,
      2200,
      'sample_ive.webp',
      CURRENT_DATE,
      210,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-023',
      'sample-023',
      CURRENT_DATE,
      2300,
      'sample_ive.webp',
      CURRENT_DATE,
      220,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-024',
      'sample-024',
      CURRENT_DATE,
      2400,
      'sample_ive.webp',
      CURRENT_DATE,
      230,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-025',
      'sample-025',
      CURRENT_DATE,
      2500,
      'sample_ive.webp',
      CURRENT_DATE,
      240,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-026',
      'sample-026',
      CURRENT_DATE,
      2600,
      'sample_ive.webp',
      CURRENT_DATE,
      250,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-027',
      'sample-027',
      CURRENT_DATE,
      2700,
      'sample_ive.webp',
      CURRENT_DATE,
      260,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-028',
      'sample-028',
      CURRENT_DATE,
      2800,
      'sample_ive.webp',
      CURRENT_DATE,
      270,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-029',
      'sample-029',
      CURRENT_DATE,
      2900,
      'sample_ive.webp',
      CURRENT_DATE,
      280,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-030',
      'sample-030',
      CURRENT_DATE,
      3000,
      'sample_ive.webp',
      CURRENT_DATE,
      290,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-031',
      'sample-031',
      CURRENT_DATE,
      3100,
      'sample_ive.webp',
      CURRENT_DATE,
      300,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-032',
      'sample-032',
      CURRENT_DATE,
      3200,
      'sample_ive.webp',
      CURRENT_DATE,
      310,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-033',
      'sample-033',
      CURRENT_DATE,
      3300,
      'sample_ive.webp',
      CURRENT_DATE,
      320,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-034',
      'sample-034',
      CURRENT_DATE,
      3400,
      'sample_ive.webp',
      CURRENT_DATE,
      330,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-035',
      'sample-035',
      CURRENT_DATE,
      3500,
      'sample_ive.webp',
      CURRENT_DATE,
      340,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-036',
      'sample-036',
      CURRENT_DATE,
      3600,
      'sample_ive.webp',
      CURRENT_DATE,
      350,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-037',
      'sample-037',
      CURRENT_DATE,
      3700,
      'sample_ive.webp',
      CURRENT_DATE,
      360,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-038',
      'sample-038',
      CURRENT_DATE,
      3800,
      'sample_ive.webp',
      CURRENT_DATE,
      370,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-039',
      'sample-039',
      CURRENT_DATE,
      3900,
      'sample_ive.webp',
      CURRENT_DATE,
      380,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-040',
      'sample-040',
      CURRENT_DATE,
      4000,
      'sample_ive.webp',
      CURRENT_DATE,
      390,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-041',
      'sample-041',
      CURRENT_DATE,
      4100,
      'sample_ive.webp',
      CURRENT_DATE,
      400,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-042',
      'sample-042',
      CURRENT_DATE,
      4200,
      'sample_ive.webp',
      CURRENT_DATE,
      410,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-043',
      'sample-043',
      CURRENT_DATE,
      4300,
      'sample_ive.webp',
      CURRENT_DATE,
      420,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-044',
      'sample-044',
      CURRENT_DATE,
      4400,
      'sample_ive.webp',
      CURRENT_DATE,
      430,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-045',
      'sample-045',
      CURRENT_DATE,
      4500,
      'sample_ive.webp',
      CURRENT_DATE,
      440,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-046',
      'sample-046',
      CURRENT_DATE,
      4600,
      'sample_ive.webp',
      CURRENT_DATE,
      450,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-047',
      'sample-047',
      CURRENT_DATE,
      4700,
      'sample_ive.webp',
      CURRENT_DATE,
      460,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-048',
      'sample-048',
      CURRENT_DATE,
      4800,
      'sample_ive.webp',
      CURRENT_DATE,
      470,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-049',
      'sample-049',
      CURRENT_DATE,
      4900,
      'sample_ive.webp',
      CURRENT_DATE,
      480,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-050',
      'sample-050',
      CURRENT_DATE,
      5000,
      'sample_ive.webp',
      CURRENT_DATE,
      490,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-051',
      'sample-051',
      CURRENT_DATE,
      5100,
      'sample_ive.webp',
      CURRENT_DATE,
      500,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-052',
      'sample-052',
      CURRENT_DATE,
      5200,
      'sample_ive.webp',
      CURRENT_DATE,
      510,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-053',
      'sample-053',
      CURRENT_DATE,
      5300,
      'sample_ive.webp',
      CURRENT_DATE,
      520,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-054',
      'sample-054',
      CURRENT_DATE,
      5400,
      'sample_ive.webp',
      CURRENT_DATE,
      530,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-055',
      'sample-055',
      CURRENT_DATE,
      5500,
      'sample_ive.webp',
      CURRENT_DATE,
      540,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-056',
      'sample-056',
      CURRENT_DATE,
      5600,
      'sample_ive.webp',
      CURRENT_DATE,
      550,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-057',
      'sample-057',
      CURRENT_DATE,
      5700,
      'sample_ive.webp',
      CURRENT_DATE,
      560,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-058',
      'sample-058',
      CURRENT_DATE,
      5800,
      'sample_ive.webp',
      CURRENT_DATE,
      570,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-059',
      'sample-059',
      CURRENT_DATE,
      5900,
      'sample_ive.webp',
      CURRENT_DATE,
      580,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-060',
      'sample-060',
      CURRENT_DATE,
      6000,
      'sample_ive.webp',
      CURRENT_DATE,
      590,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-061',
      'sample-061',
      CURRENT_DATE,
      6100,
      'sample_ive.webp',
      CURRENT_DATE,
      600,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-062',
      'sample-062',
      CURRENT_DATE,
      6200,
      'sample_ive.webp',
      CURRENT_DATE,
      610,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-063',
      'sample-063',
      CURRENT_DATE,
      6300,
      'sample_ive.webp',
      CURRENT_DATE,
      620,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-064',
      'sample-064',
      CURRENT_DATE,
      6400,
      'sample_ive.webp',
      CURRENT_DATE,
      630,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-065',
      'sample-065',
      CURRENT_DATE,
      6500,
      'sample_ive.webp',
      CURRENT_DATE,
      640,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-066',
      'sample-066',
      CURRENT_DATE,
      6600,
      'sample_ive.webp',
      CURRENT_DATE,
      650,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-067',
      'sample-067',
      CURRENT_DATE,
      6700,
      'sample_ive.webp',
      CURRENT_DATE,
      660,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-068',
      'sample-068',
      CURRENT_DATE,
      6800,
      'sample_ive.webp',
      CURRENT_DATE,
      670,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-069',
      'sample-069',
      CURRENT_DATE,
      6900,
      'sample_ive.webp',
      CURRENT_DATE,
      680,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-070',
      'sample-070',
      CURRENT_DATE,
      7000,
      'sample_ive.webp',
      CURRENT_DATE,
      690,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-071',
      'sample-071',
      CURRENT_DATE,
      7100,
      'sample_ive.webp',
      CURRENT_DATE,
      700,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-072',
      'sample-072',
      CURRENT_DATE,
      7200,
      'sample_ive.webp',
      CURRENT_DATE,
      710,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-073',
      'sample-073',
      CURRENT_DATE,
      7300,
      'sample_ive.webp',
      CURRENT_DATE,
      720,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-074',
      'sample-074',
      CURRENT_DATE,
      7400,
      'sample_ive.webp',
      CURRENT_DATE,
      730,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-075',
      'sample-075',
      CURRENT_DATE,
      7500,
      'sample_ive.webp',
      CURRENT_DATE,
      740,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-076',
      'sample-076',
      CURRENT_DATE,
      7600,
      'sample_ive.webp',
      CURRENT_DATE,
      750,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-077',
      'sample-077',
      CURRENT_DATE,
      7700,
      'sample_ive.webp',
      CURRENT_DATE,
      760,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-078',
      'sample-078',
      CURRENT_DATE,
      7800,
      'sample_ive.webp',
      CURRENT_DATE,
      770,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-079',
      'sample-079',
      CURRENT_DATE,
      7900,
      'sample_ive.webp',
      CURRENT_DATE,
      780,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-080',
      'sample-080',
      CURRENT_DATE,
      8000,
      'sample_ive.webp',
      CURRENT_DATE,
      790,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-081',
      'sample-081',
      CURRENT_DATE,
      8100,
      'sample_ive.webp',
      CURRENT_DATE,
      800,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-082',
      'sample-082',
      CURRENT_DATE,
      8200,
      'sample_ive.webp',
      CURRENT_DATE,
      810,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-083',
      'sample-083',
      CURRENT_DATE,
      8300,
      'sample_ive.webp',
      CURRENT_DATE,
      820,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-084',
      'sample-084',
      CURRENT_DATE,
      8400,
      'sample_ive.webp',
      CURRENT_DATE,
      830,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-085',
      'sample-085',
      CURRENT_DATE,
      8500,
      'sample_ive.webp',
      CURRENT_DATE,
      840,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-086',
      'sample-086',
      CURRENT_DATE,
      8600,
      'sample_ive.webp',
      CURRENT_DATE,
      850,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-087',
      'sample-087',
      CURRENT_DATE,
      8700,
      'sample_ive.webp',
      CURRENT_DATE,
      860,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-088',
      'sample-088',
      CURRENT_DATE,
      8800,
      'sample_ive.webp',
      CURRENT_DATE,
      870,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-089',
      'sample-089',
      CURRENT_DATE,
      8900,
      'sample_ive.webp',
      CURRENT_DATE,
      880,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-090',
      'sample-090',
      CURRENT_DATE,
      9000,
      'sample_ive.webp',
      CURRENT_DATE,
      890,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-091',
      'sample-091',
      CURRENT_DATE,
      9100,
      'sample_ive.webp',
      CURRENT_DATE,
      900,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-092',
      'sample-092',
      CURRENT_DATE,
      9200,
      'sample_ive.webp',
      CURRENT_DATE,
      910,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-093',
      'sample-093',
      CURRENT_DATE,
      9300,
      'sample_ive.webp',
      CURRENT_DATE,
      920,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-094',
      'sample-094',
      CURRENT_DATE,
      9400,
      'sample_ive.webp',
      CURRENT_DATE,
      930,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-095',
      'sample-095',
      CURRENT_DATE,
      9500,
      'sample_ive.webp',
      CURRENT_DATE,
      940,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-096',
      'sample-096',
      CURRENT_DATE,
      9600,
      'sample_ive.webp',
      CURRENT_DATE,
      950,
      10004 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-097',
      'sample-097',
      CURRENT_DATE,
      9700,
      'sample_ive.webp',
      CURRENT_DATE,
      960,
      10001 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-098',
      'sample-098',
      CURRENT_DATE,
      9800,
      'sample_ive.webp',
      CURRENT_DATE,
      970,
      10002 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-099',
      'sample-099',
      CURRENT_DATE,
      9900,
      'sample_ive.webp',
      CURRENT_DATE,
      980,
      10003 ),
    ( NEXTVAL('seq_product_prod_no'),
      'product-100',
      'sample-100',
      CURRENT_DATE,
      10000,
      'sample_ive.webp',
      CURRENT_DATE,
      990,
      10004 );

-- Sample data =====  end

INSERT INTO transaction
VALUES
    ( NEXTVAL('seq_transaction_tran_no'),
      'user02',
      '1',
      'Nothing',
      '010-1234-1234',
      'asdfasohfiw',
      'request sample',
      '1',
      TO_DATE('2017/2/8', 'YYYY/MM/DD'),
      TO_DATE('2017/2/15', 'YYYY/MM/DD') );

INSERT INTO transaction
VALUES
    ( NEXTVAL('seq_transaction_tran_no'),
      'user01',
      '1',
      'Nothing',
      '010-1234-1234',
      'asdfasohfiw',
      'request sample',
      '1',
      TO_DATE('2017/2/8', 'YYYY/MM/DD'),
      TO_DATE('2017/2/15', 'YYYY/MM/DD') );

INSERT INTO transaction
VALUES
    ( NEXTVAL('seq_transaction_tran_no'),
      'user23',
      '1',
      'Nothing',
      '010-1234-1234',
      'asdfasohfiw',
      'request sample',
      '2',
      TO_DATE('2017/2/8', 'YYYY/MM/DD'),
      TO_DATE('2017/2/15', 'YYYY/MM/DD') );

INSERT INTO transaction
VALUES
    ( NEXTVAL('seq_transaction_tran_no'),
      'user08',
      '1',
      'Nothing',
      '010-1234-1234',
      'asdfasohfiw',
      'request sample',
      '2',
      TO_DATE('2017/2/8', 'YYYY/MM/DD'),
      TO_DATE('2017/2/15', 'YYYY/MM/DD') );

INSERT INTO transaction
VALUES
    ( NEXTVAL('seq_transaction_tran_no'),
      'user08',
      '1',
      'Nothing',
      '010-1234-1234',
      'asdfasohfiw',
      'request sample',
      '2',
      TO_DATE('2017/2/8', 'YYYY/MM/DD'),
      TO_DATE('2017/2/15', 'YYYY/MM/DD') );

INSERT INTO transaction
VALUES
    ( NEXTVAL('seq_transaction_tran_no'),
      'user08',
      '1',
      'Nothing',
      '010-1234-1234',
      'asdfasohfiw',
      'request sample',
      '1',
      TO_DATE('2017/2/8', 'YYYY/MM/DD'),
      TO_DATE('2017/2/15', 'YYYY/MM/DD') );

INSERT INTO transaction
VALUES
    ( NEXTVAL('seq_transaction_tran_no'),
      'user08',
      '1',
      'Nothing',
      '010-1234-1234',
      'asdfasohfiw',
      'request sample',
      '1',
      TO_DATE('2017/2/8', 'YYYY/MM/DD'),
      TO_DATE('2017/2/15', 'YYYY/MM/DD') );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10000,
      10000,
      2 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10000,
      10001,
      1 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10001,
      10000,
      3 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10001,
      10002,
      4 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10002,
      10000,
      1 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10003,
      10004,
      5 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10004,
      10005,
      1 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10005,
      10005,
      1 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10005,
      10006,
      2 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10006,
      10007,
      1 );

INSERT INTO transaction_prod
    ( tran_no,
      prod_no,
      quantity )
VALUES
    ( 10006,
      10005,
      2 );

INSERT INTO category
VALUES
    ( NEXTVAL('seq_category_category_no'),
      'sample-category' );

COMMIT;