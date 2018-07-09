/* indexes for TABLE faculty */
ALTER TABLE faculty ADD CONSTRAINT pk_faculty PRIMARY KEY(faculty_id);
ALTER TABLE faculty ADD CONSTRAINT faculty_unique UNIQUE(faculty_name);

/* indexes for TABLE teacher */
ALTER TABLE teacher ADD CONSTRAINT fk_teacher PRIMARY KEY(teacher_id);


/* indexes for TABLE department */
ALTER TABLE department ADD CONSTRAINT pk_department PRIMARY KEY(department_id);
ALTER TABLE department ADD CONSTRAINT department_name_unique UNIQUE(department_name);
ALTER TABLE department ADD CONSTRAINT department_abbr_unique UNIQUE(department_abbr);
ALTER TABLE department ADD CONSTRAINT department_code_unique UNIQUE(department_code);

ALTER TABLE department
ADD CONSTRAINT fk_dept_faculty
  FOREIGN KEY (faculty_id)
  REFERENCES faculty(faculty_id);

/* indexes for TABLE program */
ALTER TABLE program ADD CONSTRAINT pk_program PRIMARY KEY(program_id);
ALTER TABLE program
ADD CONSTRAINT fk_pro_department
  FOREIGN KEY (department_id)
  REFERENCES department(department_id);

/* indexes for TABLE session_ */
ALTER TABLE session_ ADD CONSTRAINT pk_session_ PRIMARY KEY(session_id);


ALTER TABLE session_
ADD CONSTRAINT fk_sec_program
  FOREIGN KEY (program_id)
  REFERENCES program(program_id);


/* indexes for TABLE semester */
ALTER TABLE semester ADD CONSTRAINT pk_semester PRIMARY KEY(semester_id);

/* indexes for TABLE residential_ */
ALTER TABLE residential_hall ADD CONSTRAINT pk_residential PRIMARY KEY(residential_id);
ALTER TABLE residential_hall ADD CONSTRAINT residential_name_unique UNIQUE(residential_name);

/* indexes for TABLE student_info */
ALTER TABLE student_info ADD CONSTRAINT pk_student PRIMARY KEY(student_roll);
ALTER TABLE student_info ADD CONSTRAINT registration_id_unique UNIQUE(registration_id);
ALTER TABLE student_info
ADD CONSTRAINT fk_stu_session_
  FOREIGN KEY (session_id)
  REFERENCES session_(session_id);
  
ALTER TABLE student_info
ADD CONSTRAINT fk_stu_session_origin_
  FOREIGN KEY (session_id_origin)
  REFERENCES session_(session_id);
  
ALTER TABLE student_info
ADD CONSTRAINT fk_stu_residential_hall
  FOREIGN KEY (residential_id)
  REFERENCES residential_hall(residential_id);


/* indexes for TABLE courses */
ALTER TABLE courses ADD CONSTRAINT pk_course PRIMARY KEY(course_id);

ALTER TABLE courses
ADD CONSTRAINT fk_cor_semester
  FOREIGN KEY (semester_id)
  REFERENCES semester(semester_id);
  
ALTER TABLE courses
ADD CONSTRAINT fk_cor_session_
  FOREIGN KEY (session_id)
  REFERENCES session_(session_id);

ALTER TABLE courses
ADD CONSTRAINT fk_cor_teacher
  FOREIGN KEY (teacher_id)
  REFERENCES teacher(teacher_id);


/* indexes for TABLE course_assign */
ALTER TABLE course_assign ADD CONSTRAINT fk_promotion PRIMARY KEY(course_assign_id);

ALTER TABLE course_assign
ADD CONSTRAINT fk_ca_semester
  FOREIGN KEY (semester_id)
  REFERENCES semester(semester_id);
  
ALTER TABLE course_assign
ADD CONSTRAINT fk_ca_session_
  FOREIGN KEY (session_id)
  REFERENCES session_(session_id);

/* index for Table result_register */

ALTER TABLE result_register ADD CONSTRAINT fk_result_reg PRIMARY KEY(result_register_id);

ALTER TABLE result_register
ADD CONSTRAINT fk_rr_ca_
  FOREIGN KEY (course_assign_id)
  REFERENCES course_assign(course_assign_id);
  
/* indexes for TABLE marks_theory */
ALTER TABLE marks_theory
ADD CONSTRAINT fk_mt_course
  FOREIGN KEY (course_id)
  REFERENCES courses(course_id);
  
ALTER TABLE marks_theory
ADD CONSTRAINT fk_mt_student_info
  FOREIGN KEY (student_roll)
  REFERENCES student_info(student_roll);

ALTER TABLE marks_theory
ADD CONSTRAINT fk_mt_cs
  FOREIGN KEY (course_assign_id)
  REFERENCES course_assign(course_assign_id);
  
/* indexes for TABLE marks_lab */
ALTER TABLE marks_lab
ADD CONSTRAINT fk_ml_course
  FOREIGN KEY (course_id)
  REFERENCES courses(course_id);
  
ALTER TABLE marks_lab
ADD CONSTRAINT fk_ml_student_info
  FOREIGN KEY (student_roll)
  REFERENCES student_info(student_roll);
  
ALTER TABLE marks_lab
ADD CONSTRAINT fk_ml_cs
  FOREIGN KEY (course_assign_id)
  REFERENCES course_assign(course_assign_id);
  
/* indexes for TABLE marks_viva */
ALTER TABLE marks_viva
ADD CONSTRAINT fk_mv_course
  FOREIGN KEY (course_id)
  REFERENCES courses(course_id);
  
ALTER TABLE marks_viva
ADD CONSTRAINT fk_mv_student_info
  FOREIGN KEY (student_roll)
  REFERENCES student_info(student_roll);
  
ALTER TABLE marks_viva
ADD CONSTRAINT fk_mv_cs
  FOREIGN KEY (course_assign_id)
  REFERENCES course_assign(course_assign_id);
  
/* indexes for TABLE marks_thesis_or_project */
ALTER TABLE marks_thesis_or_project
ADD CONSTRAINT fk_tp_course
  FOREIGN KEY (course_id)
  REFERENCES courses(course_id);
  
ALTER TABLE marks_thesis_or_project
ADD CONSTRAINT fk_tp_student_info
  FOREIGN KEY (student_roll)
  REFERENCES student_info(student_roll);
  
ALTER TABLE marks_thesis_or_project
ADD CONSTRAINT fk_mt_or_pro_cs
  FOREIGN KEY (course_assign_id)
  REFERENCES course_assign(course_assign_id);

