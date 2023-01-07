LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work;
USE Work.MyPackage.ALL;

LIBRARY STD;
USE STD.textio.ALL;

ENTITY Golestan IS
    PORT (
        clk : IN BIT;
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
    SIGNAL COURSES : CoursesWithPre;
    SIGNAL W_VALUE_1, W_VALUE_2 : bit_vector(15 DOWNTO 0);
    SIGNAL File_line_reader_counter_signal : INTEGER := 0;
BEGIN

    reading_file : PROCESS (clk)
        VARIABLE L_IN : line;
        VARIABLE DATA_1, DATA_2 : bit_vector(15 DOWNTO 0);
        FILE STIM_IN : text OPEN read_mode IS "Courses.txt";
        VARIABLE File_line_reader_counter : INTEGER := 0;
    BEGIN
        IF rising_edge(clk) THEN
            if not (File_line_reader_counter=3) then
                readline(STIM_IN, L_IN);
                read(L_IN, DATA_1);
                -- W_VALUE_1 <= DATA_1;
                COURSES(File_line_reader_counter) <= DATA_1;
                File_line_reader_counter := File_line_reader_counter + 1;
                File_line_reader_counter_signal <= File_line_reader_counter;
            END if;
        END IF;
    END PROCESS reading_file; -- reading_file

    mainproc : PROCESS (StudentID, CourseID)
        VARIABLE course_counter : INTEGER := 0;

    BEGIN
        IF (Stu_id_checker(StudentID, Students)) THEN
            ThePerson.id <= StudentID;
        ELSE
            istrue <= false;

            ASSERT false
            REPORT "Error: 400 Bad Request"
                SEVERITY error;
        END IF;
    END PROCESS mainproc;

END ARCHITECTURE rtl;