#!/usr/bin/python3

import sys
import time
import os

def factorize(num):
    '''Takes a number as input and returns a tuple of two factors if the number is not prime.
    Returns None if the number is prime.
    '''
    for i in range(2, int(num**0.5)+1):
        if num % i == 0:
            return (i, num//i)
    return None

if __name__ == "__main__":
    '''Reads the input file.
    '''
    if len(sys.argv) != 2:
        print("Usage: factors <file>")
        sys.exit(1)

    input_file = sys.argv[1]

    if not os.path.exists(input_file):
        print(f"File not found: {input_file}")
        sys.exit(1)

    try:
        with open(input_file, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print("File not found")
        sys.exit(1)

    start_time = time.time()

    '''loops over each line (which should contain one natural number per line),
        and calls factorize on each number.
        If factorize returns a tuple of factors,
        it prints the factorization in the desired format.
    '''
    for line in lines:
        try:
            num = int(line.strip())
        except ValueError:
            print(f"Invalid input on line: {line.strip()}")
            continue

        factors = factorize(num)
        if factors:
            print(f"{num}={factors[0]}*{factors[1]}")

        '''If the elapsed time exceeds 5 seconds,
            the program exits with an error message.
        '''
        if time.time() - start_time > 5:
            print("Time limit exceeded")
            sys.exit(1)
~                      
