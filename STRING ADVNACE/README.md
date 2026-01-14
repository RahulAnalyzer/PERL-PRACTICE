# STRING ADVANCE - Regex and String Manipulation

This directory contains advanced string processing scripts using Perl's powerful regular expressions.

## Files

### `Department_Greeting_Generator.pl`
Formats user input for Name and Department by trimming whitespace and capitalizing words, then generates a standard greeting.

### `Email_Validate.pl`
Validates if a given email address follows standard formatting rules using regular expressions.

### `Filename_Normalizer.pl`
Sanitizes filenames by:
- Converting to lowercase.
- Replacing spaces and illegal characters with underscores.
- Collapsing multiple underscores.
- Ensuring the `.txt` extension.

### `Normalise_id.pl`
Extracts and normalizes product IDs from input text. Converts formats like `prod-123` into a standardized `PROD-123` format.

### `PhoneNumber_Validator.pl`
Checks if a phone number matches specific valid patterns (e.g., international codes, dashes).

### `clean_csv_text.pl`
Cleans raw CSV text by:
- Removing special characters.
- Normalizing spacing around commas.
- Removing empty fields.
- Trimming leading/trailing whitespace.

### `extract_keywords.pl`
Scans a text (e.g., a resume) for a list of provided keywords and returns the unique matches found.

### `extract_url_parts.pl`
Parses a URL to extract the Base URL (scheme + domain) and the Path using regular expressions.

### `rle_compress.pl`
Implements Run-Length Encoding (RLE) compression. Converts strings like `aaabb` into `a3b2`.
