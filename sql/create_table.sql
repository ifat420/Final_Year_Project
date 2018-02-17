CREATE TABLE faculty(
  faculty_id       VARCHAR(2)   NOT NULL,
  faculty_name     VARCHAR(60) NOT NULL 
);

CREATE TABLE department(
  department_id      VARCHAR(2)   NOT NULL,
  department_name    VARCHAR(60) NOT NULL,
  department_abbr    VARCHAR(10) NOT NULL,
  department_code    VARCHAR(10)  NOT NULL,
  faculty_id         VARCHAR(2)
);

CREATE TABLE program(
  program_id      VARCHAR(10) NOT NULL,
  program_name    VARCHAR(60) NOT NULL,
  program_abbr    VARCHAR(10) NOT NULL,
  degree          VARCHAR(10) NOT NULL,
  department_id   VARCHAR(2)

);

CREATE TABLE session_(
  session_id            VARCHAR(10)   NOT NULL,
  session_id_origin     VARCHAR(10),
  session_desc          VARCHAR(60)  NOT NULL,
  academic_year         DATE   NOT NULL,
  program_id            VARCHAR(10)
);

CREATE TABLE semester(
  semester_id VARCHAR(10)   NOT NULL,
  year        DATE   NOT NULL,
  sem         FLOAT(5)    NOT NULL
);

CREATE TABLE residential_hall(
  residential_id        VARCHAR(10)  NOT NULL,
  residential_type      VARCHAR2(10) CHECK( residential_type IN ('male','female') ) NOT NULL,
  residential_name      VARCHAR(40) NOT NULL
);

CREATE TABLE student_info(
  student_roll          VARCHAR(10)   NOT NULL,
  registration_id       VARCHAR(10)   NOT NULL,   
  student_first_name    VARCHAR(40)  NOT NULL,
  student_second_name   VARCHAR(40),  
  student_father_name   VARCHAR(40)  NOT NULL,
  student_mother_name   VARCHAR(40)  NOT NULL,
  student_phone_number  VARCHAR(15)   NOT NULL,
  date_of_birth         DATE         NOT NULL,
  gender                VARCHAR2(10) CHECK( gender IN ('male','female') ) NOT NULL,
  religion              VARCHAR(20),
  permanent_address     VARCHAR(60),
  present_address       VARCHAR(60),
  student_email         VARCHAR(40),
  nationality           VARCHAR(30),
  status                VARCHAR(40),
  session_id            VARCHAR(10),
  session_id_origin     VARCHAR(10),
  residential_id        VARCHAR(10)

);

CREATE TABLE courses(
  course_id        VARCHAR(10)   NOT NULL,
  course_code      VARCHAR(10)   NOT NULL,
  course_title     VARCHAR(40)  NOT NULL,
  course_credit    FLOAT(5)    NOT NULL,
  course_type      VARCHAR2(30) CHECK( course_type IN ('lab','theory','central viva', 'tour') ) NOT NULL,
  session_id       VARCHAR(10),
  semester_id      VARCHAR(10),
  teacher_id       VARCHAR(10)
    
);

CREATE TABLE grade_scale(
  upper_limit      FLOAT(5)    NOT NULL,
  lower_limit      FLOAT(5)    NOT NULL,
  gp               FLOAT(5)    NOT NULL,
  letter_grade     VARCHAR(2)    NOT NULL 
);

CREATE TABLE promotion(
  promotion_id        NUMBER(10)   NOT NULL,
  semester_id         VARCHAR(10),
  session_id          VARCHAR(10)

);

CREATE TABLE marks_theory(
  third_examiner        FLOAT(5),
  external_examiner     FLOAT(5),  
  internal_examiner     FLOAT(5),
  class_test            FLOAT(5),
  attendance            FLOAT(5),
  student_roll          VARCHAR(10),
  course_id        VARCHAR(10)
);

CREATE TABLE marks_lab(
  cpa    FLOAT(5),
  qv     FLOAT(5),  
  pr     FLOAT(5),
  student_roll          VARCHAR(10),
  course_id        VARCHAR(10)
);

CREATE TABLE marks_viva(
  total    FLOAT(4),
  student_roll          VARCHAR(10),
  course_id        VARCHAR(10)

);

CREATE TABLE marks_thesis_or_project(
  third_examiner        FLOAT(5),
  external_examiner     FLOAT(5),  
  internal_examiner     FLOAT(5),
  pr                    FLOAT(5),
  viva_voce             FLOAT(5),
  student_roll          VARCHAR(10),
  course_id             VARCHAR(10)
);

CREATE TABLE teacher(
  teacher_id          VARCHAR(10)  NOT NULL,
  teacher_first_name  VARCHAR(30) NOT NULL,
  teacher_second_name VARCHAR(30) NOT NULL,
  teacher_designation VARCHAR(30) NOT NULL,
  department_id      VARCHAR(2)
);


