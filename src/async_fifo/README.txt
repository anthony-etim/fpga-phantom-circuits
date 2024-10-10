# Builing hardware design

In the Vivado folder you should run make_build_one.py script to build the design
for one specific FPGA board.  List of available boards is in boards.json file.
For example, to build the design for the AC701 board, execute the command:

./make_build_one.py ac701

The design will be built and the bitstream file will be generated under
the build/ac701/ folder for the AC701 example. The bitstream that will be
generated is the synth_system.bit file.

# Programming the FPGA board

First, you need to turn on the desired FPGA board using the control_fpga.py script.
One the board is turned on, you should have a file in /home/$USER/ccf/ports.json that
list the details of the board, such as the serial port that it is connected to
as well as the serial number of the FPGA (there can be multiple boards of the same
type, e.g., multiple AC701 boards can be on at the same time, so the serial number
is used to program the desired board.

To program the FPGA board, use the make_program.py script from the Vivado folder.
The script requries 3 argumens, build directory where the synth_system.bit file is,
the target board you are going to program, and the location of the ports.json file.

The target board is the specific FPGA, e.g., ac701-02.  The ports.json file is used to
get the serial number associated with the target board.  The build directory is needed
to locate the bitstream file for programming.

For example, to program the ac701-02 board, use the command:

./make_program.py -d ../build/ac701/ -b ac701-01 -j ~/ccf/ports.json

Above command assumes you are executing it from the Vivado folder, thus the build directory
is one directory up.  In above example, the ports.json is in ccf/ folder inside the home diretory
which is referenced using the ~ (you can also use /home/$USER/ instead of ~).

If there are no errors, the device is programmed.

# Communicating with the loopback hardware using the uart_loopback_test.py

The test script sends an ASCII character (an 8-bit value) and expects the FPGA to respond with
the value incremented by 1.  I.e. if you send letter "A" (ASCII code decimal value is 65),
then the script expects the FPGA to send back "B" (which is decimal 66 = 65 + 1).

To run the script, you need to set the baud rate and the serial port.  Baud rate can be found
from the top-level Verilog file.  The serial port can be found from the ports.json file.
For example, the command:

./phantom_circuits_test.py -b 921600 -p /dev/ttyUSB2

Will use baud rate of 921600 and connect to device at /dev/ttyUSB2 serial port.

The test script should finish with 'Test passed.' message.
