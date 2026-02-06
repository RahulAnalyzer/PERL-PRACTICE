# FILE HANDLING - I/O Operations in Perl

This directory explains how Perl interacts with the File System. File handling is a critical skill for scripting, data processing, and automation. Use this guide to understand different modes and techniques.

## Core Concepts

### 1. File Handles
A **File Handle** is a connection between your Perl script and the outside world (a file).
- Conventionally written in uppercase (e.g., `FH`, `LOGFILE`), though lexical scalars (`$fh`) are preferred in modern Perl.
- **`open` Function**: `open(my $fh, "<", "filename.txt")`
  - Returns true on success, false on failure. Always check with `or die $!`.

### 2. File Modes
Perl supports several modes for opening files, similar to C or shell redirection:
- **Read (`<`)**: Opens existing file for reading. Cursor at start.
- **Write (`>`)**: Opens file for writing. **Truncates** (clears) file if it exists. Creates if missing.
- **Append (`>>`)**: Opens file for writing. Cursor at end. Retains existing data.
- **Read/Write (`+<`)**: Read and write without truncation.
- **Read/Write Truncate (`+>`)**: Read and write, but wipes file first.

### 3. Reading Methods
- **Line-by-line**: `while (<$fh>) { ... }`. Best for memory.
- **Slurp (Whole file)**: `my @lines = <$fh>;`. Good for small files.

## Files Guide

### `fileOpen.pl` & `Open_existingFile.pl`
Basic examples of opening files in Write (`>`) and Read (`<`) modes.
- *Tip*: Always close your handles with `close $fh` when done.

### `Appeding_file.pl`
Demonstrates safely adding log entries or data to the end of a file using `>>`.

### `ReadAndWrite.pl`
Shows how to update a file in place using `+<`. This is complex because writing overwrites bytes at the current cursor position.

### `IO_in_Sub.pl`
**Best Practice**: Encapsulate file logic in subroutines (`read_file`, `write_file`) to handle errors and paths consistently across your application.
