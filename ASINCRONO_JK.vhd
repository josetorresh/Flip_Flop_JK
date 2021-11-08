library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ASINCRONO_JK is
	port( J, K, clk, rst : in std_logic;
             Q, Qbar : out std_logic);
end ASINCRONO_JK;

architecture Behavioral of ASINCRONO_JK is

	signal CONT : STD_LOGIC_VECTOR (25 downto 0);
	SIGNAL CLKO : STD_LOGIC;

begin

	process(CLK)
		begin
			if(rising_edge(CLK)) then
				CONT <= CONT + '1';
			end if;
	end process;
	
	CLKO <=  CONT(25);

	process (CLKO,rst)
		variable qn : std_logic;
	begin
	if(rst = '1')then
		qn := '0';
		--elsif(clk'event and CLKO = '1')then
		elsif(rising_edge(CLKO))then
			if(J='0' and K='0')then
				qn := qn;
				elsif(J='0' and K='1')then
				qn := '0';
				elsif(J='1' and K='0')then
				qn := '1';
				elsif(J='1' and K='1')then
				qn := not qn;
				else
				null;
			end if;
		else
			null;
	end if;
	Q <= qn;
	Qbar <= not qn;
	
end process;
end Behavioral;