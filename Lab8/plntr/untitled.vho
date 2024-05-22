-- VHDL netlist-file
library mach;
use mach.components.all;

library ieee;
use ieee.std_logic_1164.all;
entity latched_3to8_decoder is
  port (
    a : in std_logic_vector(2 downto 0);
    y : out std_logic_vector(0 to 7);
    le_bar : in std_logic;
    e1_bar : in std_logic;
    e2 : in std_logic
  );
end latched_3to8_decoder;

architecture NetList of latched_3to8_decoder is

  signal a_2XPIN : std_logic;
  signal y_0XCOM : std_logic;
  signal le_barPIN : std_logic;
  signal e1_barPIN : std_logic;
  signal e2PIN : std_logic;
  signal a_1XPIN : std_logic;
  signal a_0XPIN : std_logic;
  signal y_1XCOM : std_logic;
  signal y_2XCOM : std_logic;
  signal y_3XCOM : std_logic;
  signal y_4XCOM : std_logic;
  signal y_5XCOM : std_logic;
  signal y_6XCOM : std_logic;
  signal y_7XCOM : std_logic;
  signal u0_a_lat_0_busQ : std_logic;
  signal u0_a_lat_1_busQ : std_logic;
  signal u0_a_lat_2_busQ : std_logic;
  signal u0_a_lat_0_bus_LH : std_logic;
  signal u0_a_lat_1_bus_LH : std_logic;
  signal u0_a_lat_2_bus_LH : std_logic;
  signal T_0 : std_logic;
  signal T_1 : std_logic;
  signal T_2 : std_logic;
  signal T_3 : std_logic;
  signal T_4 : std_logic;
  signal T_5 : std_logic;
  signal T_6 : std_logic;
  signal T_7 : std_logic;
  signal T_8 : std_logic;
  signal T_9 : std_logic;
  signal T_10 : std_logic;
  signal T_11 : std_logic;
  signal T_12 : std_logic;
  signal T_13 : std_logic;
  signal T_14 : std_logic;
  signal T_15 : std_logic;
  signal GATE_y_0_XA : std_logic;
  signal GATE_y_1_XA : std_logic;
  signal GATE_y_2_XA : std_logic;
  signal GATE_y_3_XA : std_logic;
  signal GATE_T_1_A : std_logic;
  signal GATE_T_2_A : std_logic;
  signal GATE_T_3_A : std_logic;
  signal GATE_T_4_A : std_logic;
  signal GATE_T_5_A : std_logic;
  signal GATE_T_7_A : std_logic;
  signal GATE_T_9_A : std_logic;
  signal GATE_T_10_A : std_logic;
  signal GATE_T_11_A : std_logic;
  signal GATE_T_12_A : std_logic;
  signal GATE_T_13_A : std_logic;
  signal GATE_T_15_A : std_logic;

begin
  IN_a_2_XI_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>a_2XPIN, 
            I0=>a(2) );
  OUT_y_0_XI_1:   OBUF port map ( O=>y(0), 
            I0=>y_0XCOM );
  IN_le_bar_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>le_barPIN, 
            I0=>le_bar );
  IN_e1_bar_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>e1_barPIN, 
            I0=>e1_bar );
  IN_e2_I_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>e2PIN, 
            I0=>e2 );
  IN_a_1_XI_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>a_1XPIN, 
            I0=>a(1) );
  IN_a_0_XI_1:   IBUF
 generic map( PULL => "Hold")
 port map ( O=>a_0XPIN, 
            I0=>a(0) );
  OUT_y_1_XI_1:   OBUF port map ( O=>y(1), 
            I0=>y_1XCOM );
  OUT_y_2_XI_1:   OBUF port map ( O=>y(2), 
            I0=>y_2XCOM );
  OUT_y_3_XI_1:   OBUF port map ( O=>y(3), 
            I0=>y_3XCOM );
  OUT_y_4_XI_1:   OBUF port map ( O=>y(4), 
            I0=>y_4XCOM );
  OUT_y_5_XI_1:   OBUF port map ( O=>y(5), 
            I0=>y_5XCOM );
  OUT_y_6_XI_1:   OBUF port map ( O=>y(6), 
            I0=>y_6XCOM );
  OUT_y_7_XI_1:   OBUF port map ( O=>y(7), 
            I0=>y_7XCOM );
  LATCH_u0_a_lat_0_bus_I_1:   DLAT port map ( Q=>u0_a_lat_0_busQ, 
            LAT=>u0_a_lat_0_bus_LH, 
            D=>a_0XPIN );
  LATCH_u0_a_lat_1_bus_I_1:   DLAT port map ( Q=>u0_a_lat_1_busQ, 
            LAT=>u0_a_lat_1_bus_LH, 
            D=>a_1XPIN );
  LATCH_u0_a_lat_2_bus_I_1:   DLAT port map ( Q=>u0_a_lat_2_busQ, 
            LAT=>u0_a_lat_2_bus_LH, 
            D=>a_2XPIN );
  GATE_y_0_XI_1:   INV port map ( I0=>u0_a_lat_2_busQ, 
            O=>GATE_y_0_XA );
  GATE_y_0_XI_2:   AND3 port map ( O=>y_0XCOM, 
            I2=>T_15, 
            I1=>T_14, 
            I0=>GATE_y_0_XA );
  GATE_y_1_XI_1:   INV port map ( I0=>u0_a_lat_2_busQ, 
            O=>GATE_y_1_XA );
  GATE_y_1_XI_2:   AND3 port map ( O=>y_1XCOM, 
            I2=>T_13, 
            I1=>T_12, 
            I0=>GATE_y_1_XA );
  GATE_y_2_XI_1:   INV port map ( I0=>u0_a_lat_2_busQ, 
            O=>GATE_y_2_XA );
  GATE_y_2_XI_2:   AND3 port map ( O=>y_2XCOM, 
            I2=>T_11, 
            I1=>T_10, 
            I0=>GATE_y_2_XA );
  GATE_y_3_XI_1:   INV port map ( I0=>u0_a_lat_2_busQ, 
            O=>GATE_y_3_XA );
  GATE_y_3_XI_2:   AND3 port map ( O=>y_3XCOM, 
            I2=>T_9, 
            I1=>T_8, 
            I0=>GATE_y_3_XA );
  GATE_y_4_XI_1:   AND3 port map ( O=>y_4XCOM, 
            I2=>T_7, 
            I1=>u0_a_lat_2_busQ, 
            I0=>T_6 );
  GATE_y_5_XI_1:   AND3 port map ( O=>y_5XCOM, 
            I2=>T_5, 
            I1=>u0_a_lat_2_busQ, 
            I0=>T_4 );
  GATE_y_6_XI_1:   AND3 port map ( O=>y_6XCOM, 
            I2=>T_3, 
            I1=>u0_a_lat_2_busQ, 
            I0=>T_2 );
  GATE_y_7_XI_1:   AND3 port map ( O=>y_7XCOM, 
            I2=>T_1, 
            I1=>u0_a_lat_2_busQ, 
            I0=>T_0 );
  GATE_u0_a_lat_0_bus_LH_I_1:   INV port map ( I0=>le_barPIN, 
            O=>u0_a_lat_0_bus_LH );
  GATE_u0_a_lat_1_bus_LH_I_1:   INV port map ( I0=>le_barPIN, 
            O=>u0_a_lat_1_bus_LH );
  GATE_u0_a_lat_2_bus_LH_I_1:   INV port map ( I0=>le_barPIN, 
            O=>u0_a_lat_2_bus_LH );
  GATE_T_0_I_1:   AND2 port map ( O=>T_0, 
            I1=>u0_a_lat_1_busQ, 
            I0=>u0_a_lat_0_busQ );
  GATE_T_1_I_1:   AND2 port map ( O=>T_1, 
            I1=>e2PIN, 
            I0=>GATE_T_1_A );
  GATE_T_1_I_2:   INV port map ( O=>GATE_T_1_A, 
            I0=>e1_barPIN );
  GATE_T_2_I_1:   AND2 port map ( O=>T_2, 
            I1=>u0_a_lat_1_busQ, 
            I0=>GATE_T_2_A );
  GATE_T_2_I_2:   INV port map ( O=>GATE_T_2_A, 
            I0=>u0_a_lat_0_busQ );
  GATE_T_3_I_1:   AND2 port map ( O=>T_3, 
            I1=>e2PIN, 
            I0=>GATE_T_3_A );
  GATE_T_3_I_2:   INV port map ( O=>GATE_T_3_A, 
            I0=>e1_barPIN );
  GATE_T_4_I_1:   AND2 port map ( O=>T_4, 
            I1=>u0_a_lat_0_busQ, 
            I0=>GATE_T_4_A );
  GATE_T_4_I_2:   INV port map ( O=>GATE_T_4_A, 
            I0=>u0_a_lat_1_busQ );
  GATE_T_5_I_1:   AND2 port map ( O=>T_5, 
            I1=>e2PIN, 
            I0=>GATE_T_5_A );
  GATE_T_5_I_2:   INV port map ( O=>GATE_T_5_A, 
            I0=>e1_barPIN );
  GATE_T_6_I_1:   NOR2 port map ( O=>T_6, 
            I1=>u0_a_lat_1_busQ, 
            I0=>u0_a_lat_0_busQ );
  GATE_T_7_I_1:   AND2 port map ( O=>T_7, 
            I1=>e2PIN, 
            I0=>GATE_T_7_A );
  GATE_T_7_I_2:   INV port map ( O=>GATE_T_7_A, 
            I0=>e1_barPIN );
  GATE_T_8_I_1:   AND2 port map ( O=>T_8, 
            I1=>u0_a_lat_1_busQ, 
            I0=>u0_a_lat_0_busQ );
  GATE_T_9_I_1:   AND2 port map ( O=>T_9, 
            I1=>e2PIN, 
            I0=>GATE_T_9_A );
  GATE_T_9_I_2:   INV port map ( O=>GATE_T_9_A, 
            I0=>e1_barPIN );
  GATE_T_10_I_1:   AND2 port map ( O=>T_10, 
            I1=>u0_a_lat_1_busQ, 
            I0=>GATE_T_10_A );
  GATE_T_10_I_2:   INV port map ( O=>GATE_T_10_A, 
            I0=>u0_a_lat_0_busQ );
  GATE_T_11_I_1:   AND2 port map ( O=>T_11, 
            I1=>e2PIN, 
            I0=>GATE_T_11_A );
  GATE_T_11_I_2:   INV port map ( O=>GATE_T_11_A, 
            I0=>e1_barPIN );
  GATE_T_12_I_1:   AND2 port map ( O=>T_12, 
            I1=>u0_a_lat_0_busQ, 
            I0=>GATE_T_12_A );
  GATE_T_12_I_2:   INV port map ( O=>GATE_T_12_A, 
            I0=>u0_a_lat_1_busQ );
  GATE_T_13_I_1:   AND2 port map ( O=>T_13, 
            I1=>e2PIN, 
            I0=>GATE_T_13_A );
  GATE_T_13_I_2:   INV port map ( O=>GATE_T_13_A, 
            I0=>e1_barPIN );
  GATE_T_14_I_1:   NOR2 port map ( O=>T_14, 
            I1=>u0_a_lat_1_busQ, 
            I0=>u0_a_lat_0_busQ );
  GATE_T_15_I_1:   AND2 port map ( O=>T_15, 
            I1=>e2PIN, 
            I0=>GATE_T_15_A );
  GATE_T_15_I_2:   INV port map ( O=>GATE_T_15_A, 
            I0=>e1_barPIN );

end NetList;
