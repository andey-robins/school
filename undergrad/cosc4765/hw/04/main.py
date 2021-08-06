import re
import string
import math

def main():
    # get and clean input
    text = input("Input some text: ")
    text = re.sub(r'[^\w\s]', '', text.lower().replace(" ", ""))

    frequency = {}
    alphabet = []
    # frequency pulled from the link provided on wyocourses
    masterFrequency = {
        'e': 12.02,
        't': 9.10,
        'a': 8.12,
        'o': 7.68,
        'i': 7.31,
        'n': 6.95,
        's': 6.28,
        'r': 6.02,
        'h': 5.92,
        'd': 4.32,
        'l': 3.98,
        'u': 2.88,
        'c': 2.71,
        'm': 2.61,
        'f': 2.30,
        'y': 2.11,
        'w': 2.09,
        'g': 2.03,
        'p': 1.82,
        'b': 1.49,
        'v': 1.11,
        'k': 0.69,
        'x': 0.17,
        'q': 0.11,
        'j': 0.10,
        'z': 0.07
    }
    # counts pulled for calculating standard error
    masterCount = {
        'e': 21912,
        't': 16587,
        'a': 14810,
        'o': 14003,
        'i': 13318,
        'n': 12666,
        's': 11450,
        'r': 10977,
        'h': 10795,
        'd': 7874,
        'l': 7253,
        'u': 5246,
        'c': 4943,
        'm': 4761,
        'f': 4200,
        'y': 3853,
        'w': 3819,
        'g': 3693,
        'p': 3316,
        'b': 2715,
        'v': 2019,
        'k': 1257,
        'x': 315,
        'q': 205,
        'j': 188,
        'z': 128
    }

    # setup frequency dictionary w/ 0 counts
    for letter in string.ascii_lowercase:
        frequency[letter] = 0

    # count the number of each letter in the input text
    for char in text:
        frequency[char] += 1

    # variables for calculating standard error
    entries = len(text)
    average = entries / 26
    standardDeviation = 0

    # calculate standard deviation 
    for letter in string.ascii_lowercase:
        standardDeviation += math.pow(frequency[letter] - average, 2)

    # finish standard error calculations
    standardDeviation = math.sqrt((1 / 26) * standardDeviation)
    standardError = standardDeviation / math.sqrt(entries)

    # display results
    print("\n\nLetters with frequency different from the average.\nListed alphabetically; input frequency -- average frequency\n-------------------------------------")
    for letter in string.ascii_lowercase:
        frequency[letter] = (frequency[letter] / len(text)) * 100

        if abs(frequency[letter] - masterFrequency[letter]) > standardError:
            print(letter + " " + str(frequency[letter]) + " -- " + str(masterFrequency[letter]))

if __name__ == "__main__":
    main()