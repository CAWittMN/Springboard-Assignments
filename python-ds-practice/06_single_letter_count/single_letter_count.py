def single_letter_count(string, letter):
    """How many times doesrun letter appear in word (case-insensitively)?

    >>> single_letter_count('Hello World', 'h')
    1

    >>> single_letter_count('Hello World', 'z')
    0

    >>> single_letter_count("Hello World", 'l')
    3
    """

    count = 0
    for i in string.lower():
        if i == letter.lower():
            count += 1
    return count
