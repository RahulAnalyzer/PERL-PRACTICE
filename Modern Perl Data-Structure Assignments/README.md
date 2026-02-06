# Modern Perl Data Structures

This directory focuses on **Complex Data Structures** (references). Real-world applications rarely use simple arrays or hashes; they use "Arrays of Arrays" or "Hashes of Hashes".

## Core Concepts

### 1. References
A reference is a scalar that points to another data type (like a pointer in C).
- Create a reference using backslash `\`: `my $ref = \@array;`.
- **Anonymous Reference**:
  - Array Ref: `my $aref = [1, 2, 3];` (Square brackets).
  - Hash Ref: `my $href = { name => 'A', val => 1 };` (Curly braces).

### 2. Dereferencing
To get the data back from a reference:
- arrow operator `->`: `$aref->[0]` or `$href->{key}`.
- sigil wrapper: `@$aref` (to get the whole array).

### 3. List of Lists (LoL) -> `list_of_list.pl`
A table-like structure.
```perl
my @matrix = (
    [1, 2, 3],
    [4, 5, 6]
);
print $matrix[1]->[0]; # Prints 4
```

### 4. Hash Transformations
- **`Category_wise_Sales.pl`**: Grouping data.
  - Logic: Iterate through a flat list, use the category as the Hash key, and accumulate values.
  - `$sales{$category} += $amount;`

## Script Highlights

### `Departement_Employee_Aggregator.pl`
Converts a flat list of `[Dept, Employee]` into a hierarchical structure:
```perl
{
    'IT'  => ['Alice', 'Riya'],
    'HR'  => ['Bob']
}
```
This is essential for organizing data for reports or API responses.

### `Immutable_coordinate_structure.pl`
Perl doesn't have native "structs", but we can use anonymous arrays to group x, y, z coordinates and treat them as a single scalar unit.
