VIVADO ?= /tools/Xilinx/Vivado/2021.1/bin/vivado

# RECEIVER_SERIAL?= 210203A7DC87A # kc705-01 serial no
# RECEIVER_SERIAL?= 210203A7D6C2A  # kc705-02 serial no
RECEIVER_SERIAL?= 210203A7DDF0A  # ac701 serial no

# ac701 part no
PART?= xc7a200tfbg676

# kc705 part no
# PART?= xc7k325tffg900

clean:
	rm -f *.jou *.log *.pyc
	rm -rf .Xil __pycache__

measure:
	python3 -u communicate_ro.py | tee measurements/python.log

cpu_ro:
	python3 -u communicate_cpu_ro.py | tee measurements/python_cpu_ro.log

gpu_ro:
	python3 -u communicate_gpu_ro.py | tee measurements/python_gpu_ro.log

parse:
	python3 csv_parser.py

build:
	$(VIVADO) -mode batch -nojournal -log binaries/$(PART)/build.log -source build.tcl -tclargs $(PART)

upload:
	$(VIVADO) -mode batch -nojournal -log binaries/$(PART)/upload.log -source upload.tcl -tclargs binaries/$(PART)/covert_receiver_top.bit $(RECEIVER_SERIAL)
