#! /usr/bin/env perl
## ******************************************************************************************
## File         : sim.pl
## Author       : RyanHunter
## Creating Date: Sat Sep 26 21:18:05 2020
## Claim        : only the author can comment without a signature preffixed by ', that
## means anyone else want to change the code must comments with '.
## ******************************************************************************************

use File::Basename;


main();


sub main()
{

	my $rootD = `pwd`; chomp($rootD);
	my $case  = shift(@ARGV);
	my $simc  = "xrun -64bit";

	$rootD = dirname($rootD);
	


	my $home = `find $rootD -name "$case.sv"`; chomp($home);


	$home = dirname(dirname($home));

	$simc .= " -uvmnoautocompile -incdir $ENV{UVM_HOME}/sv/src $ENV{UVM_HOME}/sv/src/dpi/uvm_dpi.cc $ENV{UVM_HOME}/sv/src/uvm.sv";
	$simc .= " -incdir $home -f $home/filelist";
	$simc .= " -errormax 1 -access rwc -timescale 1ns/1ps +UVM_TESTNAME=$case";

	#print $simc,"\n";
	
	system($simc);

}
