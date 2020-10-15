
cases :=
category := all

include report/make_case.lst
include phase/make_case.lst
include regs/make_case.lst

# add cases here




# sim dir
sim := sim

ext :=

# the list command, use to list all available tests
list:
	echo listing commands, if nothing happen, you should specify which part to display:
	echo ""
	echo $(filter-out all,$(category))
	echo ""


# start runing examples
# commands will be added below
$(cases):
	echo do cases $@
	if [ ! -d $(sim) ]; then \
		mkdir $(sim); \
	fi; \
	cd $(sim); ../script/sim.pl $@ $(ext);




list_cases :=
ifeq ($(list_filter),all)
# list filter is all, listing all the examples
list_cases = $(cases)
else
list_cases = $(filter $(list_filter)%,$(cases))
endif



$(category):
	make internal_list list_filter=$@


internal_list:
	echo do internal_list: $(list_cases)


clean:
	rm -rf $(sim)


.SILENT:
.PHONY: report phase
