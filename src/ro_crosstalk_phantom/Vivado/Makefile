
DATA?=0
FPGA?=ac701
CYCLES?=10000000
THRESHOLD?=4884303
REPEAT?=1
PORTJSON?=~/ccf/ports.json
BUILDDIR?=../build/$(FPGA)/

VIVADO_2019.1=/tools/Xilinx/Vivado/2019.1/bin/vivado
PARTNAME?=xc7a200tfbg676

NUM?=10
TRANSMIT_BIT?=0

useTXRO?=

run: synth program test

synth: generateXDC clean
	rm -rf ../build/$(FPGA)
	./make_build_one.py $(FPGA) | tee report_synth.txt

program:
	./make_program.py -d $(BUILDDIR) -j $(PORTJSON)

# testRO:
# 	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -t $(REPEAT) -c $(CYCLES) -v $(THRESHOLD) -d $(DATA) 

testTDC:
	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -n $(NUM) --bit $(TRANSMIT_BIT) | tee data_NUM_$(NUM)_BIT_$(TRANSMIT_BIT).txt


testTDC_TXRO:
	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -n $(NUM) --bit $(TRANSMIT_BIT) --useTXRO | tee data_NUM_$(NUM)_BIT_useTXRO.txt

testTDC_noRO:
	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -n $(NUM) --bit $(TRANSMIT_BIT) | tee data_NUM_$(NUM)_BIT_noRO.txt

updateAddr:
	python3.8 ../software/utilities.py -c 0


ip_clock:
	$(VIVADO_2019.1) -nojournal -log log.log -mode batch -source generateIP-clock.tcl -tclargs $(PARTNAME) ../ip/$(PARTNAME)/ 

generateXDC:
	cd ../constraints ; python generate_constraint.py
	mv ../constraints/ac701_rev2.0.xdc ../boards/ac701/

experi:
	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON)


clean:
	rm -rf .Xil *.log usage_statistics_webtalk.html usage_statistics_webtalk.xml vivado.jou fsm_encoding.os hd_visual
	rm -rf xsim.dir *.pb *.jou *.wdb *.wcfg *.log *.vcd *.sage.py screenlog.0


