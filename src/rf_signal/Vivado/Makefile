
DATA?=0
FPGA?=ac701
CYCLES?=10000000
THRESHOLD?=4884303
REPEAT?=1
PORTJSON?=~/ports.json
BUILDDIR?=../build/$(FPGA)/
# LGTDCS?=0
NUMTDC?=4

VIVADO_2019.1=/tools/Xilinx/Vivado/2019.1/bin/vivado
VIVADO_2021.1=/tools/Xilinx/Vivado/2021.1/bin/vivado

PARTNAME?=xc7a200tfbg676
# PARTNAME?=xc7k325tffg900

# RECEIVER_SERIAL?= 210203A7DC87A # kc705-01 serial no
# RECEIVER_SERIAL?= 210203A7D6C2A  # kc705-02 serial no
RECEIVER_SERIAL?= 210203A7DDF0A  # ac701 serial no

# RECEIVER_UART_PORT    = '/dev/ttyUSB0'    # kc705-01 uart port
# RECEIVER_UART_PORT    = '/dev/ttyUSB3'    # kc705-02 uart port
RECEIVER_UART_PORT    = '/dev/ttyUSB6'    # ac701-01 uart port

# NUM?=4000
NUM?=1500
MESG?=test

run: synth program test


updateAddr:
	python3.8 ../software/utilities.py -c 0


synth: generateConstraints clean
	rm -rf ../build/$(FPGA)
	./make_build_one.py $(FPGA) | tee report_synth.txt
	cp ../boards/$(FPGA)/*.xdc ../build/$(FPGA)


program:
	./make_program.py -d $(BUILDDIR) -j $(PORTJSON) -b $(FPGA)

upload:
	$(VIVADO_2021.1) -mode batch -nojournal -log upload.log -source upload.tcl -tclargs ../build/$(FPGA)/synth_system.bit $(RECEIVER_SERIAL)

experiment: 
	python3 ../software/fpga.py -c 0 -n $(NUM) --mesg $(MESG) | tee experiment_record.txt

analyze:
	python3.8 ../software/analysis.py -f ./data

turn_on_ro_heater:
	python3 ../software/fpga.py -c 1

turn_off_ro_heater:
	python3 ../software/fpga.py -c 2


enable_rf:
	cd ../software/ ; python3.6 rf.py --enable

disable_rf:
	cd ../software/ ; python3.6 rf.py --disable

ip_clock:
	$(VIVADO_2021.1) -nojournal -log log.log -mode batch -source generateIP-clock.tcl -tclargs $(PARTNAME) ../ip/$(PARTNAME)/ 

generateConstraints:
	cd ../constraints/ ; python3.8 generate_constraint.py -n $(NUMTDC)

clean:
	rm -rf .Xil *.log usage_statistics_webtalk.html usage_statistics_webtalk.xml vivado.jou fsm_encoding.os hd_visual
	rm -rf xsim.dir *.pb *.jou *.wdb *.wcfg *.log *.vcd *.sage.py screenlog.0


# Experiment records

# make enable_rf ; make program ; make experiment MESG=RF500MHz_parallel_middle ; 

# make disable_rf ; make program ; make turn_on_ro_heater ; make experiment MESG=noRF_parallel_middle_withRO ; 

# make enable_rf ; make program ; make turn_on_ro_heater ; make experiment MESG=RF500MHz_parallel_middle_withRO ; 

# make disable_rf ; make program ; make experiment MESG=noRF_vertical_corner ; make experiment MESG=noRF_vertical_corner ; make experiment MESG=noRF_vertical_corner ; 

# make enable_rf ; make program ; make experiment MESG=RF500MHz_vertical_corner ; make experiment MESG=RF500MHz_vertical_corner ; make experiment MESG=RF500MHz_vertical_corner ; 

# make disable_rf ; make program ; make turn_on_ro_heater ; make experiment MESG=noRF_vertical_corner_withRO ; make experiment MESG=noRF_vertical_corner_withRO ; make experiment MESG=noRF_vertical_corner_withRO ; make experiment MESG=noRF_vertical_corner_withRO ; make experiment MESG=noRF_vertical_corner_withRO ; 

# make enable_rf ; make program ; make turn_on_ro_heater ; make experiment MESG=RF500MHz_vertical_corner_withRO ; make experiment MESG=RF500MHz_vertical_corner_withRO ; make experiment MESG=RF500MHz_vertical_corner_withRO ; 






