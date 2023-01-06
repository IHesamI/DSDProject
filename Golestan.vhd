LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work;
USE Work.MyPackage.ALL;

ENTITY Golestan IS
    PORT (
        StudentID : IN student_id;
        CourseID : IN bit_vector(7 DOWNTO 0)
    );
END ENTITY Golestan;

ARCHITECTURE rtl OF Golestan IS

    FUNCTION Stu_id_checker(a : student_id; Students : students_array) RETURN BOOLEAN IS
    BEGIN
        theforloop : FOR i IN Students'RANGE LOOP
            IF (Students(i) = a) THEN
                RETURN true;
            END IF;
        END LOOP theforloop;
        RETURN false;
    END Stu_id_checker;
    SIGNAL istrue : BOOLEAN := true;
    SIGNAL Students : students_array := ("0000000001", "0000000011", "0000000111", "0000001111");
    SIGNAL ThePerson : Student;
BEGIN

    mainproc : PROCESS (StudentID, CourseID)
        VARIABLE course_counter : INTEGER := 0;
    BEGIN
        IF (Stu_id_checker(StudentID, Students)) THEN
            ThePerson.id <= StudentID;

        ELSE
            -- istrue <= false;
            ASSERT false
            REPORT "Error: 400 Bad Request"
                SEVERITY error;
        END IF;
    END PROCESS mainproc;

END ARCHITECTURE rtl;