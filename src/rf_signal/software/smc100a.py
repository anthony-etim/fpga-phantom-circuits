#!/usr/bin/env python3

import pyvisa
import time

class SMC100A:
    def __init__(self):
        self.rm = pyvisa.ResourceManager()
        self.rm.list_resources()
        print('>> Connecting to resource USB0::2733::110::103953::0::INSTR...')
        self.inst = self.rm.open_resource('USB0::2733::110::103953::0::INSTR')
        print('>> Getting identification string...')
        print(self.inst.query("*IDN?").rstrip())
        print('>> Ready for commands')
        print('')

    def send(self, cmd):
        print('>> Sending command: %s' % (cmd))
        self.inst.write(cmd)

    def ask(self, cmd):
        print('>> Querying command: %s' % (cmd))
        return self.inst.query(cmd)
    
    def reset(self):
        print('>> Resetting the device...')
        self.send('*RST')
        self.send('*CLS')
        print('')

    def shutdown(self):
        print('>> Shutting down the device...')
        self.send("SYST:SHUT")
        print('')

    def enable_screen_saver(self):
        print('>> Enabling screen saver, delay set to 30 minute...')
        self.send("DISP:PSAV:HOLD 30")
        self.send("DISP:PSAV ON")
        print('')

    def get_mac_address(self):
        print('>> Querying MAC address...')
        print(self.ask("SYST:COMM:NETW:MAC?").rstrip())
        print('')

    def set_carrier(self, freq, mvp2p):
        mvrms = 0.353*mvp2p
        print('>> Setting frequency to ' + str(freq/1000000) + 'MHz')
        self.send("FREQ %.2f" % freq)
        self.send("POW %.1f mV" % mvrms)
        print('')

    def send_and_wait(self, cmds):
        self.send("*CLS")
        for cmd in cmds:
            self.send(cmd)
        self.send("*OPC")
        esr_val = 0
        while esr_val & 1 == 0:
            esr_val = int(self.ask("*ESR?"))
            time.sleep(0.01)

    def set_am_modulation(self, freq, depth):
        self.send("AM:INT:FREQ %.2f" % freq)
        self.send("AM:DEPTH %.1f" % depth)
        print('')

    def enable(self, am_enable, car_enable):
        def b2s(en_bool):
            return "ON" if en_bool else "OFF"
        self.send_and_wait(["AM:STATE %s" % b2s(am_enable), "OUTP %s" % b2s(car_enable)])
        print('')

if __name__=="__main__":
    # Connect to the device
    siggen = SMC100A()
    time.sleep(1)

    # Get MAC address
    siggen.get_mac_address()
    time.sleep(1)

    # Enable screen saver mode to save LCD display
    siggen.enable_screen_saver()
    time.sleep(1)

    # Set frequency to 60MHz and enable output
    # Max voltage is 2800 mV ~ 1000 mV RMS
    siggen.set_carrier(60e6, 2800)
    siggen.set_am_modulation(1, 80)
    siggen.enable(True, True)
    time.sleep(1)

    # Reset the device
    # siggen.reset()
    # time.sleep(1)
    siggen.enable(False, False)