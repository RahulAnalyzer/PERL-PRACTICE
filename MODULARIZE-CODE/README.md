# MODULARIZE-CODE - Writing Custom Perl Modules

This directory demonstrates the power of **Modular Programming** in Perl. Instead of writing monolithic scripts, we break code into reusable `.pm` (Perl Module) files. This promotes code reuse, maintainability, and testing.

## Core Concepts

### 1. What is a Perl Module?
A module is a distinct namespace defined in a separate file ending in `.pm`. It encapsulates variables and subroutines so they don't collide with other parts of your program.
- **Convention**: A module named `My::FileUtils` must be saved as `My/FileUtils.pm` relative to the include path.

### 2. The `package` Keyword
The `package` keyword declares the namespace.
```perl
package My::FileUtils;
```
Everything declared after this (lexical variables `my`, subroutines) belongs to `My::FileUtils`.

### 3. Exporting Symbols (`Exporter`)
To make subroutines available to the script that uses the module, we inherit from the core `Exporter` module.
- **`@ISA`**: "Is A". Sets up inheritance. `our @ISA = qw(Exporter);`
- **`@EXPORT_OK`**: Lists symbols that *can* be exported if explicitly requested (Recommended).
- **`@EXPORT`**: Lists symbols exported by default (Use partially).

```perl
use parent 'Exporter';
our @EXPORT_OK = qw(read_json write_json);
```

### 4. Importing Modules (`use lib`)
Perl looks for modules in the directories listed in `@INC`. Since our local `lib` folder isn't in the global `@INC`, we use the `lib` pragma along with `FindBin` to find it relative to the script.
```perl
use FindBin qw($Bin);
use lib "$Bin/../lib";  # Add ../lib to search path
use My::FileUtils qw(read_json); # Import the function
```

## Directory Structure Breakdown

### `lib/` (The Library)
This is where the logic lives.
- **`lib/my/FileUtils.pm`**: A general utility module.
  - *Functions*: `read_json`, `write_json`.
  - *Concept*: Encapsulates file I/O and JSON parsing (using `JSON::PP` or similar).

### `PL-SCRIPT/` (The Application)
These are the consumers of the modules.
- **`read_json.pl`**: Demonstrates importing a function to read configuration data.
- **`countLog.pl`**: Uses `logUtils` to process server logs, showing how logic is separated from execution.

### `DATA/`
Separation of concerns: Code (`lib`, `PL-SCRIPT`) is kept separate from Data (`.json`, `.log`).
