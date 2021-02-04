CREATE TABLE test_child(
        review_no                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        payment_no                                NUMBER(10)         NOT NULL,      
        review_word                               VARCHAR2(1000)         NOT NULL,
        review_rate                                 NUMBER(1)               NOT NULL,
  FOREIGN KEY (payment_no) REFERENCES test_parent (payment_no) ON DELETE CASCADE
);

COMMENT ON TABLE test_child is '���';
COMMENT ON COLUMN test_child.review_no is '��۹�ȣ';
COMMENT ON COLUMN test_child.payment_no is '������ȣ';
COMMENT ON COLUMN test_child.review_word is '���� ����';
COMMENT ON COLUMN test_child.review_rate is '���� ��';

DROP SEQUENCE test_child_seq;
CREATE SEQUENCE test_child_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����



-- 1) ���
INSERT INTO test_child(review_no,payment_no, review_word, review_rate)
VALUES(test_child_seq.nextval, 1, '���1', 5);

INSERT INTO test_child(review_no,payment_no, review_word, review_rate)
VALUES(test_child_seq.nextval, 1, '���2', 4);

INSERT INTO test_child(review_no,payment_no, review_word, review_rate)
VALUES(test_child_seq.nextval, 2, '���12', 3);

COMMIT;
      


-- ��ü ���
SELECT review_no,payment_no, review_word, review_rate
FROM test_child
ORDER BY review_no DESC;


