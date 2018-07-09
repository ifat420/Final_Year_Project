--function to generate faculty_id
CREATE OR REPLACE FUNCTION faculty_id_generator_f
  RETURN VARCHAR 
IS
  v_id VARCHAR(5);  
BEGIN
  SELECT max(faculty_id) INTO v_id FROM faculty;
  IF v_id IS NULL then
    v_id := '1';
  ELSE
    v_id := v_id + 1;
  END IF;    
  RETURN v_id;
END;
/
--function to generate department_id
CREATE OR REPLACE FUNCTION department_id_generator_f
  RETURN VARCHAR 
IS
  d_id VARCHAR(5);
  
BEGIN
  SELECT max(department_id) INTO d_id FROM department;
  
  IF d_id IS NULL then
    d_id := '1';
  ELSE
    d_id := d_id + 1;
  END IF;    
  RETURN d_id;
END;
/
--function to generate program_id
CREATE OR REPLACE FUNCTION program_id_generator_f
  RETURN VARCHAR 
IS
  p_id VARCHAR(10);
  
BEGIN
  SELECT max(program_id) INTO p_id FROM program;
  
  IF p_id IS NULL then
    p_id := '1';
  ELSE
    p_id := p_id + 1;
  END IF;
  
  
  RETURN p_id;
  EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20109,'Error Occour in program_id_generator'||SQLCODE||' -ERROR- '||SQLERRM);

END;
/
--function to generate session_id
CREATE OR REPLACE FUNCTION session_id_generator_f
  RETURN VARCHAR 
IS
  s_id VARCHAR(10);
  
BEGIN
  SELECT max(session_id)
  INTO s_id
  FROM session_;
  
  IF s_id IS NULL then
    s_id := '1';
  ELSE
    s_id := s_id + 1;
  END IF;
  
  
  RETURN s_id;
  EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20109,'Error Occour in session_id_generator'||SQLCODE||' -ERROR- '||SQLERRM);

END;
/
--function hall id generator
CREATE OR REPLACE FUNCTION hall_id_generator_f
  RETURN VARCHAR 
IS
  h_id VARCHAR(10);
  
BEGIN
  SELECT max(residential_id)
  INTO h_id
  FROM residential_hall;
  
  IF h_id IS NULL then
    h_id := '1';
  ELSE
    h_id := h_id + 1;
  END IF;
  
  
  RETURN h_id;
  EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20109,'Error Occour in hall_id_generator'||SQLCODE||' -ERROR- '||SQLERRM);

END;
/
--function to generate teacher_id
CREATE OR REPLACE FUNCTION teacher_id_generator_f
  RETURN VARCHAR 
IS
  t_id VARCHAR(10);
  
BEGIN
  SELECT max(teacher_id)
  INTO t_id
  FROM teacher;
  
  IF t_id IS NULL then
    t_id := '1';
  ELSE
    t_id := t_id + 1;
  END IF;
  
  
  RETURN t_id;
  EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20109,'Error Occour in teacher_id_generator'||SQLCODE||' -ERROR- '||SQLERRM);

END;
/
--function generate course id
CREATE OR REPLACE FUNCTION course_id_generator_f
  RETURN VARCHAR 
IS
  c_id VARCHAR(10);
  
BEGIN
  SELECT max(course_id)
  INTO c_id
  FROM courses;
  
  IF c_id IS NULL then
    c_id := '1';
  ELSE
    c_id := c_id + 1;
  END IF;
  
  
  RETURN c_id;
  EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20109,'Error Occour in teacher_id_generator'||SQLCODE||' -ERROR- '||SQLERRM);

END;
/
-- function course_assign
CREATE OR REPLACE FUNCTION crs_ass_id_generator_f
  RETURN VARCHAR 
IS
  ca_id COURSE_ASSIGN.COURSE_ASSIGN_ID%TYPE;
  
BEGIN
  SELECT max(COURSE_ASSIGN_ID)
  INTO ca_id
  FROM COURSE_ASSIGN;
  
  IF ca_id IS NULL then
    ca_id := 1;
  ELSE
    ca_id := ca_id + 1;
  END IF;
  
  
  RETURN ca_id;
  EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20109,'Error Occour in course_assign_id'||SQLCODE||' -ERROR- '||SQLERRM);

END;
--insert in theory lab viva thesis

