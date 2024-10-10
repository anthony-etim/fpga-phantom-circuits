

######################
# FPGA device setting
######################
# FPGA?=ac701
# PARTNAME?=xc7a200tfbg676
FPGA?=kc705
PARTNAME?=xc7k325tffg900

######################
# Synthesis setting
######################
# PORTJSON is defined in ~/.bashrc
PORTJSON?=~/ports.json
BUILDDIR?=../build/$(FPGA)/
VIVADO_2019.1=/tools/Xilinx/Vivado/2019.1/bin/vivado

# RECEIVER_KC705_SERIAL?= 210203A7DC87A   # kc705-01 serial no
RECEIVER_KC705_SERIAL?= 210203A7D6C2A # kc705-02 serial no

KC705_UART_PORT?= /dev/ttyUSB0          # kc705-01 uart port
# KC705_UART_PORT?= /dev/ttyUSB3        # kc705-02 uart port

######################
# HW code setting
######################
# NULL

######################
# Experiment setting
######################
BAUDRATE?=921600
TXBIT?= 
NUM_REPS?=5
NUM_TX_BITS?=8
# COOLDOWN_CYCLES?=0
# COOLDOWN_CYCLES?=262144
# COOLDOWN_CYCLES?=8388608
# COOLDOWN_CYCLES?=4194304
# COOLDOWN_CYCLES?=6291456
COOLDOWN_CYCLES?=8388608
# COOLDOWN_CYCLES?=12582912
# COOLDOWN_CYCLES?=16777216
# COOLDOWN_CYCLES?=25165824
# DELAY_CYCLES?=12582912
# DELAY_CYCLES?=25165824
DELAY_CYCLES?=8388608

START_RANGE?=0
STOP_RANGE?=700
RANGE_STEP?=50

######################
# Plot setting
######################
DATA_NPZ?= ./$(shell ls *.npz | grep "data_rep_phantum_measure$(NUM_REPS)_random_bit_cooldown$(COOLDOWN_CYCLES)_cycles_per_bit$(DELAY_CYCLES)" | tail -n 1)

ro_test_phantom_heater: ip_ro_clock ip_fifo synth upload phantom_ro_heater

ro_test_heater: ip_ro_clock ip_fifo synth program experi_heater

ro_counts: ip_ro_clock ip_fifo synth program count_experi

test:
	echo $(PORTJSON)

run: synth program test

synth: generateXDC clean
	rm -rf ../build/$(FPGA)
	./make_build_one.py $(FPGA) | tee report_synth.txt
	cp ../boards/$(FPGA)/kc705_rev2.0.xdc ../build/$(FPGA)

# program:
# 	./make_program.py -d $(BUILDDIR) -j $(PORTJSON)

upload:
	$(VIVADO_2019.1) -mode batch -nojournal -log upload.log -source upload.tcl -tclargs ../build/$(FPGA)/synth_system.bit $(RECEIVER_KC705_SERIAL)

updateAddr:
	python3.8 ../software/utilities.py -c 0

ip_clock:
	$(VIVADO_2019.1) -nojournal -log log.log -mode batch -source generateIP-clock.tcl -tclargs $(PARTNAME) ../ip/$(PARTNAME)

ip_ro_clock:
	$(VIVADO_2019.1) -nojournal -log log.log -mode batch -source generateIP-ro_clock.tcl -tclargs $(PARTNAME) ../ip/$(PARTNAME)/ 

ip_fifo:
	$(VIVADO_2019.1) -nojournal -log log.log -mode batch -source generateIP-Async-Fifo.tcl -tclargs $(PARTNAME) ../ip/$(PARTNAME)/ 

generateXDC:
	cd ../constraints ; python generate_constraint.py -b $(FPGA)

experi:
	python3 ../software/phantom_circuits_test_shanquan.py -j $(PORTJSON) -b $(BAUDRATE) -n $(NUM_REPS) --num_tx_bits $(NUM_TX_BITS) --cooldown_cycles $(COOLDOWN_CYCLES) --delay_cycles $(DELAY_CYCLES)

experi_heater:
	python3 ../software/phantom_circuits_test_ro_heater_anthony.py -j $(PORTJSON) -b $(BAUDRATE) -n $(NUM_REPS) --num_tx_bits $(NUM_TX_BITS) --cooldown_cycles $(COOLDOWN_CYCLES) --delay_cycles $(DELAY_CYCLES)

phantom_ro_heater:
	python3 ../software/phantom_ro_heater.py -p $(KC705_UART_PORT) -b $(BAUDRATE) -n $(NUM_REPS) --num_tx_bits $(NUM_TX_BITS) --cooldown_cycles $(COOLDOWN_CYCLES) --delay_cycles $(DELAY_CYCLES)

experi_ilias_method_2:
	python3 ../software/phantom_circuits_test_shanquan_ilias_method_2.py -j $(PORTJSON) -b $(BAUDRATE) -n $(NUM_REPS) --num_tx_bits $(NUM_TX_BITS) --cooldown_cycles $(COOLDOWN_CYCLES) --delay_cycles $(DELAY_CYCLES)

experi_ilias_method_3:
	python3 ../software/phantom_circuits_test_shanquan_ilias_method_3.py -j $(PORTJSON) -b $(BAUDRATE) -n $(NUM_REPS) --num_tx_bits $(NUM_TX_BITS) --cooldown_cycles $(COOLDOWN_CYCLES) --delay_cycles $(DELAY_CYCLES)

experi_ilias_method_4:
	python3 ../software/phantom_circuits_test_shanquan_ilias_method_4.py -j $(PORTJSON) -b $(BAUDRATE) -n $(NUM_REPS) --num_tx_bits $(NUM_TX_BITS) --cooldown_cycles $(COOLDOWN_CYCLES) --delay_cycles $(DELAY_CYCLES)

count_experi:
	python3 ../software/ro_mmcm_test_anthony.py -p $(KC705_UART_PORT) -b $(BAUDRATE) 

plot:
	python3.8 ../software/ro_analysis.py -f $(DATA_NPZ) -n $(NUM_REPS)  --startrange $(START_RANGE) --stoprange $(STOP_RANGE) --rangestep $(RANGE_STEP) --bit $(TXBIT)

tx_bit_error:
	python3 ../software/tx_bit_error.py -f $(DATA_NPZ) -n $(NUM_REPS) --num_tx_bits $(NUM_TX_BITS) --cooldown_cycles $(COOLDOWN_CYCLES) --delay_cycles $(DELAY_CYCLES)

tx_bit_error_ilias:
	python3 ../software/tx_bit_error_ilias.py -f $(DATA_NPZ) -n $(NUM_REPS) --bit $(TXBIT) --num_tx_bits $(NUM_TX_BITS) --cooldown_cycles $(COOLDOWN_CYCLES) --delay_cycles $(DELAY_CYCLES)

clean:
	rm -rf .Xil *.log usage_statistics_webtalk.html usage_statistics_webtalk.xml vivado.jou fsm_encoding.os hd_visual
	rm -rf xsim.dir *.pb *.jou *.wdb *.wcfg *.log *.vcd *.sage.py screenlog.0
	rm -f  ../vivado*.jou ../vivado*.log ../vivado_pid*.str

