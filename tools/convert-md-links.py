#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# This script solves the following problem:
# the doc files are written in markdown and contain references to other .md files.
# Theses links play nicely with github. However when the .md files are converted to
# html the link targets should also change from .md to .html
# Except those links which refer to a github page

# We use regular expressions for this 

import sys
import re


from ipHelp import IPS
fname = sys.argv[1]

#print("called with", fname)


with open(fname, 'r') as txtfile:
    txt = txtfile.read()


# match everything, which matches XXX in `href="XXX.md"`, but ensure that XXX does not start with `http`
# here we use non greedy quantifyer (*?) and negative lookahead
# see https://docs.python.org/3/howto/regex.html#greedy-versus-non-greedy
# and http://www.regextester.com/15

r = re.compile(r'href="(?!http).*?.md"', re.M)
res = set(r.findall(txt))

# iterate over the results and replace XXX.md by XXX.html
# this is certainly not very efficient but its simple and fast enough
for orig in res:
    
    new = orig.replace('.md"', '.html"')
    txt = txt.replace(orig, new)

with open(fname, 'w') as txtfile:
        txtfile.write(txt)
