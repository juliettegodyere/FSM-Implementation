----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2022 16:25:24
-- Design Name: 
-- Module Name: Top_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_tb is
--  Port ( );
end Top_tb;

architecture Behavioral of top_tb is
 signal Clk_Set, Clk_Reset, JAM_A, JAM_B, JAM_C, JAM_D, JAM_Enable: std_logic:='0';
   
   signal Clk_Q_LED: std_logic;
   
   signal Qd_LED: std_logic:='1';
   
   signal Qc_LED: std_logic:='1';
   
   signal Qb_LED: std_logic:='1';
   
   signal Qa_LED: std_logic:='0';
   
   signal Z_LED: std_logic;
   
   signal code: std_logic_vector (3 downto 0);
  
   
begin

a: ENTITY work.top(Behavioral) PORT MAP (
    Clk_Set => Clk_Set,
    Clk_Reset => Clk_Reset,
    JAM_A => JAM_A,
    JAM_B => JAM_B,
    JAM_C => JAM_C,
    JAM_D => JAM_D,
    JAM_Enable => JAM_Enable,
    Qd_LED => Qd_LED,
    Qc_LED => Qc_LED,
    Qb_LED => Qb_LED,
    Qa_LED => Qa_LED,
    Z_LED => Z_LED,
    Clk_Q_LED => CLk_Q_LED
);

process
begin
 
    Clk_Set <= '1';
    WAIT FOR 20ns;
    Clk_Reset <= '0';
    WAIT FOR 20ns;
    Clk_Set <= '0';
    WAIT FOR 20ns;
    Clk_Reset <= '1';
    WAIT FOR 20ns;
end process;

process
begin

    WAIT FOR 400ns;
    JAM_D <= '0';
    JAM_C <= '0';
    JAM_B <= '0';
    JAM_A <= '0';
    
    JAM_Enable <= '1';
    WAIT FOR 20ns;
    JAM_Enable <= '0';
    WAIT FOR 20ns;

    WAIT;
end process;

process(Clk_Q_LED)
begin
    if rising_edge(Clk_Q_LED) then
        code <= Qd_LED & Qc_LED & Qb_LED & Qa_LED; 
    end if;

end process;

end Behavioral;
