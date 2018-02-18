--function to generate faculty_id
CREATE OR REPLACE FUNCTION faculty_id_generator
  RETURN VARCHAR 
IS
  v_id VARCHAR(5);
  
BEGIN
  SELECT max(faculty_id)
  INTO v_id
  FROM faculty;
  
  IF v_id IS NULL then
    v_id := '1';
  ELSE
    v_id := v_id + 1;
  END IF;
  
  
  RETURN v_id;
  EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20009,'Error Occour in faculty_id_generator'||SQLCODE||' -ERROR- '||SQLERRM);

END;

--function to generate department_id
CREATE OR REPLACE FUNCTION department_id_generator
  RETURN VARCHAR 
IS
  d_id VARCHAR(5);
  
BEGIN
  SELECT max(department_id)
  INTO d_id
  FROM department;
  
  IF d_id IS NULL then
    d_id := '1';
  ELSE
    d_id := d_id + 1;
  END IF;
  
  
  RETURN d_id;
  EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20109,'Error Occour in faculty_id_generator'||SQLCODE||' -ERROR- '||SQLERRM);

END;

--function to generate session_id
CREATE OR REPLACE FUNCTION program_id_generator
  RETURN VARCHAR 
IS
  p_id VARCHAR(10);
  
BEGIN
  SELECT max(program_id)
  INTO p_id
  FROM program;
  
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


--function to generate session_id
CREATE OR REPLACE FUNCTION session_id_generator
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

