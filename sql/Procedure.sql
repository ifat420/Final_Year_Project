--insert procedure to insert Faculty
CREATE OR REPLACE PROCEDURE insert_faculty
(fac_name IN VARCHAR)
IS
  
BEGIN
  INSERT INTO faculty VALUES(LPAD(faculty_id_generator(),2, '0'), UPPER(fac_name));
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20001,'Error occour on insertFaculty Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

--update procedure to update Faculty
CREATE OR REPLACE PROCEDURE update_faculty
(fac_id IN VARCHAR, fac_name IN VARCHAR)
IS
  
BEGIN
  UPDATE faculty
  SET faculty_name = UPPER(fac_name)
  WHERE faculty_id = fac_id;
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20002,'Error occour on updateFaculty Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

--delete procedure to delete Faculty
CREATE OR REPLACE PROCEDURE delete_faculty
(fac_id IN VARCHAR)
IS
  
BEGIN
  DELETE from faculty
  WHERE faculty_id = fac_id;
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20003,'Error occour on deleteFaculty Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

--insert procedure to insert Department
CREATE OR REPLACE PROCEDURE insert_department
(dept_name IN VARCHAR, d_abbr IN VARCHAR, d_code IN VARCHAR, fac_id IN VARCHAR)
IS
  
BEGIN
  INSERT INTO department VALUES(LPAD(department_id_generator(),2, '0'), UPPER(dept_name), UPPER(d_abbr),d_code, fac_id);
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20004,'Error occour on insert_department Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

--update procedure to update department
CREATE OR REPLACE PROCEDURE update_department
(d_id IN VARCHAR, dept_name IN VARCHAR, d_abbr IN VARCHAR, d_code IN VARCHAR, fac_id IN VARCHAR)
IS
  
BEGIN
  UPDATE department
  SET department_name = UPPER(dept_name),
      department_abbr = UPPER(d_abbr),
      department_code = d_code,
      faculty_id = fac_id
  
  WHERE department_id = d_id;
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20005,'Error occour on update_department Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

--delete procedure to delete Department
CREATE OR REPLACE PROCEDURE delete_department
(d_id IN VARCHAR)
IS
  
BEGIN
  DELETE from department
  WHERE department_id = d_id;
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20003,'Error occour on delete_department Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

--insert procedure to insert Faculty
CREATE OR REPLACE PROCEDURE insert_program
(p_nm IN VARCHAR, p_abbr IN VARCHAR, deg IN VARCHAR, d_id IN VARCHAR)
IS
  
BEGIN
  INSERT INTO program VALUES(LPAD(program_id_generator(),3, '0'), UPPER(p_nm), UPPER(p_abbr), UPPER(deg), d_id);
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20001,'Error occour on insertFaculty Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

--update procedure to update program
CREATE OR REPLACE PROCEDURE update_program
(p_id IN VARCHAR, p_nm IN VARCHAR, p_abbr IN VARCHAR, deg IN VARCHAR, d_id IN VARCHAR)
IS
  
BEGIN
  UPDATE program
  SET program_name = UPPER(p_nm),
      program_abbr = UPPER(p_abbr),
      degree = UPPER(deg),
      department_id = d_id
  
  WHERE program_id = p_id;
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20005,'Error occour on update_department Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

--delete procedure to delete program
CREATE OR REPLACE PROCEDURE delete_program
(p_id IN VARCHAR)
IS
  
BEGIN
  DELETE from program
  WHERE program_id = p_id;
  
  EXCEPTION
  WHEN OTHERS THEN
    raise_application_error(-20003,'Error occour on delete_department Procedure - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

