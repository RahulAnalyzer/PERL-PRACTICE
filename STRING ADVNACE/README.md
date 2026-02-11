# STRING ADVANCE - Mastery of Text Processing

Perl is famous for its text processing capabilities. This directory details advanced string manipulation and Regular Expression (Regex) techniques.

## Core Concepts

### 1. Regular Expressions (The Powerhouse)
- **Validation**: Checking if a string matches a pattern (Email, Phone).
  - *Anchors*: `^` (Start), `$` (End).
  - *Character Classes*: `\d` (digit), `\w` (word char), `[a-z]` (range).
  - *Quantifiers*: `+` (one or more), `*` (zero or more), `{n,m}` (range).
- **Extraction**: Using parentheses `()` to capture parts of the string.
  - `$1`, `$2` hold the captured data.

### 2. String Normalization
Data often comes in messy. Normalization makes it consistent.
- **Trimming**: Remove whitespace. `s/^\s+|\s+$//g`.
- **Case Folding**: `lc($str)` or `uc($str)`.
- **Sanitization**: Replacing invalid characters. `tr/a-z0-9/_/c` (Complement: replace anything NOT in a-z0-9 with underscore).

### 3. Run-Length Encoding (`rle_compress.pl`)
A simple compression algorithm suitable for strings with many repeated characters.
- **Logic**: `AAAAABBB` -> `A5B3`.
- **Regex Method**: `s/(.)\1+/$1 . length($&)/ge`.
  - Backreference `\1` finds the repeat.
  - `/e` modifier executes code in the replacement part.

## Script Highlights

### `extract_url_parts.pl`
Parses URLs without using a heavy module.
- **Regex**: `m{^(https?://[^/]+)(/.*)?$}`
  - Splits the Protocol+Domain from the Path.

### `clean_csv_text.pl`
Demonstrates how to clean a raw text file to prepare it for CSV parsing, fixing common human errors like extra spaces around commas.
