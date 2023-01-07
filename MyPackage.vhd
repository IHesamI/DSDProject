LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;


PACKAGE MyPackage IS
    -- Data types of Student
    TYPE student_id IS ARRAY (9 DOWNTO 0) OF BIT; -- ID a 10 bits' vector
    TYPE student_passed_courses IS ARRAY (31 DOWNTO 0) OF bit_vector(7 DOWNTO 0); -- 32 bit_vector 
    TYPE term_course IS ARRAY (5 DOWNTO 0) OF bit_vector(7 DOWNTO 0);
    -- Student Class  contains: 
    --                         1. id ,
    --                         2. courses which passed by the student , 
    --                         3. courses that student wants to apply
    TYPE Student IS RECORD
        id : student_id;
        student_courses : student_passed_courses;
        this_term_course : term_course;
    END RECORD Student;
    -- PreCourse & PastCourse 
    TYPE CoursesWithPre IS ARRAY (2 DOWNTO 0) OF bit_vector(15 DOWNTO 0); -- the first 8 bits are precourse which must have been applied for exampl 0000000100000011 => 00000001 => 00000011  
    -- Students
    TYPE students_array IS ARRAY (3 DOWNTO 0) OF student_id; -- There are 4 students as example
END PACKAGE MyPackage;