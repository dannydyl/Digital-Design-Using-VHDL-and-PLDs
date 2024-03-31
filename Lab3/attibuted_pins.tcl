
########## Tcl recorder starts at 02/14/24 10:29:46 ##########

set version "2.1"
set proj_dir "F:/ESE382-Lab/Lab3"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"./rev_4/xs3_to_bcd_port_pins.edf\" -jhd \"xs3_to_bcd_port_pins.jhd\" -err automake.err -log \"xs3_to_bcd_port_pins.log\" -prj attibuted_pins -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@xs3_to_bcd_port_pins.esp\" -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/14/24 10:29:46 ###########


########## Tcl recorder starts at 02/14/24 10:29:49 ##########

# Commands to make the Process: 
# VHDL Post-Route Simulation Model
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"./rev_4/xs3_to_bcd_port_pins.edf\" -out \"converter_xs3_bcd.bl0\" -err automake.err -log \"xs3_to_bcd_port_pins.log\" -prj attibuted_pins -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@xs3_to_bcd_port_pins.esp\" -nbx -cvt YES"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" converter_xs3_bcd.bl0 -o converter_xs3_bcd.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj attibuted_pins -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"converter_xs3_bcd.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"converter_xs3_bcd.bl1\" -o \"attibuted_pins.bl2\" -omod converter_xs3_bcd -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" attibuted_pins.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" attibuted_pins.bl3 -pla -o attibuted_pins.tt2 -dev p22v10gc -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" attibuted_pins.tt2 -dev p22v10gc -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" attibuted_pins.tt3 -dev p22v10gc -o attibuted_pins.jed -ivec NoInput.tmv -rep attibuted_pins.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open attibuted_pins.psl w} rspFile] {
	puts stderr "Cannot create response file attibuted_pins.psl: $rspFile"
} else {
	puts $rspFile "-dev p22v10gc -part LAT ispGAL22V10C-10LJ GAL -o attibuted_pins.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @attibuted_pins.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete attibuted_pins.psl
if [catch {open attibuted_pins._sp w} rspFile] {
	puts stderr "Cannot create response file attibuted_pins._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route VHDL Simulation Models
#insert --
#unixpath $proj_dir
#vcom attibuted_pins.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"attibuted_pins._sp\" \"attibuted_pins.vtd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete attibuted_pins._sp
if [catch {open attibuted_pins._sp w} rspFile] {
	puts stderr "Cannot create response file attibuted_pins._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route VHDL Simulation Models
#insert #
#unixpath $proj_dir
#vcom attibuted_pins.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"attibuted_pins._sp\" \"attibuted_pins.vatd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete attibuted_pins._sp
if [runCmd "\"$cpld_bin/j2svhdl\" attibuted_pins.jed -dly custom attibuted_pins.tim max -pldbus default converter_xs3_bcd.btp -o attibuted_pins.vhq -module converter_xs3_bcd -suppress -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/14/24 10:29:49 ###########

