# PERL REVIEW - Concepts Refresher

This directory contains review exercises covering Perl data structures, regular expressions, and algorithm implementation.

## Files

### `Dept_tax.pl`
Processes a list of employees. Filters those with a salary greater than 50,000, calculates a 10% tax, and constructs a new list of employee records with tax details.

### `Detect.pl`
Identifies duplicate elements in an array and reports their indices.
- Input: `["a","b","a","c","b"]`
- Output shows positions of `a` and `b`.

### `count_word.pl`
Counts the frequency of each character in a given string (e.g., 'w3resource') and prints the result as a dictionary.

### `dep_regex.pl`
Uses extended regular expressions with comments (`/x` modifier) to validate and parse a user identifier string in the format `username@department.company`. Extracts and prints the components if valid.

### `marks.pl`
Sorts a hash of subject scores in descending numerical order of the scores and converts the data into a list of tuples `[Subject, Score]`.
