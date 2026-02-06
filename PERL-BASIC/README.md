# PERL BASIC - The Fundamentals

This directory is the starting point for your Perl journey. It covers the syntax, data types, and control structures that form the backbone of the language.

## Core Concepts

### 1. Variables and Data Types
Perl has three primary data types, distinguished by their "sigil" (symbol):
- **Scalars (`$`)**: Single values (numbers, strings).
  - `$name = "Rahul"`, `$age = 25`.
- **Arrays (`@`)**: Ordered lists of scalars.
  - `@colors = ("red", "green", "blue")`.
  - Access: `$colors[0]` (Note the `$` because one element is a scalar).
- **Hashes (`%`)**: Unordered key-value pairs.
  - `%stats = (age => 25, city => "Delhi")`.
  - Access: `$stats{city}`.

### 2. Context (Scalar vs List)
Perl is context-sensitive. The same code behaves differently depending on what is expected.
- **Scalar Context**: `my $count = @array;` (Returns the size of the array).
- **List Context**: `my @copy = @array;` (Copies the elements).

### 3. Control Structures
- **Conditionals**: `if`, `elsif`, `else`, `unless` (opposite of if).
- **Loops**:
  - `for` (C-style): `for (my $i=0; $i<10; $i++)`.
  - `foreach` (Perl-style): `foreach my $item (@items)`.
  - `while` / `until`.

## Script Highlights

### `BASIC_PERL.pl`
Your cheat sheet. It demonstrates:
- String concatenation (`.`).
- Array slicing (`@array[1..3]`).
- Hash slicing (`@hash{'key1', 'key2'}`).
- Input from user (`<STDIN>` + `chomp` to remove newline).

### `PERL_QUESTIONS_SOLUTION_DAY1.pl`
Solutions to common beginner problems.
- **GCD Calculation**: Implements Euclid's algorithm.
- **Prime Check**: Validates if a number is prime using the square root optimization.
