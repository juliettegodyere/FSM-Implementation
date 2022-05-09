---------------------------------------------------------------------------------

-- Company:

-- Engineer:

--

-- Create Date: 03.05.2022 18:04:29

-- Design Name:

-- Module Name: Top - Behavioral

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

entity Top is

Port (Clk_Set, Clk_Reset: in std_logic;

JAM_A,JAM_B,JAM_C,JAM_D,JAM_Enable: in std_logic;

Qd_LED,Qc_LED, Qb_LED, Qa_LED, Z_LED, Clk_Q_LED: out std_logic );

end Top;

architecture Behavioral of Top is

signal Clk_Q: std_logic:='0';

signal Qd: std_logic:='1';

signal Qc: std_logic:='1';

signal Qb: std_logic:='1';

signal Qa: std_logic:='0';

begin

process (Clk_Set, Clk_Reset)

begin

Clk_Q <= Clk_Set OR (NOT Clk_Reset AND Clk_Q);

end process;

process (Clk_Q)

begin

if rising_edge (Clk_Q) then

Qa <= (NOT Qd AND Qb) OR (Qc AND Qa) OR (Qd AND NOT Qc AND NOT Qb) OR (NOT Qc AND Qb AND NOT Qa);

Qb <= (Qc AND NOT Qa) OR (Qc AND NOT Qb) OR (Qd AND NOT Qb) OR (NOT Qc AND Qb AND Qa);

Qc <= (NOT Qd AND NOT Qa) OR (NOT Qc AND NOT Qb) OR (Qd And Qa);

Qd <= (NOT Qc) OR (NOT Qd AND NOT Qa) OR (NOT Qb AND NOT Qa AND Qd);

if JAM_Enable = '1' then

Qa <= JAM_A;

Qb <= JAM_B;

Qc <= JAM_C;

Qd <= JAM_D;

end if;

end if;

end process;

Z_LED <= NOT Qd AND Qc AND Qb AND Qa;

Clk_Q_LED <= Clk_Q;

Qa_LED <= Qa;

Qb_LED <= Qb;

Qc_LED <= Qc;

Qd_LED <= Qd;

end Behavioral;