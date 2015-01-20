# The Browser Environment

## The Console as a REPL

### Basic expressions

* Numbers
  * [Arithmetic Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators#Arithmetic_operators)
    * `+, -, *, /, %, -, ++, --`
* Strings
  * [String Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators#String_operators)
* [Data Type Coercion](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Values,_variables,_and_literals#Data_type_conversion)
* Multiline-expressions

#### Quick exercises

* Write an expresssion in the console which returns your age via all five basic arithmetic
  operators, string concatenation, and data type coercion

Clear the console with `Ctrl+l`

### The Global Object and its properties 

In the browser, the global object is referenced as `window`.

#### A quick pause for `this`: 

Type `this === window` in your terminal
What is the value of `this` by default?

#### Some native objects
##### String
##### Number
##### Math
##### Date
##### Boolean
##### Array
##### Function

##### [Exhaustive list](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects#Standard_objects_(by_category))

#### Some Browser Host Objects

##### [Window](https://developer.mozilla.org/en-US/docs/Web/API/Window)
##### [Document](https://developer.mozilla.org/en-US/docs/Web/API/document)
##### [Event](https://developer.mozilla.org/en-US/docs/Web/API/Event)
##### [HTMLElement](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement)
##### [XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest)

### Room Stand-Up Question: If you think the `window` object is a global object stand up, or if it's a host object remain sitting.

## The Developer Tools - Your Biggest Friend in the Browser

### Sources Tab and Snippets

### Sources
### Snippets
### Breakpoints
### Call stack
#### The (anonymous function)
#### Scope Variables
#### Let's declare a variable and reference a value
#### Let's do the same with an expression

##### Room Stand-Up Question: If you think you need to use `var` to declare variables, stand up, otherwise remain sitting.

##### Let's talk about the importance of the `var` keyword.
