
DATA?=0

######################
# FPGA device setting
######################
# FPGA?=ac701
# PARTNAME?=xc7a200tfbg676
FPGA?=artyA7
PARTNAME?=xc7a100tcsg324-1

######################
# Synthesis setting
######################
# PORTJSON is defined in ~/.bashrc
BUILDDIR?=../build/$(FPGA)/
VIVADO_2019.1=/tools/Xilinx/Vivado/2019.1/bin/vivado

######################
# HW code setting
######################
# NULL
######################
# Experiment setting
######################
BAUDRATE?=921600
TXBIT?=0

test:
	echo $(PORTJSON)

run: synth program test

synth: generateXDC clean
	rm -rf ../build/$(FPGA)
	./make_build_one.py $(FPGA) | tee report_synth.txt

program:
	./make_program.py -d $(BUILDDIR) -j $(PORTJSON)

updateAddr:
	python3.8 ../software/utilities.py -c 0

ip_clock:
	$(VIVADO_2019.1) -nojournal -log log.log -mode batch -source generateIP-clock.tcl -tclargs $(PARTNAME) ../ip/$(PARTNAME)

generateXDC:
	cd ../constraints ; python generate_constraint.py -b $(FPGA)

experi:
	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -b $(BAUDRATE) --bit $(TXBIT)


clean:
	rm -rf .Xil *.log usage_statistics_webtalk.html usage_statistics_webtalk.xml vivado.jou fsm_encoding.os hd_visual
	rm -rf xsim.dir *.pb *.jou *.wdb *.wcfg *.log *.vcd *.sage.py screenlog.0


