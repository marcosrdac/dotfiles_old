import atexit
import os
import pathlib
import readline

histfile = os.path.join(os.path.expanduser("~"), ".cache/python/python_history")
try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
except FileNotFoundError:
    os.makedirs(os.path.dirname(histfile), exist_ok=True)
    open(histfile, 'a').close()
    readline.read_history_file(histfile)
    pass
readline.set_history_length(-1)

atexit.register(readline.write_history_file, histfile)
