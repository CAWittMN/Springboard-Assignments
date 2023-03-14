"""Word Finder: finds random words from a dictionary."""
import random


class WordFinder:
    """Machine for getting random words from a file
    >>> finder = WordFinder("test.txt")
    5 words read

    Attributes:
    ------------
    words: lst of str
        the list of words generated from the provided file

    >>> finder.random() in ["One", "Two", "Three", "Four", "Five"]
    True

    >>> finder.random() in ["One", "Two", "Three", "Four", "Five"]
    True

    >>> finder.random() in ["One", "Two", "Three", "Four", "Five"]
    True

    >>> finder.random() in ["One", "Two", "Three", "Four", "Five"]
    True

    >>> finder.random() in ["One", "Two", "Three", "Four", "Five"]
    True
    """

    def __init__(self, file_path) -> None:
        """Read the file, call to make the words list, tells num of words in the list"""
        word_file = open(file_path)
        self.words = self.make_word_list(word_file)
        print(f"{len(self.words)} words read")

    def __repr__(self) -> str:
        """represents the number of words currently usable"""
        return f"""WordFinder
        number of words = {len(self.words)}
        """

    def make_word_list(self, file):
        """create a list of every word from the provided file"""
        return [word.strip() for word in file]

    def random(self):
        """get a random word from the list"""
        return random.choice(self.words)
