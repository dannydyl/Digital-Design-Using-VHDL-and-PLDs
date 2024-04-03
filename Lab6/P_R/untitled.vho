-- VHDL netlist-file
library mach;
use mach.components.all;

library ieee;
use ieee.std_logic_1164.all;
entity data_selector is
  port (
    a1 : in std_logic;
    b1 : in std_logic;
    a2 : in std_logic;
    b2 : in std_logic;
    gn : in std_logic;
    an : in std_logic;
    y1 : out std_logic;
    y2 : out std_logic
  );
end data_selector;

architecture NetList of data_selector is

  signal a1PIN : std_logic;
  signal b1PIN : std_logic;
  signal a2PIN : std_logic;
  signal b2PIN : std_logic;
  signal gnPIN : std_logic;
  signal anPIN : std_logic;
  signal y1COM : std_logic;
  signal y2COM : std_logic;
  signal T_0 : std_logic;
  signal T_1 : std_logic;
  signal T_2 : std_logic;
  signal T_3 : std_logic;
  signal T_4 : std_logic;
  signal T_5 : std_logic;
  signal GATE_T_2_A : std_logic;
  signal GATE_T_2_B : std_logic;
  signal GATE_T_3_A : std_logic;
  signal GATE_T_4_A : std_logic;
  signal GATE_T_4_B : std_logic;
  signal GATE_T_5_A : std_logic;

begin
  IN_a1_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>a1PIN, 
            I0=>a1 );
  IN_b1_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>b1PIN, 
            I0=>b1 );
  IN_a2_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>a2PIN, 
            I0=>a2 );
  IN_b2_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>b2PIN, 
            I0=>b2 );
  IN_gn_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>gnPIN, 
            I0=>gn );
  IN_an_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>anPIN, 
            I0=>an );
  OUT_y1_I_1:   OBUF port map ( O=>y1, 
            I0=>y1COM );
  OUT_y2_I_1:   OBUF port map ( O=>y2, 
            I0=>y2COM );
  GATE_T_0_I_1:   OR2 port map ( O=>T_0, 
            I1=>T_5, 
            I0=>T_4 );
  GATE_T_1_I_1:   OR2 port map ( O=>T_1, 
            I1=>T_3, 
            I0=>T_2 );
  GATE_y1_I_1:   INV port map ( I0=>T_0, 
            O=>y1COM );
  GATE_y2_I_1:   INV port map ( I0=>T_1, 
            O=>y2COM );
  GATE_T_2_I_1:   INV port map ( I0=>anPIN, 
            O=>GATE_T_2_A );
  GATE_T_2_I_2:   INV port map ( I0=>gnPIN, 
            O=>GATE_T_2_B );
  GATE_T_2_I_3:   AND3 port map ( O=>T_2, 
            I0=>a2PIN, 
            I2=>GATE_T_2_A, 
            I1=>GATE_T_2_B );
  GATE_T_3_I_1:   INV port map ( I0=>gnPIN, 
            O=>GATE_T_3_A );
  GATE_T_3_I_2:   AND3 port map ( O=>T_3, 
            I2=>b2PIN, 
            I1=>anPIN, 
            I0=>GATE_T_3_A );
  GATE_T_4_I_1:   INV port map ( I0=>anPIN, 
            O=>GATE_T_4_A );
  GATE_T_4_I_2:   INV port map ( I0=>gnPIN, 
            O=>GATE_T_4_B );
  GATE_T_4_I_3:   AND3 port map ( O=>T_4, 
            I0=>a1PIN, 
            I2=>GATE_T_4_A, 
            I1=>GATE_T_4_B );
  GATE_T_5_I_1:   INV port map ( I0=>gnPIN, 
            O=>GATE_T_5_A );
  GATE_T_5_I_2:   AND3 port map ( O=>T_5, 
            I2=>b1PIN, 
            I1=>anPIN, 
            I0=>GATE_T_5_A );

end NetList;
