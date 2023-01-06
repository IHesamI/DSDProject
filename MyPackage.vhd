LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE MyPackage IS
    -- Data types 
    TYPE student_id IS ARRAY (7 DOWNTO 0) BIT;
    TYPE student_passed_courses IS ARRAY (31 DOWNTO 0) OF bit_vector(7 DOWNTO 0);
    TYPE term_course IS ARRAY (31 DOWNTO 0) OF bit_vector(7 DOWNTO 0);
    -- Student Class  contains: 
    --                         1. id ,
    --                         2. courses which passed by the student , 
    --                         3. courses that student wants to apply

    TYPE Student IS RECORD
        id : student_id;
        student_courses : array_of_course;
        this_term_course : term_course;
    END PACKAGE MyPackage;