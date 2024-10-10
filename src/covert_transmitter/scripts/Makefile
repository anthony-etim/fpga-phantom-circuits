VIVADO ?= /tools/Xilinx/Vivado/2021.1/bin/vivado

# TRANSMITTER_SERIAL?= 210203A7DC87A # kc705-01 serial no
TRANSMITTER_SERIAL?= 210203A7D6C2A  # kc705-02 serial no
# TRANSMITTER_SERIAL?= 210203A7DDF0A  # ac701 serial no

# ac701 part no
# PART?= xc7a200tfbg676
# HEATERS?=10

# kc705 part no
PART?= xc7k325tffg900
HEATERS?=14

clean:
	rm -f *.jou *.log *.pyc
	rm -rf .Xil __pycache__

cpu_ro:
	python3 -u communicate_ro.py -c 0| tee measurements/python_cpu_ro.log

gpu_ro:
	python3 -u communicate_ro.py -c 1| tee measurements/python_gpu_ro.log

fpga_ro:
	python3 -u communicate_ro.py -c 2| tee measurements/python_fpga_ro.log

parse:
	python3 csv_parser.py

build:
	$(VIVADO) -mode batch -nojournal -log binaries/$(PART)/build.log -source build.tcl -tclargs $(PART) $(HEATERS)

upload:
	$(VIVADO) -mode batch -nojournal -log binaries/$(PART)/upload.log -source upload.tcl -tclargs binaries/$(PART)/covert_transmitter_top.bit $(TRANSMITTER_SERIAL)
