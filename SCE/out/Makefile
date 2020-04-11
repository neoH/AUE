
test := fetch_base_test


all:
	run-cdns -f run.list -errormax 1 -uvmnoautocompile +UVM_TESTNAME=${test}
clean:
	rm -rf *.log *.d *.history
