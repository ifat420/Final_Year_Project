CREATE TABLE faculty(
  faculty_id       NUMBER(2)   NOT NULL,
  faculty_name     VARCHAR(60) NOT NULL 
);

CREATE TABLE department(
  department_id      NUMBER(2)   NOT NULL,
  department_name    VARCHAR(60) NOT NULL,
  department_abbr    VARCHAR(10) NOT NULL,
  department_code    NUMBER(10)  NOT NULL
);

CREATE TABLE program(
  program_id      NUMBER(10)  NOT NULL,
  program_name    VARCHAR(60) NOT NULL,
  program_abbr    VARCHAR(10) NOT NULL,
  degree       VARCHAR(10)    NOT NULL
);

CREATE TABLE session_(
  session_id      NUMBER(10)   NOT NULL,
  session_desc    VARCHAR(60)  NOT NULL,
  academic_year   DATE   NOT NULL
);

CREATE TABLE semester(
  semester_id NUMBER(10)   NOT NULL,
  year        DATE   NOT NULL,
  sem         NUMBER(3)    NOT NULL
);

CREATE TABLE residential_hall(
  residential_id        NUMBER(10)  NOT NULL,
  residential_type      ENUM('male','female'),
  residential_name      VARCHAR(40) NOT NULL
);

CREATE TABLE student_info(
  student_roll          NUMBER(10)   NOT NULL,
  registration_id       NUMBER(10)   NOT NULL,   
  student_first_name    VARCHAR(40)  NOT NULL,
  student_second_name   VARCHAR(40),  
  student_father_name   VARCHAR(40)  NOT NULL,
  student_mother_name   VARCHAR(40)  NOT NULL,
  student_phone_number  NUMBER(15)   NOT NULL,
  date_of_birth         DATE         NOT NULL,
  gender                VARCHAR(10)  NOT NULL,
  religion              VARCHAR(20),
  permanent_address     VARCHAR(60),
  present_address       VARCHAR(60),
  student_email         VARCHAR(40),
  nationality           VARCHAR(30),
  status                VARCHAR(40)  
);

CREATE TABLE courses(
  course_id        NUMBER(10)   NOT NULL,
  course_code      NUMBER(10)   NOT NULL,
  course_title     VARCHAR(40)  NOT NULL,
  course_credit    NUMBER(3)    NOT NULL,
  course_type      VARCHAR(20)  NOT NULL  
);

CREATE TABLE grade_scale(
  upper_limit      NUMBER(4)    NOT NULL,
  lower_limit      NUMBER(4)    NOT NULL,
  gp               NUMBER(5)    NOT NULL,
  letter_grade     NUMBER(5)    NOT NULL 
);

CREATE TABLE promotion(
  promotion_id        NUMBER(10)   NOT NULL
);

CREATE TABLE marks_theory(
  third_examiner        NUMBER(4),
  external_examiner     NUMBER(4),  
  internal_examiner     NUMBER(4)   NOT NULL,
  class_test            NUMBER(4)   NOT NULL,
  attendance            NUMBER(4)   NOT NULL
);

CREATE TABLE marks_lab(
  cpa    NUMBER(4)   NOT NULL,
  qv     NUMBER(4)   NOT NULL,  
  pr     NUMBER(4)   NOT NULL
);

CREATE TABLE marks_viva(
  total    NUMBER(4)   NOT NULL

);

CREATE TABLE marks_thesis_or_project(
  third_examiner        NUMBER(4),
  external_examiner     NUMBER(4),  
  internal_examiner     NUMBER(4)   NOT NULL,
  pr                    NUMBER(4)   NOT NULL,
  viva_voce             NUMBER(4)   NOT NULL
);

CREATE TABLE teacher(
  teacher_id          NUMBER(10)  NOT NULL,
  teacher_first_name  VARCHAR(30) NOT NULL,
  teacher_second_name VARCHAR(30) NOT NULL,
  teacher_designation VARCHAR(30) NOT NULL
);


