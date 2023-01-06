LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY work;
USE Work.MyPackage.ALL;

ENTITY GolestanTb IS
END ENTITY GolestanTb;

ARCHITECTURE dataflow OF GolestanTb IS

    COMPONENT Golestan IS
        PORT (
            StudentID : IN student_id;
            CourseID : IN bit_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL StudentID : student_id := "0000000001";
    SIGNAL CourseID : bit_vector(7 DOWNTO 0);
BEGIN
    uut : Golestan PORT MAP(
        StudentID => StudentID,
        CourseID => CourseID
    );
    StudentID <= "0000000000" AFTER 1 ns;

END dataflow;