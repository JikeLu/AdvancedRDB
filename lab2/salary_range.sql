drop table salary_range;
create table salary_range
(salary_range_id number,
  low_salary number,
  high_salary number);
INSERT INTO SALARY_RANGE(SALARY_RANGE_ID, LOW_SALARY, HIGH_SALARY) VALUES ('1', '1', '10000');
INSERT INTO SALARY_RANGE(SALARY_RANGE_ID, LOW_SALARY, HIGH_SALARY) VALUES ('2', '10001', '20000');
INSERT INTO SALARY_RANGE(SALARY_RANGE_ID, LOW_SALARY, HIGH_SALARY) VALUES ('3', '20001', '30000');
commit;