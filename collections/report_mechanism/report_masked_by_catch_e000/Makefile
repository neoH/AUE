
simdir := out

list := run.list
tar_list := ../${simdir}/${list}

all: ${tar_list}
	cp ${list} ../${simdir}

${tar_list}:
	realpath *.sv* > ${list}
	sort ${list} -o ${list}
