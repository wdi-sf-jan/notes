#Javascript Constructors

Before we examine constructors, let's review. There are a few different ways to create objects.

**Object Literal Notation**

```
// Object Literal notation uses `var` and `:`
var instructor = {
  name: "Elie",
  age: 26
}

// Or (notice the use of the keyword "new")
var instructor = new Object()

instructor.name = "Elie"
instructor.age = 26
```

## Intro to Classes and Constructors

Imagine you're an architect and you're tasked with designing a blueprint for a house (which will be used to build 25 similar looking houses). If we assume that every house has a number of square feet, bathrooms and bedrooms we can model this with a few objects.

```
var house1 = {
  sqFeet: 3000,
  bathrooms: 3
  bedrooms: 2
}
var house2 = {
  sqFeet: 4000,
  bathrooms: 3.5
  bedrooms: 2
}
var house3 = {
  sqFeet: 1000,
  bathrooms: 2
  bedrooms: 1
}
var house4 = {
  sqFeet: 13000,
  bathrooms: 3.5
  bedrooms: 7
}
```

Unfortunately, this is not very efficient. We've created 4 houses and already it's taken almost 20 lines of code. Fortunately we can create a class as our "blueprint" and then create objects based off of that. To create a class in JavaScript, we can use a constructor function.

**Constructor Notation**

We can use a constructor function to create multiple objects that share the same properties.

Using our previous example we create a constructor function like this:

```
function House(sqFeet, bathrooms, bedrooms) {
  this.sqFeet = sqFeet;
  this.bathrooms = bathrooms;
  this.bedrooms = bedrooms;
}
```

Notice our use of the keyword `this`. Since we don't know what the value for the parameters will be, we use `this` as a placeholder and when we call this function, we add in our values. To create an object using a constructor function, we use the `new` keyword. Here is an example of how we would create our four houses using a constructor function and the `new` keyword:

```
var house1 = new House(3000, 3, 2)
var house2 = new House(4000, 3.5, 2)
var house3 = new House(1000, 2, 1)
var house4 = new House(13000, 3.5, 7)
```

Let's look at another example and a different way to write a constructor function.

```
var Person = function(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.fullName = function () {
    return ("Hello" + firstName + " " + lastName)
  }
}

// This can also be written as:

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.fullName = function () {
    return ("Hello" + firstName + " " + lastName)
  }
}
```

What's the difference between these two? In short, The difference is that `var Person = function(){}` is defined at run-time (which means that if we were to call it before defining it we would get an error), whereas `function Person(){}` is defined at parse-time (which means that if we were to call it before defining it we would __not__ get an error). For example:

You can read more about the difference [here](http://stackoverflow.com/questions/336859/var-functionname-function-vs-function-functionname)

Let's now take a look

```
var elie = new Person("Elie", "Schoppik");

console.log(elie.firstName);
console.log(elie.lastName);
console.log(elie.fullName());
```

Using the `new` keyword, Javascript does a few things.

 * Creates a new object
 * Sets the `constructor` property to the object Person
 You can use x.constructor to get a direct reference to the object, but it's an anonymous function so there's no way of getting its name.

### Pitfalls

* When using the constructor, don't try to call a constructor without the `new` keyword.

* Always make sure the keyword `this` is on the left hand side:

* `this.taco = taco`

* `return` statements in a constructor does not do anything

====

### Testing our Constructors:

When using mocha to test our constructors include this code to create a new instance of our class in your spec/test.js file:

```
var elie;

// create a new Person each time 
 beforeEach(function(){
    elie = new Person('Elie', 'Schoppik');
  });
```

## Prototypes

One of the more complex concepts in JavaScript to wrap your head around is the idea of a Prototype. You can think of a Prototype as the building block for your object (and remember that everything in JavaScript is an object). For any object you create, you can attach methods and properties to it's prototype. So in our constructor functions, we can attach methods and properties to the prototype so that every object we create from it will have these properties and methods! 

But wait a second....how is the prototype different than just adding a method to the constructor function? Let's examine these two pieces of code

* Attaching a method to the constructor function:

```
function Person(name){
	this.name = name
	this.sayHi = function(){
		alert("Hi " + this.name)
	}
}

var elie = new Person("Elie")
elie.sayHi()
```

* Attaching a method to the prototype:
 
```
function Person(name){
	this.name = name
}

Person.prototype.sayHi = function() {
	alert("Hi " + this.name)
}

var elie = new Person("Elie")
elie.sayHi()
```

So...these both work, but how are they different, and which one is better? The answer is the second one, here's why:

* When we attach methods to the constructor function, these methods are written each time a new instance of the object is created, which is a waste of memory. By attaching the method to the prototype, we only have to declare it once. The example version saves memory because there is only one instance of the function instead of a separate function for each object.



Let's now take this a step further - how is it that an Array has the methods (length, map, forEach and so many more)? How does every object have a toString() or hasOwnProperty method? The answer is, that these methods are part of that object's Prototype. Even further, Objects can inherit properties and methods from other objects (that's how the Boolean and Number object have the toString() method.) - the answer to this question will be explored more when we discuss inheritance.
