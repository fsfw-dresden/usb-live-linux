# This example shows how curves can be plotted and an annotation can be written.
# source: http://matplotlib.org/examples/text_labels_and_annotations/text_demo_fontdict.html
# many more nice plotting examples: http://matplotlib.org/gallery.html



"""
=======================================================
Controlling style of text and labels using a dictionary
=======================================================

This example shows how to share parameters across many text objects and labels
by creating a dictionary of options passed across several functions.
"""

import numpy as np
import matplotlib.pyplot as plt


# this is optional: use latex for font-rendering
plt.rcParams['text.usetex'] = True


# define a dictionary with some font options

font = {'family': 'serif',
        'color':  'darkred',
        'weight': 'normal',
        'size': 16,
        }

font2 = {'family': 'serif',
        'color':  'darkblue',
        'weight': 'normal',
        'size': 12,
        }


# do the calculation

x = np.linspace(0.0, 5.0, 500)
y = np.cos(2*np.pi*x) * np.exp(-x)

# the rest is for plotting

plt.plot(x, y, 'k')
plt.title('Damped exponential decay', fontdict=font)
plt.text(1.3, 0.65, r'$\cos(2 \pi t) \exp(-t)$', fontdict=font)
plt.text(1.3, 0.85, r'Hello World. I like functions.', fontdict=font)

publicity_text = 'If you are interested in\n' \
                 'scientific computing with python\n' \
                 'see http://www.tu-dresden.de/pythonkurs'
plt.text(1.3, 0.3, publicity_text, fontdict=font2)
plt.xlabel('time (s)', fontdict=font)
plt.ylabel('voltage (mV)', fontdict=font)

# Tweak spacing to prevent clipping of ylabel
plt.subplots_adjust(left=0.15)

# save as vector graphics (png also possible)
plt.savefig('02-plot-result.pdf')
plt.show()
