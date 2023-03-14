"""Python serial number generator."""


class SerialGenerator:
    """Machine to create unique incrementing serial numbers.

    Attributes
    -----------
    start_point: int
        the provided starting point for the generator that can be reset to
    curr_serial: int
        the current serial that will be generated

    >>> serial = SerialGenerator(start=100)

    >>> serial.generate()
    100

    >>> serial.generate()
    101

    >>> serial.generate()
    102

    >>> serial.reset()

    >>> serial.generate()
    100
    """

    def __init__(self, start=0) -> None:
        """Make a new generator instance starting at provided start"""
        if isinstance(start, int):
            self.start_point = start
            self.curr_serial = start
        else:
            raise ValueError("Value needs to be an integer")

    def __repr__(self) -> str:
        """print representation"""
        return f"""SerialGenerator
        start_point = {self.start_point} 
        curr_serial = {self.curr_serial}"""

    def generate(self):
        """Generate the next serial"""
        self.curr_serial += 1
        return self.curr_serial - 1

    def reset(self):
        """Reset the generator to the original start"""
        self.curr_serial = self.start_point
