

eid    := e000
simdir := out


# tarE, target example dir name, which will be used to create the target dir in ${simdir}/
tarE     := $(shell basename $(shell find . -maxdepth 1 -mindepth 1 -type d -name "*${eid}"))
fullTarE := ${simdir}/${tarE}

uvm_options := -incdir $$UVM_HOME/sv/src $$UVM_HOME/sv/src/dpi/uvm_dpi.cc $$UVM_HOME/sv/src/uvm.sv 

all: ${fullTarE}
	cd ${fullTarE}; \
	run-cdns ${uvm_options} -f run.list -errormax 1 -uvmnoautocompile



${fullTarE}:
	if [ ! -d ${simdir} ]; then \
		mkdir ${simdir}; \
	fi
	if [ ! -d ${fullTarE} ]; then \
		mkdir ${fullTarE}; \
	fi
	make -C ${tarE} simdir=${fullTarE}

clean:
	rm -rf ${fullTarE}
cleanall:
	rm -rf ${simdir}
test: 
	echo ${fullTarE}

#.SILENT:
