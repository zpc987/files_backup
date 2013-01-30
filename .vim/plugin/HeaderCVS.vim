"
" Name: HeaderCVS, VIM plugin for Linux
" Author: AyuanX ( ayuanx#163!com )
" Version: 1.0
"
" Description:
"
" This plugin adds CVS Header before current cursor.
"
" The CVS Header will automatically reflect current file name, current date and
" your description beside a standard CVS Header.
"
" (Note: This plugin is only tested on Linux.)
"
" HowToUse:
"
" 1. Please edit HeaderCVS.vim, customizing the following variables.
"	let s:company = "MyCompany"
"	let s:creator = "AyuanX ( ayuanx#163!com )"
"
" 2. Put HeaderCVS.vim into path "~/.vim/plugin/".
"
" 3. Input ":HeaderCVS YOUR DESCRIPTION HERE" to add CVS Header when editting files.
"    (NOTE: You can insert spaces into your description or omit description.)
"
"
com! -nargs=? HeaderCVS call s:HeaderCVS(<f-args>)
com! -nargs=? GenClock call s:GenClock(<f-args>)

function! s:HeaderCVS(...)
" +++++++++++++++++++++++ Customization starts here +++++++++++++++++++++++
	let s:company = "ZTE"
	let s:creator = "Wu Chunhua"
	let s:email = "wu.chunhua@zte.com.cn"
" ++++++++++++++++++++++++ Customization ends here ++++++++++++++++++++++++
    let s:date = strftime("%c")
	echo s:date
	if a:0 == 0
		let s:desc = ''
	else
		let s:desc = a:1
	endif
"let s:header = "#\\#####################################################################\n#  Copyright ".s:company." Inc.  All Rights reserved\n########################################################################\n#\n#  File           :  ".@%."\n#  Creator        :  ".s:creator."\n#  Creation Date  :  ".s:date."\n#  Description    :  ".s:desc."\n#\n########################################################################\n#    \$Author\$\n#    \$Source\$\n#    \$Revision\$\n#    \$Date\$\n#    \$Id\$\n########################################################################\n#    \$Log\$\n########################################################################\n"

    let s:header = "//FILE_HEADER------------------------------------------------------------------\n//Copyright: ".s:company."\n//Company Confidential: ".s:company."\n//-----------------------------------------------------------------------------\n//FILE NAME:  ".@%."\n//DEPARTMENT:  netsh hardware\n//AUTHOR:  Wu Chunhua\n//AUTHOR'S EMAIL:  ".s:email."\n//-----------------------------------------------------------------------------\n//RELEASE HISTORY\n//VERSION\tDATE\t\t\t\tAUTHOR\t\tDESCRIPTION\n// 1.0\t\t".s:date."\t".s:creator."\tinitial version\n//-----------------------------------------------------------------------------\n//KEYWORDS:  <> <>\n//-----------------------------------------------------------------------------\n//PURPOSE: <>\n//-----------------------------------------------------------------------------\n//PARAMETERS\n//PARAM  NAME:    RANGE:    DESCRIPTION:    DEFAULT:   UNITS\n//N/A\n//-----------------------------------------------------------------------------\n//REUSE ISSUES\n////Reset Strategy:  Asynchronous,  active low\n//Clock  Domains:  single\n//Critical Timing: N/A\n//Test   Features: N/A\n//Asynchronous I/F: NULL\n//Scan Methodology: N/A\n//Instaniations: N/A\n//Synthesizable: Y\n//Other: NULL\n//END_HEADER-------------------------------------------------------------------\n\n`timescale 1 ns / 100 ps\n\nmodule ".@%."();\n\n\nendmodule\n"

	execute "set paste"
	execute "normal O".s:header."\<Esc>"
	execute "set paste&"
endfunction

function! s:GenClock(...)
    let s:gen_clk = "parameter   CYCLE_TIME  = 10;\n\ninitial\nbegin\n    $fsdbAutoSwitchDumpfile(50, ".@%.".fsdb, 100); // need add comma to file name. And the fsdb files maximum size is 50MB\n    $fsdbDumpvars(0,".@%.");\n    //$fsdbDumpFlush();\nend\n\nreg sys_clk;\ninitial\nbegin\n    sys_clk = 0;\n    forever #(CYCLE_TIME/2) sys_clk = !sys_clk;\nend\n\nreg reset_b;\ninitial\nbegin\n    reset_b = 0;\n    #110 reset_b = 1'b1;\nend\n\n\ntask cycle_delay;\ninput   [7:0]   delay_cnt;;\nbegin: cycle_delay\n    integer i;\n    for( i = 0; i < delay_cnt; i= i +1 )\n        @( posedge sys_clk ) #1;\nend\nendtask"

	execute "set paste"
	execute "normal O".s:gen_clk."\<Esc>"
	execute "set paste&"
endfunction

