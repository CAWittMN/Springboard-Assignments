def single_letter_count(phrase, letter):
    """How many times doesrun letter appear in word (case-insensitively)?

    >>> single_letter_count('Hello World', 'h')
    1

    >>> single_letter_count('Hello World', 'z')
    0

    >>> single_letter_count("Hello World", 'l')
    3
    """
    return phrase.lower().count(letter.lower())
