# NOTE: this config file should generally be located:
# ~/.ipython/profile_default/ipython_config.py

import sys
import os
import numpy as np
import pandas as pd
from IPython.terminal.prompts import Prompts, Token
from prompt_toolkit.key_binding.vi_state import InputMode, ViState

line_width = int(os.popen("stty size", "r").read().split()[1])  # automatic line width using size of shell
precision = 6  # decimal places for float values
pd.set_option("display.width", line_width)
pd.set_option("display.max_columns", 20)
pd.set_option("display.precision", precision)
np.set_printoptions(linewidth=line_width, edgeitems=5, precision=precision)

config = get_config()
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = "vim"
c.InteractiveShell.ast_node_interactivity = "last_expr_or_assign"  # print last assignment (like julia or matlab)
c.InteractiveShellApp.exec_lines = [
    #"%pdb on"
    "%load_ext autoreload",
    "%autoreload 2",
    "import os",
    "import numpy as np",
    "import pandas as pd",
    "import datetime as dt",
    "from pylab import *",
    "import matplotlib.pyplot as mpl",
    "ion()",
]


class CustomPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, ":> ")]

    def continuation_prompt_tokens(self, cli=None, width=None):
        return [(Token.Prompt, "   ")]

    def out_prompt_tokens(self):
        return [(Token.Prompt, "")]


# change cursor shape based on vi mode
def get_input_mode(self):
    return self._input_mode


def set_input_mode(self, mode):
    shape = {InputMode.INSERT: 5, InputMode.NAVIGATION: 2, InputMode.REPLACE: 3}.get(mode, 5)
    out = sys.stdout.write
    out(u"\x1b[{} q".format(shape))
    sys.stdout.flush()
    self._input_mode = mode


ViState._input_mode = InputMode.INSERT
ViState.input_mode = property(get_input_mode, set_input_mode)

c.TerminalInteractiveShell.prompts_class = CustomPrompt
c.TerminalInteractiveShell.colors = "linux"
c.TerminalInteractiveShell.editing_mode = "vi"

import token
import tokenize
from pygments.token import Token, Keyword, Name, Comment, String, Error, Number, Operator, Generic, Whitespace
from IPython.utils import PyColorize
from IPython.utils import coloransi
from IPython.core import excolors, ultratb, debugger
from IPython.core.excolors import exception_colors as exception_colors_orig

color_scheme = "dysonance"
c.InteractiveShell.colors = color_scheme
c.TerminalInteractiveShell.highlighting_style_overrides = {
    Token.Comment: "#888",
    Token.Error: "#800",
    Token.Keyword: "#088",
    Token.Name.Class: "#f80",
    Token.Name.Function: "#ff0",
    Token.Name.Namespace: "#880",
    Token.Number: "#f00",
    Token.Operator: "#ff0",
    Token.OutPrompt: "#888 bold",
    Token.OutPromptNum: "#888 bold",
    Token.Prompt: "#888",
    Token.PromptNum: "#888",
    Token.Punctuation: "#0ff",
    Token.String: "#0f0",
}
