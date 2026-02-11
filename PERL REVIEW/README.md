# PERL REVIEW - Code Concepts Refresher

This directory serves as a practice ground for reviewing essential Perl features, particularly Data Structures and Regex.

## Core Concepts

### 1. Complex Data Structures
Perl allows nesting of data structures (Hash of Arrays, Array of Hashes).
- **Array of Hashes (`Dept_tax.pl`)**:
  ```perl
  my @employees = (
      { name => "Alice", salary => 60000 }, # Anonymous Hash Ref
      { name => "Bob",   salary => 45000 }
  );
  ```
  - Accessing: `$employees[0]->{salary}`.
  - *Concept*: Useful for representing database rows or CSV records.

### 2. Hash Sorting (`marks.pl`)
Hashes are unordered. To "sort a hash," we actually sort the **keys** based on the **values**.
- **Code**: `sort { $hash{$b} <=> $hash{$a} } keys %hash`
- **Explanation**: The block `{}` defines the comparison logic. Here, it compares values in descending numeric order (`<=>`).

### 3. Extended Regex (`dep_regex.pl`)
For complex patterns, we use the `/x` modifier. It allows us to add whitespace and comments *inside* the regex for readability.
```perl
m/
  ^          # Start
  (\w+)      # Capture Username
  @
  ([\w.]+)   # Capture Domain
/x;
```

## Script Highlights

### `Detect.pl`
Finds duplicates in an array.
- *Logic*: Iterates through the array, using a Hash to track seen items. If an item exists in the hash, it's a duplicate.

### `count_word.pl`
Frequency analysis.
- *Technique*: `$count{$char}++`.
- This simple line initializes the key if missing (to 0) and increments it, building a histogram of characters.
