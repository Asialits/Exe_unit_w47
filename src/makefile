EXAMPLE     = exe_unit_w47
MODEL_FILES = ${EXAMPLE}.sv
RTL_FILES   = ${EXAMPLE}_rtl.sv
TB_FILES    = testbench.sv
SYNTH_FILES = synth.log
SIGNALS     = signals.vcd

rtl:
	yosys -s run.ys | tee synth.log 

sim: compile 	
	./${EXAMPLE}.iveri.run

compile: 
	iverilog -g2005-sv				\
		${MODEL_FILES} ${RTL_FILES} ${TB_FILES}	\
		-o ${EXAMPLE}.iveri.run			\
			|& tee ${EXAMPLE}.iveri.log
waves:
	gtkwave signals.vcd &

clear: 
	[ -f ${EXAMPLE}.iveri.run ] && rm ${EXAMPLE}.iveri.run

clar: clear	
	[ -f ${EXAMPLE}.iveri.log ] && rm ${EXAMPLE}.iveri.log 	
	[ -f ${RTL_FILES} ] && rm ${RTL_FILES}
	[ -f ${SYNTH_FILES} ] && rm ${SYNTH_FILES}
	[ -f ${SIGNALS} ] && rm ${SIGNALS}
