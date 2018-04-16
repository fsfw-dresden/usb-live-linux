# This script (or better this module) demonstrates how to use unit tests.
# It is not intended to be run directly but rather to be imported by the
# Test script (04-run-unit-tests).




def square(n):
    """
    Dummy function that calculates simple things.
    """
    result = n**2
    return result


def buggy_square(n):
    # the following line causes an error
    a = 1/0
    result = n**2
    return result
