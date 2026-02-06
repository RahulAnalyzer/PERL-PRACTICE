# LOGICS - Algorithmic Thinking in Perl

This directory contains logic-building exercises. It focuses on solving standard algorithmic problems using Perl's syntax, helping to improve problem-solving skills and understanding of data manipulation.

## Core Concepts

### 1. Array Rotation
Rotating an array means shifting its elements.
- **Reversal Algorithm** (`Array_rotation1.pl`):
  1. Reverse the first `d` elements.
  2. Reverse the remaining `N-d` elements.
  3. Reverse the entire array.
  - *Time Complexity*: O(N). *Space*: O(1).
- **Shifting** (`Array_roatation2.pl`): Using `shift` and `push` to physically move elements.

### 2. String Manipulation
- **Palindrome Check**: A string is a palindrome if it reads the same forward and backward.
  - *Technique*: `reverse($str) eq $str`.
- **Keypad Problem** (`keypad.pl`): Simulates old T9 mobile typing.
  - *Logic*: Maps each character to a key and repeats it (e.g., 'c' is on '2', 3rd position -> `222`). Uses Hash Maps for O(1) lookup.

### 3. Mathematical Logic
- **Missing Number**: Given numbers 1 to N with one missing.
  - *Formula*: Sum of 1..N is `N*(N+1)/2`. The missing number is `Expected_Sum - Actual_Sum`.
- **Intersection**: finding common elements (`find_common_str.pl`).
  - *Optimized approach*: Use a **Hash** to store elements of Array A for O(1) lookup when iterating through Array B.

## Script Highlights

### `logic.pl`
A general text processing playground.
- **Counts unique words**: Uses a hash `%seen` where keys are words. `keys %seen` gives the count.
- **Why Hash?**: Hashes handle uniqueness automatically. `$seen{$word} = 1` overwrites duplicates effortlessly.
