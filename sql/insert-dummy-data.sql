--RUN PROCEDURE FACULTEY
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_faculty('biology', msg);
END;

--RUN PROCEDURE DEPARTMENT
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_department('engineering', 'industrial and production engineering','ipe', '06', msg);
  DBMS_OUTPUT.PUT_LINE(msg);
END;

--RUN PROCEDURE PROGRAM
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_program('industrial and production engineering', 'bachelor of science','bsc', 'bsc', msg);
  DBMS_OUTPUT.PUT_LINE(msg);
END;

--RUN PROCEDURE SESSION
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_session_p('COMPUTER SCIENCE AND ENGINEERING', 'BSC','2014-15','2015' , msg);
  DBMS_OUTPUT.PUT_LINE(msg);
END;

--RUN PROCEDURE SEMISTER
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_semester_p(4.2,'4TH YEAR' , msg);
  DBMS_OUTPUT.PUT_LINE(msg);
END;

--INSERT INTO RESIDENTIAL HALL
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_residential_hall_p('female', 'sheikh hasina' , msg);
  DBMS_OUTPUT.PUT_LINE(msg);
END;

--INSERT INTO teachar 
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_teacher_p('Md. Jahangir', 'Alam' , 'Assistant Professor', '02',  msg);
  DBMS_OUTPUT.PUT_LINE(msg);
END;

--INSERT INTO student 
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_student_info_p('MICROBIOLOGY', 'bsc', '2013-14', '130501', '1305001', 'Rohim', 'ahmed' , 'dont know', 'dont know','01840000000', '12 March 1996', 'male','islam', 'Dhaka','jessore', 'mamun@ail.com', 'bangladeshi','unmarried','SHAHEED MOSHIUR RAHMAN' ,  msg);
  DBMS_OUTPUT.PUT_LINE(msg);
END;

--INSERT INTO course 
set serveroutput on;  
declare msg varchar(200);
BEGIN
  insert_courses_p('COMPUTER SCIENCE AND ENGINEERING','BSC' , '2013-14','che 4203', 'system ENGINEERING', 3, 'theory', 4.2,'MD. ARIF ',  msg);
  DBMS_OUTPUT.PUT_LINE(msg);
END;
















create or replace PROCEDURE insert_student_info_p
(dept_name IN VARCHAR, prog_abb IN VARCHAR, sec IN VARCHAR, roll IN VARCHAR, reg IN VARCHAR,fst_nm IN VARCHAR, lst_nm IN VARCHAR ,father_nm IN VARCHAR, mother_nm IN VARCHAR, pn_num IN VARCHAR,dob IN VARCHAR, gender IN VARCHAR, religion IN VARCHAR, per_add IN VARCHAR,pre_add IN VARCHAR, email IN VARCHAR, nat IN VARCHAR, status IN VARCHAR, hall_nm IN VARCHAR   ,msg OUT VARCHAR)
IS
  sec_id  SESSION_.SESSION_ID%TYPE;
  dept_id DEPARTMENT.DEPARTMENT_ID%TYPE;
  prog_id PROGRAM.PROGRAM_ID%TYPE;
  hall_id RESIDENTIAL_HALL.RESIDENTIAL_ID%TYPE;
BEGIN
  
  --  FIND DEPARTMENT ID
  SELECT 
    department_id INTO dept_id
  FROM 
    department
  WHERE 
    department_name = UPPER(dept_name);
    
    --  FIND PROGRAM ID
  SELECT 
    program_id INTO prog_id
  FROM 
    program
  WHERE 
    program_abbr = UPPER(prog_abb)
  AND
    department_id = dept_id;
    
    --  FIND SESSION_ ID
  SELECT 
    session_id INTO sec_id
  FROM 
    session_
  WHERE 
    session_desc = UPPER(sec)
  AND
    program_id = prog_id;
    
  --FIND HALL ID
  SELECT 
    RESIDENTIAL_ID INTO hall_id
  FROM 
    RESIDENTIAL_HALL
  WHERE 
    RESIDENTIAL_NAME = UPPER(hall_nm);

  INSERT INTO student_info VALUES(roll, reg, UPPER(fst_nm), UPPER(lst_nm), UPPER(father_nm),UPPER(mother_nm),pn_num,UPPER(dob),gender,UPPER(religion),UPPER(per_add),UPPER(pre_add),LOWER(email),UPPER(nat),UPPER(status),sec_id,sec_id,hall_id);
  msg := 'Student: ' || fst_nm || ' ' || lst_nm || ' is Successfully add!!';
  
    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a Duplicate roll or Registration id.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on student insert - '||SQLCODE||' -ERROR- '||SQLERRM;
END;