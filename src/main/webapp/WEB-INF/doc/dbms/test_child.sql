CREATE TABLE test_child(
        review_no                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        payment_no                                NUMBER(10)         NOT NULL,      
        review_word                               VARCHAR2(1000)         NOT NULL,
        review_rate                                 NUMBER(1)               NOT NULL,
  FOREIGN KEY (payment_no) REFERENCES test_parent (payment_no) ON DELETE CASCADE
);

COMMENT ON TABLE test_child is '댓글';
COMMENT ON COLUMN test_child.review_no is '댓글번호';
COMMENT ON COLUMN test_child.payment_no is '결제번호';
COMMENT ON COLUMN test_child.review_word is '리뷰 내용';
COMMENT ON COLUMN test_child.review_rate is '리뷰 평가';

DROP SEQUENCE test_child_seq;
CREATE SEQUENCE test_child_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지



-- 1) 등록
INSERT INTO test_child(review_no,payment_no, review_word, review_rate)
VALUES(test_child_seq.nextval, 1, '댓글1', 5);

INSERT INTO test_child(review_no,payment_no, review_word, review_rate)
VALUES(test_child_seq.nextval, 1, '댓글2', 4);

INSERT INTO test_child(review_no,payment_no, review_word, review_rate)
VALUES(test_child_seq.nextval, 2, '댓글12', 3);

COMMIT;
      


-- 전체 목록
SELECT review_no,payment_no, review_word, review_rate
FROM test_child
ORDER BY review_no DESC;


