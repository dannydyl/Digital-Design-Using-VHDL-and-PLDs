library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity dff_en_tb is
end dff_en_tb;

architecture TB_ARCHITECTURE of dff_en_tb is
	-- Component declaration of the tested unit
	component dff_en
	port(
		d : in STD_LOGIC;
		clk : in STD_LOGIC;
		en : in STD_LOGIC;
		rst_bar : in STD_LOGIC;
		q : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal d : STD_LOGIC;
	signal clk : STD_LOGIC;
	signal en : STD_LOGIC;
	signal rst_bar : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal q : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : dff_en
		port map (
			d => d,
			clk => clk,
			en => en,
			rst_bar => rst_bar,
			q => q
		);

	--Below VHDL code is an inserted .\compile\dff_en_waveform.vhs
	--User can modify it ....

STIMULUS: process
begin  -- of stimulus process
--wait for <time to next event>; -- <current time>

	d <= '0';
	clk <= 'U';
	en <= '0';
	rst_bar <= '1';
    wait for 10 ns; --0 fs
	d <= '1';
    wait for 10 ns; --10 ns
	d <= '0';
	clk <= '0';
    wait for 10 ns; --20 ns
	d <= '1';
    wait for 10 ns; --30 ns
	d <= '0';
    wait for 10 ns; --40 ns
	d <= '1';
    wait for 10 ns; --50 ns
	d <= '0';
    wait for 2700 ps; --60 ns
	clk <= '1';
    wait for 7300 ps; --62700 ps
	d <= '1';
    wait for 10 ns; --70 ns
	d <= '0';
    wait for 10 ns; --80 ns
	d <= '1';
    wait for 10 ns; --90 ns
	d <= '0';
    wait for 10 ns; --100 ns
	d <= '1';
    wait for 10 ns; --110 ns
	d <= '0';
    wait for 10 ns; --120 ns
	d <= '1';
    wait for 10 ns; --130 ns
	d <= '0';
    wait for 2 ns; --140 ns
	clk <= '0';
    wait for 8 ns; --142 ns
	d <= '1';
    wait for 10 ns; --150 ns
	d <= '0';
    wait for 10 ns; --160 ns
	d <= '1';
    wait for 10 ns; --170 ns
	d <= '0';
    wait for 4700 ps; --180 ns
	clk <= '1';
    wait for 5300 ps; --184700 ps
	d <= '1';
    wait for 10 ns; --190 ns
	d <= '0';
	en <= '1';
    wait for 10 ns; --200 ns
	d <= '1';
    wait for 10 ns; --210 ns
	d <= '0';
    wait for 10 ns; --220 ns
	d <= '1';
    wait for 10 ns; --230 ns
	d <= '0';
    wait for 10 ns; --240 ns
	d <= '1';
    wait for 10 ns; --250 ns
	d <= '0';
    wait for 4 ns; --260 ns
	clk <= '0';
    wait for 6 ns; --264 ns
	d <= '1';
    wait for 10 ns; --270 ns
	d <= '0';
    wait for 10 ns; --280 ns
	d <= '1';
    wait for 10 ns; --290 ns
	d <= '0';
    wait for 6700 ps; --300 ns
	clk <= '1';
    wait for 3300 ps; --306700 ps
	d <= '1';
    wait for 10 ns; --310 ns
	d <= '0';
    wait for 10 ns; --320 ns
	d <= '1';
    wait for 10 ns; --330 ns
	d <= '0';
    wait for 10 ns; --340 ns
	d <= '1';
    wait for 10 ns; --350 ns
	d <= '0';
    wait for 10 ns; --360 ns
	d <= '1';
    wait for 10 ns; --370 ns
	d <= '0';
    wait for 6 ns; --380 ns
	clk <= '0';
    wait for 4 ns; --386 ns
	d <= '1';
    wait for 10 ns; --390 ns
	d <= '0';
    wait for 10 ns; --400 ns
	d <= '1';
    wait for 10 ns; --410 ns
	d <= '0';
    wait for 8700 ps; --420 ns
	clk <= '1';
    wait for 1300 ps; --428700 ps
	d <= '1';
    wait for 10 ns; --430 ns
	d <= '0';
    wait for 10 ns; --440 ns
	d <= '1';
    wait for 10 ns; --450 ns
	d <= '0';
    wait for 10 ns; --460 ns
	d <= '1';
    wait for 10 ns; --470 ns
	d <= '0';
    wait for 10 ns; --480 ns
	d <= '1';
    wait for 10 ns; --490 ns
	d <= '0';
    wait for 8 ns; --500 ns
	clk <= '0';
    wait for 2 ns; --508 ns
	d <= '1';
    wait for 10 ns; --510 ns
	d <= '0';
    wait for 10 ns; --520 ns
	d <= '1';
    wait for 10 ns; --530 ns
	d <= '0';
    wait for 10 ns; --540 ns
	d <= '1';
    wait for 700 ps; --550 ns
	clk <= '1';
    wait for 9300 ps; --550700 ps
	d <= '0';
    wait for 10 ns; --560 ns
	d <= '1';
    wait for 10 ns; --570 ns
	d <= '0';
    wait for 10 ns; --580 ns
	d <= '1';
    wait for 10 ns; --590 ns
	d <= '0';
    wait for 10 ns; --600 ns
	d <= '1';
    wait for 10 ns; --610 ns
	d <= '0';
    wait for 10 ns; --620 ns
	d <= '1';
	clk <= '0';
    wait for 10 ns; --630 ns
	d <= '0';
    wait for 10 ns; --640 ns
	d <= '1';
    wait for 10 ns; --650 ns
	d <= '0';
    wait for 10 ns; --660 ns
	d <= '1';
    wait for 2700 ps; --670 ns
	clk <= '1';
    wait for 7300 ps; --672700 ps
	d <= '0';
    wait for 10 ns; --680 ns
	d <= '1';
    wait for 10 ns; --690 ns
	d <= '0';
    wait for 10 ns; --700 ns
	d <= '1';
    wait for 10 ns; --710 ns
	d <= '0';
    wait for 10 ns; --720 ns
	d <= '1';
    wait for 10 ns; --730 ns
	d <= '0';
    wait for 10 ns; --740 ns
	d <= '1';
    wait for 2 ns; --750 ns
	clk <= '0';
    wait for 8 ns; --752 ns
	d <= '0';
    wait for 10 ns; --760 ns
	d <= '1';
    wait for 10 ns; --770 ns
	d <= '0';
    wait for 10 ns; --780 ns
	d <= '1';
    wait for 4700 ps; --790 ns
	clk <= '1';
    wait for 5300 ps; --794700 ps
	d <= '0';
    wait for 10 ns; --800 ns
	d <= '1';
    wait for 10 ns; --810 ns
	d <= '0';
    wait for 10 ns; --820 ns
	d <= '1';
    wait for 10 ns; --830 ns
	d <= '0';
    wait for 10 ns; --840 ns
	d <= '1';
    wait for 10 ns; --850 ns
	d <= '0';
    wait for 10 ns; --860 ns
	d <= '1';
    wait for 4 ns; --870 ns
	clk <= '0';
    wait for 6 ns; --874 ns
	d <= '0';
    wait for 10 ns; --880 ns
	d <= '1';
    wait for 10 ns; --890 ns
	d <= '0';
    wait for 10 ns; --900 ns
	d <= '1';
    wait for 6700 ps; --910 ns
	clk <= '1';
    wait for 3300 ps; --916700 ps
	d <= '0';
    wait for 10 ns; --920 ns
	d <= '1';
    wait for 10 ns; --930 ns
	d <= '0';
    wait for 10 ns; --940 ns
	d <= '1';
    wait for 10 ns; --950 ns
	d <= '0';
    wait for 10 ns; --960 ns
	d <= '1';
    wait for 10 ns; --970 ns
	d <= '0';
    wait for 10 ns; --980 ns
	d <= '1';
    wait for 6 ns; --990 ns
	clk <= '0';
    wait for 4 ns; --996 ns
	d <= '0';
	en <= '0';
    wait for 10 ns; --1 us
	d <= '1';
    wait for 10 ns; --1010 ns
	d <= '0';
    wait for 10 ns; --1020 ns
	d <= '1';
    wait for 8700 ps; --1030 ns
	clk <= '1';
    wait for 1300 ps; --1038700 ps
	d <= '0';
    wait for 10 ns; --1040 ns
	d <= '1';
    wait for 10 ns; --1050 ns
	d <= '0';
    wait for 10 ns; --1060 ns
	d <= '1';
    wait for 10 ns; --1070 ns
	d <= '0';
    wait for 10 ns; --1080 ns
	d <= '1';
    wait for 10 ns; --1090 ns
	d <= '0';
    wait for 10 ns; --1100 ns
	d <= '1';
    wait for 8 ns; --1110 ns
	clk <= '0';
    wait for 2 ns; --1118 ns
	d <= '0';
    wait for 10 ns; --1120 ns
	d <= '1';
    wait for 10 ns; --1130 ns
	d <= '0';
    wait for 10 ns; --1140 ns
	d <= '1';
    wait for 10 ns; --1150 ns
	d <= '0';
    wait for 700 ps; --1160 ns
	clk <= '1';
    wait for 9300 ps; --1160700 ps
	d <= '1';
    wait for 10 ns; --1170 ns
	d <= '0';
    wait for 10 ns; --1180 ns
	d <= '1';
    wait for 10 ns; --1190 ns
	d <= '0';
	en <= '1';
    wait for 10 ns; --1200 ns
	d <= '1';
    wait for 10 ns; --1210 ns
	d <= '0';
    wait for 10 ns; --1220 ns
	d <= '1';
    wait for 10 ns; --1230 ns
	d <= '0';
	clk <= '0';
    wait for 10 ns; --1240 ns
	d <= '1';
    wait for 10 ns; --1250 ns
	d <= '0';
    wait for 10 ns; --1260 ns
	d <= '1';
    wait for 10 ns; --1270 ns
	d <= '0';
    wait for 2700 ps; --1280 ns
	clk <= '1';
    wait for 7300 ps; --1282700 ps
	d <= '1';
    wait for 10 ns; --1290 ns
	d <= '0';
    wait for 10 ns; --1300 ns
	d <= '1';
    wait for 10 ns; --1310 ns
	d <= '0';
    wait for 10 ns; --1320 ns
	d <= '1';
    wait for 10 ns; --1330 ns
	d <= '0';
    wait for 10 ns; --1340 ns
	d <= '1';
    wait for 10 ns; --1350 ns
	d <= '0';
    wait for 2 ns; --1360 ns
	clk <= '0';
    wait for 8 ns; --1362 ns
	d <= '1';
    wait for 10 ns; --1370 ns
	d <= '0';
    wait for 10 ns; --1380 ns
	d <= '1';
    wait for 10 ns; --1390 ns
	d <= '0';
    wait for 4700 ps; --1400 ns
	clk <= '1';
    wait for 5300 ps; --1404700 ps
	d <= '1';
    wait for 10 ns; --1410 ns
	d <= '0';
    wait for 10 ns; --1420 ns
	d <= '1';
    wait for 10 ns; --1430 ns
	d <= '0';
    wait for 10 ns; --1440 ns
	d <= '1';
    wait for 10 ns; --1450 ns
	d <= '0';
    wait for 10 ns; --1460 ns
	d <= '1';
    wait for 10 ns; --1470 ns
	d <= '0';
    wait for 4 ns; --1480 ns
	clk <= '0';
    wait for 6 ns; --1484 ns
	d <= '1';
    wait for 10 ns; --1490 ns
	d <= '0';
    wait for 10 ns; --1500 ns
	d <= '1';
    wait for 10 ns; --1510 ns
	d <= '0';
    wait for 6700 ps; --1520 ns
	clk <= '1';
    wait for 3300 ps; --1526700 ps
	d <= '1';
    wait for 10 ns; --1530 ns
	d <= '0';
    wait for 10 ns; --1540 ns
	d <= '1';
    wait for 10 ns; --1550 ns
	d <= '0';
    wait for 10 ns; --1560 ns
	d <= '1';
    wait for 10 ns; --1570 ns
	d <= '0';
    wait for 10 ns; --1580 ns
	d <= '1';
    wait for 10 ns; --1590 ns
	d <= '0';
	rst_bar <= '0';
    wait for 6 ns; --1600 ns
	clk <= '0';
    wait for 4 ns; --1606 ns
	d <= '1';
    wait for 10 ns; --1610 ns
	d <= '0';
    wait for 10 ns; --1620 ns
	d <= '1';
    wait for 10 ns; --1630 ns
	d <= '0';
    wait for 8700 ps; --1640 ns
	clk <= '1';
    wait for 1300 ps; --1648700 ps
	d <= '1';
    wait for 10 ns; --1650 ns
	d <= '0';
    wait for 10 ns; --1660 ns
	d <= '1';
    wait for 10 ns; --1670 ns
	d <= '0';
    wait for 10 ns; --1680 ns
	d <= '1';
    wait for 10 ns; --1690 ns
	d <= '0';
    wait for 10 ns; --1700 ns
	d <= '1';
    wait for 10 ns; --1710 ns
	d <= '0';
    wait for 8 ns; --1720 ns
	clk <= '0';
    wait for 2 ns; --1728 ns
	d <= '1';
    wait for 10 ns; --1730 ns
	d <= '0';
    wait for 10 ns; --1740 ns
	d <= '1';
    wait for 10 ns; --1750 ns
	d <= '0';
    wait for 10 ns; --1760 ns
	d <= '1';
    wait for 700 ps; --1770 ns
	clk <= '1';
    wait for 9300 ps; --1770700 ps
	d <= '0';
    wait for 10 ns; --1780 ns
	d <= '1';
    wait for 10 ns; --1790 ns
	d <= '0';
    wait for 10 ns; --1800 ns
	d <= '1';
    wait for 10 ns; --1810 ns
	d <= '0';
    wait for 10 ns; --1820 ns
	d <= '1';
    wait for 10 ns; --1830 ns
	d <= '0';
    wait for 10 ns; --1840 ns
	d <= '1';
	clk <= '0';
    wait for 10 ns; --1850 ns
	d <= '0';
    wait for 10 ns; --1860 ns
	d <= '1';
    wait for 10 ns; --1870 ns
	d <= '0';
    wait for 10 ns; --1880 ns
	d <= '1';
    wait for 2700 ps; --1890 ns
	clk <= '1';
    wait for 7300 ps; --1892700 ps
	d <= '0';
    wait for 10 ns; --1900 ns
	d <= '1';
    wait for 10 ns; --1910 ns
	d <= '0';
    wait for 10 ns; --1920 ns
	d <= '1';
    wait for 10 ns; --1930 ns
	d <= '0';
    wait for 10 ns; --1940 ns
	d <= '1';
    wait for 10 ns; --1950 ns
	d <= '0';
    wait for 10 ns; --1960 ns
	d <= '1';
    wait for 2 ns; --1970 ns
	clk <= '0';
    wait for 8 ns; --1972 ns
	d <= '0';
    wait for 10 ns; --1980 ns
	d <= '1';
    wait for 10 ns; --1990 ns
	d <= '0';
	en <= '0';
	rst_bar <= '1';
--	end of stimulus events
	wait;
end process; -- end of stimulus process
	



	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dff_en of dff_en_tb is
	for TB_ARCHITECTURE
		for UUT : dff_en
			use entity work.dff_en(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_dff_en;

