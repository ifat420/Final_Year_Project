/* indexes for TABLE faculty */
ALTER TABLE faculty ADD CONSTRAINT fk_faculty PRIMARY KEY(faculty_id);
ALTER TABLE faculty ADD CONSTRAINT faculty_unique UNIQUE(faculty_name);

/* indexes for TABLE department */
ALTER TABLE department ADD CONSTRAINT fk_department PRIMARY KEY(department_id);
ALTER TABLE department ADD CONSTRAINT department_name_unique UNIQUE(department_name);
ALTER TABLE department ADD CONSTRAINT department_abbr_unique UNIQUE(department_abbr);
ALTER TABLE department ADD CONSTRAINT department_code_unique UNIQUE(department_code);

/* indexes for TABLE program */
ALTER TABLE program ADD CONSTRAINT fk_program PRIMARY KEY(program_id);
ALTER TABLE program ADD CONSTRAINT program_name_unique UNIQUE(program_name);
ALTER TABLE program ADD CONSTRAINT program_abbr_unique UNIQUE(program_abbr);
ALTER TABLE program ADD CONSTRAINT program_degree_unique UNIQUE(degree);

/* indexes for TABLE session_ */
ALTER TABLE session_ ADD CONSTRAINT fk_session_ PRIMARY KEY(session_id);
ALTER TABLE session_ ADD CONSTRAINT session_desc_unique UNIQUE(session_desc);
ALTER TABLE session_ ADD CONSTRAINT academic_year_unique UNIQUE(academic_year);

/* indexes for TABLE semester */
ALTER TABLE semester ADD CONSTRAINT fk_semester PRIMARY KEY(semester_id);

/* indexes for TABLE residential_ */
ALTER TABLE residential_hall ADD CONSTRAINT fk_residential PRIMARY KEY(residential_id);
ALTER TABLE residential_hall ADD CONSTRAINT residential_name_unique UNIQUE(residential_name);

/* indexes for TABLE student */
ALTER TABLE student ADD CONSTRAINT fk_student PRIMARY KEY(student_roll);
ALTER TABLE student ADD CONSTRAINT registration_id_unique UNIQUE(registration_id);
ALTER TABLE student ADD CONSTRAINT academic_year_unique UNIQUE(academic_year);

/* indexes for TABLE courses */
ALTER TABLE courses ADD CONSTRAINT fk_course PRIMARY KEY(course_id);
ALTER TABLE courses ADD CONSTRAINT course_code_unique UNIQUE(course_code);
ALTER TABLE courses ADD CONSTRAINT course_title_unique UNIQUE(course_title);

/* indexes for TABLE promotion */
ALTER TABLE promotion ADD CONSTRAINT fk_promotion PRIMARY KEY(promotion_id);

/* indexes for TABLE teacher */
ALTER TABLE teacher ADD CONSTRAINT fk_teacher PRIMARY KEY(teacher_id);


