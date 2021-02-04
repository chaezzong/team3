CREATE TABLE test_parent(
		payment_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_no                        		NUMBER(10)		 NOT NULL
); 

COMMENT ON TABLE test_parent is '결제';
COMMENT ON COLUMN test_parent.payment_no is '결제번호';
COMMENT ON COLUMN test_parent.mem_no is '회원번호';
 

DROP SEQUENCE test_parent_seq;
CREATE SEQUENCE test_parent_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
  
  
 --등록 

INSERT INTO test_parent(payment_no, mem_no)
VALUES(test_parent_seq.nextval, 1);

INSERT INTO test_parent(payment_no, mem_no)
VALUES(test_parent_seq.nextval, 2);
commit;

 

--목록

SELECT payment_no, mem_no
FROM test_parent
ORDER BY payment_no ASC;

DELETE FROM test_parent
WHERE payment_no = 1 ;



