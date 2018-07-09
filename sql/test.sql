SET SERVEROUTPUT ON;
declare
  msg varchar(100);
begin 
  
  insert_course_assign_p('4.2', '00000001', msg);
  DBMS_OUTPUT.PUT_LINE(msg);
end;

SET SERVEROUTPUT ON;
DECLARE
  CURSOR cur_test IS
  SELECT * FROM courses;
BEGIN
  FOR l_idx IN cur_test
    LOOP
      DBMS_OUTPUT.PUT_LINE(l_idx.course_title || ' ' || l_idx.course_type);
    END LOOP;
END;