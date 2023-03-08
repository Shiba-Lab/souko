/*
    File Name   : souko_db.sql
    Created     : on 20:30 at Mar 08, 2023
    Description : 倉庫整理に使ってるデータベース

    Copyright 2023 Shogo Kitada All Rights Reserved.
        contact@shogo0x2e.com (Twitter, GitHub: @shogo0x2e)

    I would be happy to notify me if you use part of my code.
*/


CREATE TABLE categories(
    pk_category_id INT          NOT NULL,
    name           VARCHAR(192) NOT NULL,
    PRIMARY KEY(pk_category_id)
);

CREATE TABLE cases(
    pk_case_id INT NOT NULL,
    remark     TEXT,
    PRIMARY KEY(pk_case_id)
);

CREATE TABLE products(
    pk_product_id   CHAR(10)     NOT NULL,
    created_at      DATE         NOT NULL,
    updated_at      DATE         NOT NULL,
    fk_category_id  INT          NOT NULL,
    quantity        INT          NOT NULL,
    product_name    VARCHAR(768) NOT NULL,
    fk_case_id      INT,
    spec            TEXT,
    PRIMARY KEY(pk_product_id),
    FOREIGN KEY(fk_category_id) REFERENCES categories(pk_category_id),
    FOREIGN KEY(fk_case_id)     REFERENCES cases(pk_case_id)
);

CREATE TABLE lendings(
    pk_rent_id        INT      NOT NULL,
    fk_product_id     CHAR(10) NOT NULL,
    to_be_returned_at DATE     NOT NULL,
    returned_at       DATE,
    applicant_id      CHAR(10) NOT NULL,
    PRIMARY KEY(pk_rent_id),
    FOREIGN KEY(fk_product_id) REFERENCES products(pk_product_id)
);

create table Test(id integer, title varchar(100));
insert into Test(id, title) values(1, "Hello");
select * from Test;
-- Your code here!

