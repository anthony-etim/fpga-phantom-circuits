 #
 # This file is for controling TestEquity Model 115A Temperature Chamber.
 #
 # Copyright (C) Shanquan Tian, CASLAB @ Yale
 # Authors: Shanquan Tian <shanquan.tian@yale.edu>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation; either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program; if not, write to the Free Software Foundation,
 # Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 #



from pyModbusTCP.client import ModbusClient
import time
import struct
import argparse

parser = argparse.ArgumentParser(description='CASLAB thermal chamber controller',
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('-c', '--choice', dest='choice', type=int, default=0,required=True,
            help='Please choose what you want to do:\n1 for read temperature,\n2 for set temperature\n')
parser.add_argument('-t','--temperature', dest='temperature',type=float, default = 25.0, 
            help='Please input the temperature you want to set.')
parser.add_argument('-r', '--repetitions', dest='repetitions', type=int, default=1,
            help='number of repetitions of the command')

args = parser.parse_args()
#args.verb = not args.silent


SERVER_HOST = "172.28.136.97"

c = ModbusClient(host=SERVER_HOST,auto_open=True)
# open or reconnect TCP to server

# define the function transforming number to string of binary
def binary(num):
    return ''.join(bin(ord(c)).replace('0b', '').rjust(8, '0') for c in struct.pack('!f', num))


for x in range(0, args.repetitions):
  if not c.is_open():
    if not c.open():
      print("Unable to connect to "+SERVER_HOST)
    else:
      print("Connect to "+SERVER_HOST+" successfully!")
  if args.choice == 1:
    #print(c.is_open())
    time.sleep(0.2)
    l = c.read_holding_registers(27586, 2)
    print("Registers are "+ str(l)+",  IEEE 754 binary-32 float.")
    if l:
      data = "{0:016b}".format(l[0]) + "{0:016b}".format(l[1])
      sign = data[0]
      exponent = data[1:9]
      body = data[9:32]
      a = 0
      for i in range(23):
        a = a + int(body[i])*2.0**(-i-1)
      a = a + 1
      b = 0
      for i in range (8):
        b = b + int(exponent[i])*2**(7-i)
      result = (-1)**(int(sign)) * a * 2**(b-127)
      print("Temperature is " + str(result) + "  degrees.")

  elif args.choice == 2:
    time.sleep(0.2)
    t = args.temperature
    #t_str = binary(t)
    t_high_str = binary(t)[:16]
    t_low_str = binary(t)[16:]
    t_high = int(t_high_str,2)
    t_low = int(t_low_str,2)
    c.write_multiple_registers(4042,[t_high,t_low])
    print("Set temperature as "+str(args.temperature)+" degrees.")


  else:
    print("Doing nothing.")
  
print "Done."

