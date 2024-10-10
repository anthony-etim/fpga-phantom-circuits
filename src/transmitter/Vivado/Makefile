


TOPLEVEL=transmitter
SIM_TOP=testbench
SRC=source.txt

PARTNAME?=XC7A100TCSG324-1#Arty A7-100T



TEST_FOR_EXECUTABLES=$(foreach exec,$(EXECUTABLES), $(if $(shell which $(exec)),,$(error 'No $(exec) in PATH, consider doing: export PATH=$$PATH:/tools/Xilinx/Vivado/2018.3/bin/')))



all: simulate_transmitter

SOURCE_LIST=$(shell cat $(SRC) | grep -v "\#" | sed -e "s/\"//g" )


synth_system.bit: $(SOURCE_LIST) clean
	$(TEST_FOR_EXECUTABLES)
	echo $(TOPLEVEL) $(PARTNAME) > $(REPORT)
	vivado -nojournal -log log.log -mode batch -source synthesize.tcl -tclargs $(SRC) $(TOPLEVEL) $(PARTNAME) | tee -a $(REPORT)
	mkdir -p reports ; mv report_syn-* ./reports


simulate_transmitter: clean
	$(TEST_FOR_EXECUTABLES)
	xelab -prj simulate_transmitter.prj --relax -debug typical $(SIM_TOP) -s sim
	xsim sim -t simulate.tcl 

waveform: waveform.wcfg
	xsim sim -view $< -gui

program: synth_system.bit
	vivado -nojournal -log log.log -mode batch -source program.tcl -tclargs xc7a35 synth_system.bit

clean:
	rm -rf .Xil *.log synth_system.bit usage_statistics_webtalk.html usage_statistics_webtalk.xml vivado.jou fsm_encoding.os 
	rm -rf xsim.dir *.pb *.jou *.wdb *.wcfg *.log *.vcd *.sage.py 
	rm -rf mem_sort_*.txt



