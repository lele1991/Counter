library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
--    generic(
--        constant NBITS: integer := 16
--    );
end entity testbench;

architecture RTL of testbench is
    signal clkT:            std_logic;
    signal aclr_nT:         std_logic;
    signal counter_outT:    std_logic_vector(1 downto 0);

begin
    dut_reg: entity work.counter
        port map(
        --esqerda _vhd >> direita testbench
            clk => clkT,
            aclr_n => aclr_nT,
            counter_out => counter_outT
        );
        
    process
        begin
        
            clkT <= '0';
            aclr_nT <= '0';
            --aux=00 
            wait for 10 ns;
            
            clkT <= '1';
            aclr_nT <= '1';
            --aux=01
            wait for 10 ns;
            
            
            clkT <= '0';
            aclr_nT <= '1';
            --counter_out=aux=01
            wait for 10 ns;
            
            clkT <= '1';
            aclr_nT <= '1';
            --aux=10
            wait;           
    end process;
        
end architecture RTL;