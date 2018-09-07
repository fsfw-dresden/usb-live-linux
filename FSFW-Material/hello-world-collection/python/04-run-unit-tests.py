
# this module is part of the standard library
import unittest

# import our own module (which we want to test) from the current directory

import module_to_be_tested as m


# create a class which is a child of TestCase
class AllMyTests(unittest.TestCase):
    """
    Each method of this class which starts with `test_` will be run
    automatically by the function `unittest.main()` (see below).
    """

    def test_square1(self):
        # test some known results
        self.assertEqual(m.square(0), 0)
        self.assertEqual(m.square(1), 1)
        self.assertEqual(m.square(2), 4)
        self.assertEqual(m.square(5), 25)
        self.assertEqual(m.square(20), 400)

        # also test some negative examples
        self.assertEqual(m.square(-1), 1)
        self.assertEqual(m.square(-5), 25)


        # and even complex numbers
        self.assertEqual(m.square(-1j), -1)

    def test_square2(self):
        # test error behavior

        with self.assertRaises(TypeError) as cm:
                m.square("some string")

        with self.assertRaises(TypeError) as cm:
                m.square([1, 3])

    # uncomment the following line to make the test-suite failing
    @unittest.expectedFailure
    def test_buggy_square(self):
        # test error behavior

      self.assertEqual(m.buggy_square(5), 25)


def mymainfunction():

    # the following call automatically creates an instance of each class in
    # this module which starts with `Test` and runs every method which
    # starts with `test_`

    unittest.main()

# ensure that the main function is only run if this module is executed
# as script (an not imported elsewhere).
if __name__ == "__main__":
    mymainfunction()
