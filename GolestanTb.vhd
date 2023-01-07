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
            clk : IN BIT;
            StudentID : IN student_id;
            CourseID : IN bit_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL clk : BIT;
    SIGNAL StudentID : student_id := "0000000001";
    SIGNAL CourseID : bit_vector(7 DOWNTO 0);
BEGIN
    uut : Golestan PORT MAP(
        clk => clk,
        StudentID => StudentID,
        CourseID => CourseID
    );
    StudentID <= "0000000000" AFTER 1 ns;
    clk <= '1', '0' AFTER 1 ns, '1' AFTER 2 ns, '0' AFTER 3 ns , '1' AFTER 4 ns;

END dataflow;