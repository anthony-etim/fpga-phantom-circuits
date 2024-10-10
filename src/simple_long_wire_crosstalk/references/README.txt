

* SPD Wikipedia page
https://en.wikipedia.org/wiki/Serial_presence_detect

Need free JEDEC account to get PDF files:

* DDR3 SPD information:
https://www.jedec.org/sites/default/files/docs/4_01_02_11R21A.pdf

* DDR4 SPD information:

Some Xilinx info:

For ZCU104, if you check page 50 of
https://www.xilinx.com/support/documentation/boards_and_kits/zcu104/ug1267-zcu104-eval-bd.pdf
you will see the I2C switch is at 0x74 and if can see on right side
"DDR4_SODIMM_SDA/SC" connected to last port (7th port if you count
starting from 0).  Assuming the 7th port corresponds to most significant
bit, then 0x80 means you are selecting the last port which is the EEPROM
we want.  Hence Before communicating with SPD, you need to I2C write address 0x74 data 0x80 to configure switch to connect us to SPD EEPROM.
After that can read/write SPD EEPROM.

For AC701, if you check page 49 of
https://www.xilinx.com/support/documentation/boards_and_kits/ac701/ug952-ac701-a7-eval-bd.pdf
you see I2C switch addressed at 0x74 again, but "IIC_SDA/SCL_DDR3"
connected to port 6 (again port numbers start with 0).  So I believe you
need to I2C write address 0x74 data 0x40 in to configure switch to connect us to SPD EEPROM.  After that can read/write SPD EEPROM.

Communicating with SPD requires device select address, for ZCU104 it is binary 1 (because
Table on page 51 of the ZCU104 manual shows DDR4 SODIMM J1 = 0x51, and
from DRAM manuals looks like 3 least significant bits are the device
select, so we get 001. For AC701 the manual on page 50 shows DDR3 =
0b1010000, 0b0011000, first looks like 0x50 in which case I would say
the device select is 000 (the second looks like 0x18 which seems to be
temperature register which is part of SPD EEPROM, see page 5 of
https://media-www.micron.com/-/media/client/global/documents/products/technical-note/dram-modules/tn_04_42.pdf?la=en&rev=719f35ea22ae4ba0ab5b54b5a991055f)

