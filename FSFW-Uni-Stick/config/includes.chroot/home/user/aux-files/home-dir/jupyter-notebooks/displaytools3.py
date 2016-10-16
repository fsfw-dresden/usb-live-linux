# -*- coding: utf-8 -*-

# Issues: SyntaxError points to the wrong line (due to display insertion)
# Note: this extension does not work properly with keywordargs: x = func(a, b=2)


"""
This module was written by Carsten Knoll, see 

https://github.com/cknoll/displaytools

As I have no idea which licence I should choose this code is licenced under GPLv3
see

https://www.gnu.org/licenses/gpl-3.0.en.html


------------------------------------------------------------------------------

This module is an experimental ipython extension.

Background: insert some logic to display the 'result' of an assignment



# load it with %reload_ext displaytools

 usage:
 
`my_random_variable =  np.random.rand() ##`

inserts the source line `display(my_random_variable)` to the source code,
that is actually executed.

That way, the notebook is more comprehensible beacause the reader knows
the content of `my_random_variable`. It saves the typing effort and the code
duplication of manually adding `display(my_random_variable)`.
"""

# todo maybe use sp.Eq(sp.Symbol('Z1'), theta, evaluate=False) to get better formatting


#import new
import types


import IPython
from IPython.display import display


class Container(object):
    pass

# special comments
sc = '##'
sc_lhs = '##:'
sc_transpose = '##T'
sc_lhs_transpose = '##:T'

sc_list = [sc, sc_lhs, sc_transpose, sc_lhs_transpose]

# ensure that all special comments have the same start string
for elt in sc_list:
    assert elt.startswith(sc)

def eval_line_end(line):
    res = Container()
    res.sc = False
    res.lhs = False
    res.transpose = False
    res.assignment = False

    if line.endswith(sc):
        res.sc = True

    elif line.endswith(sc_lhs):
        res.sc = True
        res.lhs = True

    # Transposition assumes that sympy or numpy is imported
    elif line.endswith(sc_transpose):
        res.sc = True
        res.transpose = True

    elif line.endswith(sc_lhs_transpose):
        res.sc = True
        res.lhs = True
        res.transpose = True

    return res


def process_line(line, line_flags, disp_str):

    if line_flags.assignment:
        delim = "---"
        brace_str = "%s"
    else:
        delim = "___"
        brace_str = "(%s)"

     #!! try ... eval(...) except SyntaxError ?
    if line_flags.transpose:
        disp_str = brace_str % disp_str
        disp_str += '.T'
    if line_flags.lhs:
        new_line = 'custom_display("%s", %s); print("%s")' % (disp_str, disp_str, delim)
    else:
        new_line = 'display(%s); print("%s")' % (disp_str, delim)

    return new_line


def insert_disp_lines(raw_cell):
    lines = raw_cell.split('\n')
    N = len(lines)
    
    # iterate from behind -> insert does not change the lower indices
    for i in range(N-1, -1, -1):
        line = lines[i]
        line_flags = eval_line_end(line)

        if line_flags.sc:
            if line[0] in [' ', '#']:
                # this line is part of a comment or indented block
                # -> ignore
                continue

            if not line.index('#') == line.index(sc):
                # the special comment might not be the first comment
                # -> ignore this line
                continue

            if ' = ' in line:
                idx = line.index(' = ')
                var_str = line[:idx].strip()
                line_flags.assignment = True
                new_line = process_line(line, line_flags, var_str)
                lines.insert(i+1, new_line)
            else:
                # this line is not an assignment
                # -> it is replaced by `display(line)`
                idx = line.index(sc)
                disp_str = line[:idx]
                line_flags.assignment = False
                new_line = process_line(line, line_flags, disp_str)
                lines[i] = new_line

    new_raw_cell = "\n".join(lines)

    return new_raw_cell


def custom_display(lhs, rhs):
    """
    lhs: left hand side
    rhs: right hand side
    
    This function serves to inject the string for the left hand side
    of an assignment
    """
    
    # This code is mainly copied from IPython/display.py
    # (IPython version 2.3.0)
    kwargs = {}
    raw = kwargs.get('raw', False)
    include = kwargs.get('include')
    exclude = kwargs.get('exclude')
    metadata = kwargs.get('metadata')

    from IPython.core.interactiveshell import InteractiveShell
    from IPython.core.displaypub import publish_display_data

    format = InteractiveShell.instance().display_formatter.format
    format_dict, md_dict = format(rhs, include=include, exclude=exclude)
    
    # exampl format_dict (for a sympy expression):
    # {u'image/png': '\x89PNG\r\n\x1a\n\x00 ...\x00\x00IEND\xaeB`\x82',
    #  u'text/latex': '$$- 2 \\pi \\sin{\\left (2 \\pi t \\right )}$$',
    # u'text/plain': u'-2\u22c5\u03c0\u22c5sin(2\u22c5\u03c0\u22c5t)'}
    
    # it is up to IPython which item value is finally used
    
    # now merge the lhs into the dict:
    
    if not isinstance(lhs, str):
        raise TypeError('unexpexted Type for lhs object: %s' %type(lhs))
    
    new_format_dict = {}
    for key, value in list(format_dict.items()):
        if 'text/' in key:
            new_value = lhs+' := '+value
            new_format_dict[key] = new_value
        else:
            # this happens e.g. for mime-type (i.e. key) 'image/png'
            new_format_dict = format_dict
            
    # legacy IPython 2.x support
    if IPython.__version__.startswith('2.'):
        publish_display_data('display', new_format_dict, md_dict)
    else:
        # indeed, I dont know with which version the api changed
        # but it does not really matter (for me)
        publish_display_data(data=new_format_dict, metadata=md_dict)


def load_ipython_extension(ip):

    def new_run_cell(self, raw_cell, *args, **kwargs):

        new_raw_cell = insert_disp_lines(raw_cell)

        if 0:
            #debug
            print("cell:")
            print(raw_cell)
            print("new_cell:")
            print(new_raw_cell)

        ip.old_run_cell(new_raw_cell, *args, **kwargs)

    # prevent unwanted overwriting when the extension is reloaded
    if not 'new_run_cell' in str(ip.run_cell):
        ip.old_run_cell = ip.run_cell
        
    ip.run_cell = types.MethodType(new_run_cell, ip)
    ip.user_ns['display'] = display
    ip.user_ns['custom_display'] = custom_display

