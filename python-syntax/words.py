def print_upper_words(words):
    """Print each word on a separate line and all uppercase

    For example:
    
      print_upper_words(["big", "bag", "bug", "bog", "beg"])
      
    Should print:

      "BIG"
      "BAG"
      "BUG"
      "BOG"
      "BEG"
      """
    for word in words:
        print(word.upper())



def print_upper_words_e(words):
    
    """Print each word that starts with the letter e (or E) and all uppercase"""

    for word in words:
        if word.startswith('e') or word.startswith('E'):
            print(word.upper())


def print_upper_words_with(words, start_letters):

    """Print each word that starts with a chosen letter and all uppercase"""

    for word in words:
        for letter in start_letters:
            if word.startswith(letter):
                print(word.upper())




print_upper_words(["big", "bag", "bug", "bog","beg"])

print_upper_words_e(["big", "egg", "bug", "bog","Egg"])

print_upper_words_with(["big", "egg", "Hug", "kog","Egg"], ['b', "H"])
