# Object-Oriented Programming (OOP) in Perl

This directory provides a deep dive into implementing Object-Oriented Programming (OOP) paradigms using Perl. Unlike languages with rigid class structures (like Java), Perl manages objects using its flexible reference system and package namespaces.

## Core Concepts

### 1. The Class (`package`)
In Perl, a **class** is simply a `package`. It provides a namespace for variables and subroutines (methods).
```perl
package BankAccount;
```

### 2. The Constructor (`new`)
There is no special constructor keyword. By convention, we use a subroutine named `new`. It acts as a static method that:
1. Receives the class name (`$class`).
2. Creates a hash reference to store attributes.
3. **Blesses** the reference into the class using `bless`, turning a simple data structure into an object.
```perl
sub new {
    my ($class, %args) = @_;
    my $self = {
        owner   => $args{owner},
        balance => $args{balance} || 0,
    };
    bless $self, $class; # The magic happens here
    return $self;
}
```

### 3. Key OOP Principles

#### Encapsulation
Encapsulation bundles data (attributes) and methods (behaviors) into a single unit. In our examples (see `ENCAPSULATION/`), we demonstrate how to use **accessor methods** (getters and setters) to control access to object data, rather than accessing the `$self->{key}` hash directly.

#### Inheritance
Perl supports inheritance via the special `@ISA` array or the `use parent` pragma. This allows a child class to inherit methods from a parent class.
- **Example**: `SavingsAccount` inherits from `BankAccount`.
- **Mechanism**: If a method isn't found in the current package, Perl searches through the packages listed in `@ISA`.

#### Polymorphism
Polymorphism allows different classes to be treated as instances of the same general class through method overriding. A child class can provide a specific implementation of a method defined in its parent.

#### Abstraction
Abstraction hides complex implementation details. We define clear interfaces (methods) for the user, while the internal logic (like database connections or complex calculations) remains hidden within the module.

## Directory Breakdown

- **`BASIC-OOPS/`**: Foundational implementation.
  - **`BankAccount.pm`**: A complete class demonstrating constructor, attributes, and methods (`deposit`, `withdraw`).
  - **`Student.pm`**: Shows object creation and attribute management.
- **`ENCAPSULATION/`**: modifying data visibility and safe access.
- **`INHERITANCE/`**: Extending classes using `use parent`.
- **`POLYMORPHISM/`**: Overriding methods to change behavior in subclasses.
