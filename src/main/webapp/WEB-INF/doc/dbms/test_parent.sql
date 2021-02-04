CREATE TABLE test_parent(
		payment_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_no                        		NUMBER(10)		 NOT NULL
); 

COMMENT ON TABLE test_parent is '����';
COMMENT ON COLUMN test_parent.payment_no is '������ȣ';
COMMENT ON COLUMN test_parent.mem_no is 'ȸ����ȣ';
 

DROP SEQUENCE test_parent_seq;
CREATE SEQUENCE test_parent_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
  
  
 --��� 

INSERT INTO test_parent(payment_no, mem_no)
VALUES(test_parent_seq.nextval, 1);

INSERT INTO test_parent(payment_no, mem_no)
VALUES(test_parent_seq.nextval, 2);
commit;

 

--���

SELECT payment_no, mem_no
FROM test_parent
ORDER BY payment_no ASC;

DELETE FROM test_parent
WHERE payment_no = 1 ;



