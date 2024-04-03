
########## Tcl recorder starts at 03/06/24 10:03:42 ##########

set version "2.1"
set proj_dir "F:/ESE382-Lab/Lab6/P_R"
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
if [runCmd "\"$cpld_bin/edif2blf\" -edf ../data_selector_synthesize/rev_8/proj_1.edf -jhd proj_1.jhd -err automake.err -log proj_1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" @proj_1.esp -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/06/24 10:03:43 ###########


########## Tcl recorder starts at 03/06/24 10:18:46 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/edif2blf\" -edf ../data_selector_synthesize/rev_8/proj_1.edf -out data_selector.bl0 -err automake.err -log proj_1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" @proj_1.esp -nbx -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" data_selector.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"data_selector.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod data_selector  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/06/24 10:18:46 ###########


########## Tcl recorder starts at 03/06/24 10:20:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/edif2blf\" -edf ../data_selector_synthesize/rev_8/proj_1.edf -jhd proj_1.jhd -err automake.err -log proj_1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" @proj_1.esp -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/06/24 10:20:11 ###########


########## Tcl recorder starts at 03/06/24 10:20:12 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/edif2blf\" -edf ../data_selector_synthesize/rev_8/proj_1.edf -out data_selector.bl0 -err automake.err -log proj_1.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" @proj_1.esp -nbx -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" data_selector.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"data_selector.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod data_selector  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/06/24 10:20:12 ###########


########## Tcl recorder starts at 03/06/24 10:25:32 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rss w} rspFile] {
	puts stderr "Cannot create response file untitled.rss: $rspFile"
} else {
	puts $rspFile "-i \"untitled.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"untitled.tte\" -lci \"untitled.lct\" -prj \"untitled\" -dir \"$proj_dir\" -err automake.err -log \"untitled.nrp\" -exf \"data_selector.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@untitled.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rss

########## Tcl recorder end at 03/06/24 10:25:32 ###########


########## Tcl recorder starts at 03/06/24 10:25:44 ##########

# Commands to make the Process: 
# Fitter Report
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/06/24 10:25:44 ###########


########## Tcl recorder starts at 03/06/24 10:30:58 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/edif2blf\" -edf ../rev_8/synthesize.edf -jhd synthesize.jhd -err automake.err -log synthesize.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" @synthesize.esp -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/06/24 10:30:58 ###########


########## Tcl recorder starts at 03/06/24 10:31:01 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/edif2blf\" -edf ../rev_8/synthesize.edf -out data_selector.bl0 -err automake.err -log synthesize.log -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" @synthesize.esp -nbx -cvt YES -xor"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" data_selector.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"data_selector.bl1\" -o \"untitled.bl2\" -omod \"untitled\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj untitled -lci untitled.lct -log untitled.imp -err automake.err -tti untitled.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -blifopt  untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" untitled.bl2 -sweep -mergefb -err automake.err -o untitled.bl3  @untitled.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -diofft  untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" untitled.bl3 -pla -family AMDMACH -idev van -o untitled.tt2 -oxrf untitled.xrf -err automake.err  @untitled.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj untitled -dir $proj_dir -log untitled.log -tti untitled.tt2 -tto untitled.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci untitled.lct -dev mach4a -prefit  untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp untitled.tt3 -out untitled.tt4 -err automake.err -log untitled.log -percent untitled.tte -mod data_selector  @untitled.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" untitled.tte -o untitled.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci untitled.lct -out untitled.vct -log untitled.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rsp w} rspFile] {
	puts stderr "Cannot create response file untitled.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"untitled.tt4\" -vci \"untitled.vct\" -log \"untitled.log\" -eqn \"untitled.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@untitled.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/06/24 10:31:01 ###########


########## Tcl recorder starts at 03/06/24 10:31:51 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [runCmd "\"$cpld_bin/lci2vci\" -vci untitled.vco -out untitled.lco -log untitled.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.rss w} rspFile] {
	puts stderr "Cannot create response file untitled.rss: $rspFile"
} else {
	puts $rspFile "-i \"untitled.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"untitled.tte\" -lci \"untitled.lct\" -prj \"untitled\" -dir \"$proj_dir\" -err automake.err -log \"untitled.nrp\" -exf \"data_selector.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@untitled.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.rss

########## Tcl recorder end at 03/06/24 10:31:51 ###########


########## Tcl recorder starts at 03/06/24 10:38:23 ##########

# Commands to make the Process: 
# Fitter Report
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj untitled -if untitled.jed -j2s -log untitled.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 03/06/24 10:38:23 ###########

