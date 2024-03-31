
########## Tcl recorder starts at 02/14/24 09:53:08 ##########

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
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"./lab3_synthesize/rev_3/proj_1.edf\" -jhd \"proj_1.jhd\" -err automake.err -log \"proj_1.log\" -prj converter_xs3_to_bcd -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@proj_1.esp\" -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/14/24 09:53:08 ###########


########## Tcl recorder starts at 02/14/24 09:54:02 ##########

# Commands to make the Process: 
# VHDL Post-Route Simulation Model
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"./lab3_synthesize/rev_3/proj_1.edf\" -out \"converter_xs3_bcd.bl0\" -err automake.err -log \"proj_1.log\" -prj converter_xs3_to_bcd -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@proj_1.esp\" -nbx -cvt YES"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" converter_xs3_bcd.bl0 -o converter_xs3_bcd.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj converter_xs3_to_bcd -err automake.err"] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"converter_xs3_bcd.bl1\" -o \"converter_xs3_to_bcd.bl2\" -omod converter_xs3_bcd -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" converter_xs3_to_bcd.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" converter_xs3_to_bcd.bl3 -pla -o converter_xs3_to_bcd.tt2 -dev p22v10gc -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" converter_xs3_to_bcd.tt2 -dev p22v10gc -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" converter_xs3_to_bcd.tt3 -dev p22v10gc -o converter_xs3_to_bcd.jed -ivec NoInput.tmv -rep converter_xs3_to_bcd.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open converter_xs3_to_bcd.psl w} rspFile] {
	puts stderr "Cannot create response file converter_xs3_to_bcd.psl: $rspFile"
} else {
	puts $rspFile "-dev p22v10gc -part LAT ispGAL22V10C-10LJ GAL -o converter_xs3_to_bcd.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @converter_xs3_to_bcd.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete converter_xs3_to_bcd.psl
if [catch {open converter_xs3_to_bcd._sp w} rspFile] {
	puts stderr "Cannot create response file converter_xs3_to_bcd._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route VHDL Simulation Models
#insert --
#unixpath $proj_dir
#vcom converter_xs3_to_bcd.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"converter_xs3_to_bcd._sp\" \"converter_xs3_to_bcd.vtd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete converter_xs3_to_bcd._sp
if [catch {open converter_xs3_to_bcd._sp w} rspFile] {
	puts stderr "Cannot create response file converter_xs3_to_bcd._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route VHDL Simulation Models
#insert #
#unixpath $proj_dir
#vcom converter_xs3_to_bcd.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"converter_xs3_to_bcd._sp\" \"converter_xs3_to_bcd.vatd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete converter_xs3_to_bcd._sp
if [runCmd "\"$cpld_bin/j2svhdl\" converter_xs3_to_bcd.jed -dly custom converter_xs3_to_bcd.tim max -pldbus default converter_xs3_bcd.btp -o converter_xs3_to_bcd.vhq -module converter_xs3_bcd -suppress -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/14/24 09:54:02 ###########

