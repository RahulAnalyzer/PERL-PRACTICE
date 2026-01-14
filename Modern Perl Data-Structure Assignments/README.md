# Modern Perl Data-Structure Assignments

This directory focuses on advanced data structures in Perl, such as complex hashes, arrays of arrays, and data transformation techniques.

## Files

### `Category_wise_Sales.pl`
Aggregates sales data by category. Reads a flat list of category-amount pairs and sums the amounts for each category using a hash.

### `Customer_list_cleaner.pl`
Filters user input to create a clean list of customers. Removes empty or undefined entries using `grep`.

### `Departement_Employee_Aggregator.pl`
Organizes employees into departments.
- Input: A list of `[Department, Employee]` pairs.
- Output: A hash where keys are departments and values are arrays of employees.

### `Immutable_coordinate_structure.pl`
Demonstrates simple data unpacking. Reads X, Y, Z coordinates into an array and unpacks them into individual variables.

### `Product_Price_Mapper.pl`
Maps two corresponding lists (Product Names and Product Prices) into a single hash for easy lookup (`Product => Price`). Includes validation for equal array lengths.

### `Region_Deduplication.pl`
Removes duplicate region names from a list using a hash to track seen items.

### `list_of_list.pl`
Transforms valid structure data:
- Input: A list of headers and a list of rows (arrays).
- Output: A list of hashes, where each hash represents a row with keys from the headers.
