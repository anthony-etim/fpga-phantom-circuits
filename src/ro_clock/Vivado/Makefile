
DATA?=0
FPGA?=ac701
# FPGA?=vcu1525
CYCLES?=10000000
THRESHOLD?=4884303
REPEAT?=1
PORTJSON?=~/ccf/ports.json
# PORTJSON?=/home/aee38/ports.json
BUILDDIR?=../build/$(FPGA)/

VIVADO_2019.1=/tools/Xilinx/Vivado/2019.1/bin/vivado
PARTNAME?=xc7a200tfbg676
# PARTNAME?=xcvu9p-fsgd2104-2L-e

NUM?=10
TRANSMIT_BIT?=0

run: synth program testFIFO

synth: clean
	rm -rf ../build/$(FPGA)
	./make_build_one.py $(FPGA) | tee report_synth.txt

program:
	./make_program.py -d $(BUILDDIR) -j $(PORTJSON)

# testRO:
# 	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -t $(REPEAT) -c $(CYCLES) -v $(THRESHOLD) -d $(DATA) 

testTDC:
	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -n $(NUM) --bit $(TRANSMIT_BIT) | tee data_NUM_$(NUM)_BIT_$(TRANSMIT_BIT).txt

testFIFO:
	python3.8 ../software/uart_loopback_test.py -b 921600 -j $(PORTJSON) 


updateAddr:
	python3.8 ../software/utilities.py -c 0


ip_ro_clock:
	$(VIVADO_2019.1) -nojournal -log log.log -mode batch -source generateIP-ro_clock.tcl -tclargs $(PARTNAME) ../ip/$(PARTNAME)/ 

ip_fifo:
	$(VIVADO_2019.1) -nojournal -log log.log -mode batch -source generateIP-Async-Fifo.tcl -tclargs $(PARTNAME) ../ip/$(PARTNAME)/ 


sim:
	iverilog -I verilog/ -o async_fifo-tb.vvp -Wall -Wno-timescale async_fifo.sv async_fifo-tb.v
	vvp async_fifo-tb.vvp



clean:
	rm -rf .Xil *.log usage_statistics_webtalk.html usage_statistics_webtalk.xml vivado.jou fsm_encoding.os hd_visual
	rm -rf xsim.dir *.pb *.jou *.wdb *.wcfg *.log *.vcd *.sage.py screenlog.0


