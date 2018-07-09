--insert procedure to insert Faculty
CREATE OR REPLACE PROCEDURE insert_faculty
(fac_name IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  INSERT INTO faculty VALUES(LPAD(faculty_id_generator_f(),2, '0'), UPPER(fac_name));
  msg := 'New faculty: ' || fac_name || ' is Successfully add!!';
  
    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate faculty name.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on insertFaculty Procedure - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/


--update procedure to update Faculty
CREATE OR REPLACE PROCEDURE update_faculty
(fac_id IN VARCHAR, fac_name IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  UPDATE faculty
  SET faculty_name = UPPER(fac_name)
  WHERE faculty_id = fac_id;
  msg := 'Faculty update successfully.';
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate faculty name.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on Update Faculty - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--delete procedure to delete Faculty
CREATE OR REPLACE PROCEDURE delete_faculty
(fac_id IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  DELETE from faculty
  WHERE faculty_id = fac_id;
  msg := 'Faculty Delete successfully';
  EXCEPTION
    WHEN OTHERS THEN
      msg := 'Error occour on Delete Faculty - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--insert procedure to insert Department
create or replace PROCEDURE insert_department
(fac_name IN VARCHAR, dept_name IN VARCHAR, d_abbr IN VARCHAR, d_code IN VARCHAR, msg OUT VARCHAR)
IS
  fac_id faculty.faculty_id%TYPE;
BEGIN
  SELECT
    faculty_id INTO fac_id
  FROM
    faculty
  WHERE 
    faculty_name = UPPER(fac_name);

  INSERT INTO department VALUES(LPAD(department_id_generator_f(),2, '0'), UPPER(dept_name), UPPER(d_abbr),d_code, fac_id);
  msg := 'New department ' || dept_name || ' successfully added.';
  
    EXCEPTION
      WHEN DUP_VAL_ON_INDEX THEN
        msg := 'You have tried to insert a duplicate Department name or Department abbreviation or Department code.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on inserting Department - '||SQLCODE||' -ERROR- '||SQLERRM;
 
END;
/
--update procedure to update department
CREATE OR REPLACE PROCEDURE update_department
(d_id IN VARCHAR, dept_name IN VARCHAR, d_abbr IN VARCHAR, d_code IN VARCHAR, fac_id IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  UPDATE department
  SET department_name = UPPER(dept_name),
      department_abbr = UPPER(d_abbr),
      department_code = d_code,
      faculty_id = fac_id
  
  WHERE department_id = d_id;
  msg := 'Department Update Successfully.';
  
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate Department name or Department abbreviation or Department code.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on inserting Department - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--delete procedure to delete Department
CREATE OR REPLACE PROCEDURE delete_department
(d_id IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  DELETE from department
  WHERE department_id = d_id;
  msg := 'Department delete successfully.';
  
  EXCEPTION
    WHEN OTHERS THEN
      msg := 'Error occour on Delete Department - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--insert procedure to insert program
create or replace PROCEDURE insert_program
(dept_nm VARCHAR , p_nm IN VARCHAR, p_abbr IN VARCHAR, deg IN VARCHAR, msg OUT VARCHAR)
IS
  d_id DEPARTMENT.DEPARTMENT_ID%TYPE;
BEGIN
  
  SELECT
    DEPARTMENT_ID INTO d_id
  FROM
    DEPARTMENT
  WHERE 
    DEPARTMENT_NAME = UPPER(dept_nm);
  
  INSERT INTO program VALUES(LPAD(program_id_generator_f(),3, '0'), UPPER(p_nm), UPPER(p_abbr), UPPER(deg), d_id);
    msg := 'Program ' || p_nm || ' insert Successfully';
    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate Program name or Program abbreviation or Degree.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on insert Program - '||SQLCODE||' -ERROR- '||SQLERRM;

END;
/
--update procedure to update program
CREATE OR REPLACE PROCEDURE update_program
(p_id IN VARCHAR, p_nm IN VARCHAR, p_abbr IN VARCHAR, deg IN VARCHAR, d_id IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  UPDATE program
  SET program_name = UPPER(p_nm),
      program_abbr = UPPER(p_abbr),
      degree = UPPER(deg),
      department_id = d_id
  
  WHERE program_id = p_id;
  msg := 'Program update successfully.';
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate Program name or Program abbreviation or Degree.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on Update Program - '||SQLCODE||' -ERROR- '||SQLERRM;

END;
/
--delete procedure to delete program
CREATE OR REPLACE PROCEDURE delete_program
(p_id IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  DELETE from program
  WHERE program_id = p_id;
  
  msg := 'Program Delete Successfully';
  
  EXCEPTION  
    WHEN OTHERS THEN
      msg := 'Error occour on Delete Program - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--insert procedure to session
create or replace PROCEDURE insert_session_p
(dept_nm IN VARCHAR, prog IN VARCHAR, sec IN VARCHAR,ace_yr IN VARCHAR, msg OUT VARCHAR)
IS
  dept_id DEPARTMENT.DEPARTMENT_ID%TYPE;
  pgm_id  PROGRAM.PROGRAM_ID%TYPE;
BEGIN

  SELECT 
    DEPARTMENT_ID INTO dept_id
  FROM
    DEPARTMENT
  WHERE 
    DEPARTMENT_NAME = UPPER(dept_nm);
  
  SELECT 
    program_id INTO pgm_id
  FROM
    program
  WHERE 
    program_abbr = UPPER(prog)
  AND
    DEPARTMENT_ID = dept_id;
  

  INSERT INTO session_ VALUES(LPAD(session_id_generator_f(),8, '0'), sec, ace_yr, pgm_id);
  msg := 'New Session: ' || sec || ' is Successfully add!!';
  
    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate session.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on session insert - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--update procedure to session
CREATE OR REPLACE PROCEDURE update_session_p
(sec_id IN VARCHAR, sec IN VARCHAR,ace_yr IN VARCHAR, pgm_id IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  UPDATE session_
  SET session_desc = UPPER(sec),
      academic_year = ace_yr,
      program_id = pgm_id
      WHERE session_id = sec_id;

  msg := 'Session update successfully.';
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate in Session.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on Update Session - '||SQLCODE||' -ERROR- '||SQLERRM;

END;
/
--delete session procedure
CREATE OR REPLACE PROCEDURE delete_session_p
(sec_id IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  DELETE from session_
  WHERE session_id = sec_id;
  
  msg := 'Session Delete Successfully';
  
  EXCEPTION  
    WHEN OTHERS THEN
      msg := 'Error occour on Delete Session - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--insert procedure to semester
CREATE OR REPLACE PROCEDURE insert_semester_p
(sem IN VARCHAR, yr IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  INSERT INTO semester VALUES(sem , UPPER(yr));
    msg := 'Semester ' || sem || ' insert Successfully';
    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate semester.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on insert semester - '||SQLCODE||' -ERROR- '||SQLERRM;

END;
/
--insert residential hall
CREATE OR REPLACE PROCEDURE insert_residential_hall_p
(res_type IN VARCHAR, res_name IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  INSERT INTO residential_hall VALUES(LPAD(hall_id_generator_f(),3, '0'), res_type, UPPER(res_name));
  msg := 'New Residential Hall: ' || res_name || ' is Successfully add!!';
  
    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate Hall name.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on Hall insert - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--update  residential hall
CREATE OR REPLACE PROCEDURE update_res_hall_p
(res_id IN VARCHAR ,res_type IN VARCHAR, res_name IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  UPDATE residential_hall
  SET residential_type = res_type,
      residential_name = res_name
      WHERE residential_id = res_id;

  msg := 'Residential Hall update successfully.';
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a duplicate in Hall.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on Update Hall - '||SQLCODE||' -ERROR- '||SQLERRM;

END;
/
--deleter residential hall
CREATE OR REPLACE PROCEDURE delete_res_hall_p
(res_id IN VARCHAR, msg OUT VARCHAR)
IS
  
BEGIN
  DELETE from residential_hall
  WHERE residential_id = res_id;
  
  msg := 'Hall Delete Successfully';
  
  EXCEPTION  
    WHEN OTHERS THEN
      msg := 'Error occour on Delete Hall - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--insert teacher procedure
create or replace PROCEDURE insert_teacher_p
(nm IN VARCHAR,deg IN VARCHAR, dept_name IN VARCHAR , msg OUT VARCHAR)
IS
  dep_id DEPARTMENT.DEPARTMENT_ID%type;
BEGIN
  SELECT  
    DEPARTMENT_ID INTO dep_id
  FROM
    DEPARTMENT
  WHERE
    DEPARTMENT_NAME = UPPER(dept_name);
  
  INSERT INTO teacher VALUES(LPAD(teacher_id_generator_f(),4, '0'), UPPER(nm), UPPER(deg), dep_id);
  msg := 'New Teacher: ' || nm || ' is Successfully add!!';
  
    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a Duplicate name.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on teacher insert - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--insert studen_info procedure 
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
/
--insert studen_info courses
create or replace PROCEDURE insert_courses_p
(dept IN VARCHAR, progrm IN VARCHAR, sec IN VARCHAR, crs_cd IN VARCHAR, crs_tit IN VARCHAR,crs_cre IN number, crs_type IN VARCHAR , sem_id IN VARCHAR,tec_name IN VARCHAR,msg OUT VARCHAR)
IS
  dept_id department.department_id%TYPE;
  prog_id program.program_id%TYPE;
  sec_id session_.session_id%TYPE;
  tec_id teacher.teacher_id%TYPE;
BEGIN
  
--  FIND DEPARTMENT ID
  SELECT 
    department_id INTO dept_id
  FROM 
    department
  WHERE 
    department_name = UPPER(dept);
    
--  FIND PROGRAM ID
  SELECT 
    program_id INTO prog_id
  FROM 
    program
  WHERE 
    program_abbr = UPPER(progrm)
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

--FIND TEACHER ID
  
  SELECT 
    teacher_id INTO tec_id
  FROM 
    teacher
  WHERE 
    teacher_name = UPPER(tec_name)
  AND
    department_id = dept_id;

  INSERT INTO COURSES VALUES(LPAD(course_id_generator_f(),5, '0'), UPPER(crs_cd), UPPER(crs_tit), crs_cre,crs_type,sec_id,sem_id,tec_id);
  msg := 'New Course: ' || crs_tit || ' is Successfully add!!';
  
    EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a Duplicate course code.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on courses insert - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
--insert marks_theory
CREATE OR REPLACE PROCEDURE insert_marks_theory_p
(third_ex IN NUMBER, ext_ex IN NUMBER,int_ex IN number, cls_tst IN NUMBER ,attn IN NUMBER, roll IN VARCHAR,crs_id IN VARCHAR, crs_as_id IN NUMBER,sts IN VARCHAR)
IS
  
BEGIN
  INSERT INTO marks_theory VALUES(third_ex,ext_ex,int_ex,cls_tst,attn,roll,crs_id,crs_as_id,sts);
  
    EXCEPTION
    WHEN OTHERS THEN
     raise_application_error(-20109,'Error Occour in insert marks theory '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/
--insert marks_lab
CREATE OR REPLACE PROCEDURE insert_marks_lab_p
(cpa IN NUMBER, qv IN NUMBER,pr IN number,roll IN VARCHAR,crs_id IN VARCHAR, crs_as_id IN NUMBER,sts IN VARCHAR)
IS
  
BEGIN
  INSERT INTO marks_lab VALUES(cpa,qv,pr,roll,crs_id,crs_as_id,sts);
  
    EXCEPTION
    WHEN OTHERS THEN
     raise_application_error(-20109,'Error Occour in insert marks theory '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/
--insert marks_viva
CREATE OR REPLACE PROCEDURE insert_marks_viva_p
(total IN NUMBER,roll IN VARCHAR,crs_id IN VARCHAR, crs_as_id IN NUMBER,sts IN VARCHAR)
IS
  
BEGIN
  INSERT INTO marks_viva VALUES(total,roll,crs_id,crs_as_id,sts);
  
    EXCEPTION
    WHEN OTHERS THEN
     raise_application_error(-20109,'Error Occour in insert marks theory '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/
--insert marks_thesis
CREATE OR REPLACE PROCEDURE insert_marks_thesis_p
(thx IN NUMBER, ex IN NUMBER,ix IN   NUMBER,pr IN NUMBER,vv IN NUMBER,roll IN VARCHAR,crs_id IN VARCHAR, crs_as_id IN NUMBER,sts IN VARCHAR)
IS
  
BEGIN
  INSERT INTO marks_thesis_or_project VALUES(thx,ex,ix,pr, vv,roll,crs_id,crs_as_id,sts);
  
    EXCEPTION
    WHEN OTHERS THEN
     raise_application_error(-20109,'Error Occour in insert marks theory '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/
--insert theory, mark, viva,thesis
CREATE OR REPLACE PROCEDURE insert_blank_marksheet_p
(sem_id IN VARCHAR, sec_id IN VARCHAR,crs_as_id IN NUMBER)
IS
 cursor stdRollC is
 select student_roll from student_info where session_id = sec_id;
 
 cursor allCourse is 
 select course_id, course_type from courses where session_id = sec_id AND semester_id = sem_id;
BEGIN
  FOR std IN stdRollC
    LOOP
    FOR crs IN allCourse
    LOOP
      IF crs.course_type = 'theory' THEN
        insert_marks_theory_p(NULL, NULL, NULL, NULL,NULL,std.student_roll,crs.course_id,crs_as_id, NULL);
      ELSIF crs.course_type = 'lab' THEN
        insert_marks_lab_p(NULL,NULL,NULL,std.student_roll,crs.course_id,crs_as_id, NULL);
      ELSIF crs.course_type = 'central viva' THEN
        insert_marks_viva_p(NULL,std.student_roll,crs.course_id,crs_as_id, NULL);
      ELSE
        insert_marks_thesis_p(NULL, NULL, NULL, NULL,NULL,std.student_roll,crs.course_id,crs_as_id, NULL);
      END IF;
    END LOOP;
  END LOOP;
END;
/
--insert course_assign
CREATE OR REPLACE PROCEDURE insert_course_assign_p
(sem_id IN VARCHAR, sec_id IN VARCHAR,msg OUT VARCHAR)
IS
  cs_as_id COURSE_ASSIGN.COURSE_ASSIGN_ID%TYPE;
BEGIN
  cs_as_id:= crs_ass_id_generator_f();
  INSERT INTO course_assign VALUES(cs_as_id,sem_id,sec_id);
  
  insert_blank_marksheet_p(sem_id, sec_id, cs_as_id);
  msg:= sem_id || ' semester course successfully assign';
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      msg := 'You have tried to insert a Duplicate name.';
  
    WHEN OTHERS THEN
      msg := 'Error occour on teacher insert - '||SQLCODE||' -ERROR- '||SQLERRM;
END;
/
