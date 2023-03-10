def same_frequency(num1, num2):
    """Do these nums have same frequencies of digits?

    >>> same_frequency(551122, 221515)
    True

    >>> same_frequency(321142, 3212215)
    False

    >>> same_frequency(1212, 2211)
    True
    """
    num1_freq = {}
    num2_freq = {}
    for num in str(num1):
        num1_freq[num] = num1_freq.get(num, 0) + 1
    for num in str(num2):
        num2_freq[num] = num2_freq.get(num, 0) + 1
    return num1_freq == num2_freq
