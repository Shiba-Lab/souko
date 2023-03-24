/*
    File Name   : souko_db.sql
    Created     : on 20:30 at Mar 08, 2023
    Description : 倉庫整理に使ってるデータベース

    Copyright 2023 Shogo Kitada All Rights Reserved.
        contact@shogo0x2e.com (Twitter, GitHub: @shogo0x2e)

    I would be happy to notify me if you use part of my code.
*/

CREATE TABLE categories(
    id      INT          AUTO_INCREMENT,
    name    VARCHAR(192) NOT NULL, -- 3 バイト * 64 文字 ==  192
    
    PRIMARY KEY(id) -- NOT NULL 制約は 主キー制約で付与される
);

CREATE TABLE cases(
    id      INT     AUTO_INCREMENT,
    remark  TEXT,
    
    PRIMARY KEY(id)
);

-- 1:06 Mar 9 追加: ケースにアクセスしたとき用
ALTER TABLE cases ADD web_id CHAR(10) NOT NULL;

-- 画像たちはルーティングで管理する
CREATE TABLE products(
    id              INT                 AUTO_INCREMENT,
    web_id          CHAR(10)            NOT NULL, -- web アクセス用のs00001 + 余剰 4 文字
    created_at      DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by      CHAR(10)            NOT NULL, -- 学番
    quantity        SMALLINT UNSIGNED   NOT NULL,
    product_name    VARCHAR(768)        NOT NULL,
    fk_category_id  INT                 NOT NULL,
    fk_case_id      INT,
    spec            TEXT,
    
    PRIMARY KEY(id),
    
    FOREIGN KEY(fk_category_id) REFERENCES categories(id),
    FOREIGN KEY(fk_case_id)     REFERENCES cases(id),
    
    UNIQUE(web_id)
);

-- 12:49 Mar 9 追加; 消耗品であるか、のカラムが抜けてた
ALTER TABLE products ADD is_consumable BOOLEAN NOT NULL;

CREATE TABLE lendings(
    id                INT      NOT NULL,
    fk_product_id     INT      NOT NULL,
    to_be_returned_at DATE     NOT NULL,
    returned_at       DATE,
    applicant_id      CHAR(10) NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(fk_product_id) REFERENCES products(id)
);

CREATE TABLE images(
    fk_product_id   INT         NOT NULL,
    image_url       CHAR(100)   NOT NULL,   -- 70 文字前後 + マージン

    FOREIGN KEY(fk_product_id) REFERENCES products(id)
);

---------------------
-- 以下はテスト用のコード
---------------------

/*
INSERT INTO categories(name) VALUES(
    "プロジェクター"
);


INSERT INTO cases(remark) VALUES(
    "基本プロジェクターたちを入れてる箱"
);

INSERT INTO products(
    web_id, updated_by, quantity, product_name, 
    fk_category_id, fk_case_id, spec
)
VALUES (
    "s00001",
    "bp99999",
    1,
    "BENQ プロジェクター",
    1, -- 2 とかにすると外部キー制約で弾かれるよ！
    1,
    "単焦点じゃない普通のやつ"
);

SELECT
    * 
FROM 
    products, cases, categories
WHERE
    products.fk_case_id = cases.id AND
    products.fk_category_id = categories.id;

//*/