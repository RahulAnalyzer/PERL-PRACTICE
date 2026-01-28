# Advance File Handling Concepts

This directory contains Perl scripts demonstrating advanced file handling techniques.

## Files

### `AtomicWrite.pl`
Demonstrates how to perform atomic writes to a file. It writes content to a temporary file (`.tmp`) and then renames it to the target file, ensuring data integrity.

### `AutoCleanScript.pl`
Automates the process of cleaning and validating a CSV file based on an expected column count.

### `CleaningMessyCSV.pl`
Specifically designed to handle messy CSV data by normalizing fields and removing invalid rows.

### `ConfigFile.pl`
Demonstrates how to read and parse a configuration file (e.g., `.conf` or `.ini` style) into a Perl hash.

### `CsvHandling.pl`
General-purpose CSV processing using the `Text::CSV` module for robust reading and writing.

### `CSVMailValidator.pl`
Reads a CSV file containing user data and validates email addresses using regular expressions.

### `csvfile.pl`
Illustrates basic CSV writing operations using the `Text::CSV` module.

### `FileHandle_Operators.pl`
Explores various file test operators in Perl:
- `-e`: Check if file exists.
- `-f`: Check if it's a regular file.
- `-d`: Check if it's a directory.
- `-r`, `-w`, `-x`: Check read, write, and execute permissions.
- `-s`: Check file size.

### `File_lock.pl`
Shows how to use `flock` to manage file locking for safe concurrent access:
- **Shared Lock (`LOCK_SH`)**: For reading safely (multiple readers allowed).
- **Exclusive Lock (`LOCK_EX`)**: For writing safely (only one writer allowed).

### `Full_Perl_File.pl`
A comprehensive script using subroutines to perform basic file operations: Create, Write, Read, and Append.

### `LargeFile.pl`
Demonstrates efficient methods for handling large files:
- **Line-by-line reading**: Safe for memory.
- **Chunked reading**: Reads fixed-size blocks (e.g., 4KB) using `read()`, suitable for binary or very large text files.

### `LogAnalysis.pl`
Parses log files to count occurrences of different log levels like ERROR, WARN, and INFO.

### `ParticularFolderFileStore.pl`
Takes user input for a filename and content, then creates and manipulates the file within a specific directory (`FILE HANDLING/TEXT`).

### `RegexFile.pl`
Demonstrates how to use regular expressions while reading files to extract matching lines or perform transformations.

### `User_Input_file.pl`
Similar to the above, but creates the file in the current directory based on user input for filename and content.

## Subdirectories

### `JSON_TYPE`
Scripts for parsing, merging, and writing JSON files using the `JSON` module.

### `XML_TYPE`
Scripts for reading, modifying, and converting XML files using modules like `XML::LibXML` or `XML::Simple`.
