
DATA?=170
FPGA?=ac701
CYCLES?=10000000
THRESHOLD?=4884303
REPEAT?=1
PORTJSON?=~/ccf/ports.json
BUILDDIR?=../build/$(FPGA)/



run: synth program test

synth: clean
	rm -rf ../build/$(FPGA)
	./make_build_one.py $(FPGA) | tee report_synth.txt

program:
	./make_program.py -d $(BUILDDIR) -j $(PORTJSON)

test:
	python3.8 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -t $(REPEAT) -c $(CYCLES) -v $(THRESHOLD) -d $(DATA) 

clean:
	rm -rf .Xil *.log usage_statistics_webtalk.html usage_statistics_webtalk.xml vivado.jou fsm_encoding.os hd_visual
	rm -rf xsim.dir *.pb *.jou *.wdb *.wcfg *.log *.vcd *.sage.py screenlog.0


