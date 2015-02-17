# Ruby OOP

## Objectives

* Understand the purposes of OOP
* Practice by refactoring non-OOP code from the weekend lab

## Variable scope

### Today's focus
* **Local variables**
* **Instance variables**

### Other variable scopes:
* Class variables (tsk tsk)
* Global variables (tsk tsk)
* Constants
* Block scope

## self

The current object

## Class methods

Generally these are methods intended to not be specific to every instance, but rather performing operations on some subset of the set of all instances of the class

## Instance methods

Methods intended to perform operations on a specific instance

## Instance variables (IVars)

Variables intended to maintain the private state of an object

## Getters/Readers

Methods intended to get the values of IVars (but, may be more complex)

### attr_reader

## Setters/Writers

Methods intended to set the values of IVars (but, may be more complex)

### attr_writer

## Getts & Setters

### attr_accessor

## Inheritance

Taking the functionality of one class and using it in another

## Public, Private, Protected methods

* **Public**: Accessible to anyone.* **Protected**: Can be invoked only by objects of the defining class and its subclasses.* **Private**: Private methods therefore can be called in the defining class and by that class’s descendents and ancestors, but only within the same object. 
