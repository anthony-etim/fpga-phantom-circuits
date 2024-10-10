import visa

class KEI2231(object):
    def __init__(self, instr="ASRL/dev/ttyUSB3::INSTR", timeout=20000):
        self._rm = visa.ResourceManager('@py')
        ps = self._rm.open_resource(instr, baud_rate=9600, data_bits=8)
        ps.read_termination = '\n'
        ps.write_termination = '\n'
        ps.send_end = True
        ps.StopBits = 1
        ps.timeout = timeout
        self._ps = ps
        self.send('SYST:REM')

    def __del__(self):
        # self.set_enable(0)
        self.disconnect()
        # self._rm.close()

    def get_id(self):
        return self.query("*IDN?")

    def reset(self):
        self.send('*RST')

    def disconnect(self):
        self.send('SYST:LOC')
        # self._ps.close()

    def select_channel(self, chan):
        self.send("INST:NSEL %d" % chan)

    def set_voltage(self, v):
        self.send("VOLT %f" % v)

    def set_current(self, i):
        self.send("CURR %f" % i)

    def set_enable(self, enable):
        self.send("OUTP %d" % (1 if enable else 0))

    def send(self, cmd):
        # print("Sending cmd", cmd)
        self._ps.write(cmd)

    def query(self, cmd):
        # print("Querying cmd", cmd)
        return self._ps.query(cmd)

class Fake_KEI2231(object):
    def __getattr__(self, name):
        def wrapper(*args, **kwargs):
            print "'%s' was called" % name
            for index, arg in enumerate(args):
                print "arg", index, arg
            if kwargs is not None:
                for key, value in kwargs.iteritems():
                    print "%s == %s" %(key,value)
        return wrapper

def test_ps(debug=False):
    visa.log_to_screen()
    if debug:
        ps = Fake_KEI2231()
    else:
        ps = KEI2231()
    print(ps.get_id())
    # ps.reset()
    ps.select_channel(1)
    ps.set_current(3)
    ps.set_voltage(12)
    ps.set_enable(1)
