from wordfinder import WordFinder


class SpecialWordFinder(WordFinder):
    """Special word finder that excludes blank lines and #

    Attributes:
    ------------
    words: lst of str
        the list of words generated from the provided file

    >>> spec_finder = SpecialWordFinder("sptest.txt")
    4 words read

    >>> spec_finder.random() in ["Lab", "Pitty", "Regular", "Other"]
    True

    >>> spec_finder.random() in ["Lab", "Pitty", "Regular", "Other"]
    True

    >>> spec_finder.random() in ["Lab", "Pitty", "Regular", "Other"]
    True

    >>> spec_finder.random() in ["Lab", "Pitty", "Regular", "Other"]
    True
    """

    def make_word_list(self, file):
        return [
            word.strip() for word in file if word.strip() and not word.startswith("#")
        ]
