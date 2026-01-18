# FILE HANDLING - Perl I/O Operations

This directory explores various file handling mechanisms in Perl, including reading, writing, appending, and using different file modes.

## Files

### `Appeding_file.pl`
Demonstrates how to append data to an existing file using the append mode (`>>`), ensuring new content is added to the end without deleting existing data.

### `IO_in_Sub.pl`
Shows how to encapsulate file I/O operations within subroutines for better code modularity. Includes a function to read a file and return its content.

### `Open_existingFile.pl`
A simple script to open an existing file in read mode (`<`) and print its content line by line.

### `ReadAndWrite.pl`
Illustrates the read/write mode (`+<`), which allows both reading and writing to a file without truncating it initially. Finds the end of the file to append data.

### `ReadAndWriteTruncate.pl`
Demonstrates the read/write mode with truncation (`+>`). This mode wipes the file content upon opening but allows subsequent reading and writing.

### `Write_edit_file.pl`
Focuses on writing to a file using the write mode (`>`), which overwrites existing content. Also includes reading operations.

### `fileOpen.pl`
A basic script to create a new file and write text into it using the write mode (`>`).

## Subdirectories

### `ADVANCE_CONCEPT`
Contains scripts demonstrating advanced file handling concepts such as atomic writes, file locking, file test operators, and efficient large file processing.
