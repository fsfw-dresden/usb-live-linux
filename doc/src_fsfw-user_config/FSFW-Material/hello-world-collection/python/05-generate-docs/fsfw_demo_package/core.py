
"""
This is a test module
"""


class ABC(object):
    """
    This is a dummy class.
    Each method of this class which starts with `test_` will be run
    automatically by the function `unittest.main()` (see below).
    """

    def __init__(self, a, b):
        """
        The constructor method.

        :param a: something (object)
        :param b: something else (int or float)


        # nothing to do ...

        pass

    def do_important_things(self, x, y=0, name="FSFW"):
        """
        Method for performing important calculation. See [1] for details.


        :param x: special number (int)
        :param y: additional number (float)
        :param name: the name of something (str)
        :rtype: First three positive integers (list)

        [1]: Ostrom, Elinor; Hess, Charlotte (2007).
        Understanding knowledge as a commons: from theory to practice. Cambridge, Massachusetts: MIT Press
        """

        return [1, 2, 3]


    def myfunction(i, j, k):
      """
      A functions that probably does something.

      :param i: number 1 (int)
      :param j: number 2 (float)
      :param k: some string
      :rtype: None

      After description of the parameters typically there is more information
      on the documented function or method.
      """

      pass
