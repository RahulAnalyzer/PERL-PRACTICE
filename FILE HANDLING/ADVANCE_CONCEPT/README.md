# Advance File Handling Concepts

This directory covers professional-grade file handling techniques required for robust applications, including locking, cleaning, and binary processing.

## Core Concepts

### 1. File Locking (`flock`)
When multiple scripts try to write to the same file simultaneously, data corruption occurs.
- **Solution**: `flock($fh, LOCK_EX)` obtains an *exclusive* lock before writing. Other processes wait until the lock is released.
- **Usage**: See `File_lock.pl`.

### 2. Atomic Writes
To prevent reading a half-written file, we use **Atomic Writes**.
- **Technique**: Write to a temporary file (`file.tmp`), then `rename()` it to the final name (`file.txt`). The rename operation is supported by the OS as atomic (instantaneous).
- **Usage**: See `AtomicWrite.pl`.

### 3. File Test Operators
Perl allows you to check file attributes before opening:
- `-e`: Exists?
- `-s`: Not empty? (Returns size)
- `-d`: Is it a directory?
- **Usage**: `die "File missing" unless -e $file;` (See `FileHandle_Operators.pl`).

### 4. CSV Processing (`Text::CSV`)
Parsing CSVs with regex is error-prone (escaped commas, quotes). Always use `Text::CSV`.
- **Validation**: See `AutoCleanScript.pl` for schema-based validation.
- **Cleaning**: See `CleaningMessyCSV.pl` for handling bad encoding or whitespace.

## Script Highlights

### `AutoCleanScript.pl`
A production-ready script that enforces a **Data Schema**.
- Defines expected columns, types, and regex rules.
- Automatically attempts to fix common errors (like comma misuse).
- Generates `_clean` and `_reject` files for audit trails.

### `LogAnalysis.pl`
Demonstrates efficient log parsing. Instead of loading the whole file, it reads line-by-line and uses regex with the `/g` modifier to count keywords like `ERROR` or `WARN` instantly.

### `LargeFile.pl`
Handling files larger than RAM (e.g., GBs).
- **Chunked Reading**: Uses `read($fh, $buffer, 4096)` to read exactly 4KB at a time, keeping memory usage constant.
