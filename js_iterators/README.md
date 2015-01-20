Iterators
=========

Objectives
---------

* Utilize built-in methods for common array operations
* Understand the benefits of these methods compared to `for` loops
* Discuss the idea of _functional programming_

What are iterators?
-------------------

Iterators are functions that act as replacements for `for`
loops. We can use these functions to perform common Array operations
for us.

What might we want to with an array?

- run some piece of logic on each item
- create a new array with each item being slightly transformed
- filter the array to contain only a subset of items
- combine all the items in some fashion
- detect if there's at least one of something in the array
- detect if all of the items meet some condition

We could accomplish all of this using `for` loops, but writing `for`
loops is error prone and tedious. JavaScript provides iterator
functions for some of the more common operations. They are called
(respectively):

- [forEach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
- [map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
- [filter](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)
- [reduce](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)
- [some](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some)
- [every](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every)

forEach
-------

`forEach` is the replacement for your standard `for` loop.  You can
take the body from your `for` loop, wrap it in a function, and pass
that argument to `forEach`. Let's look at an example:

```
var friends = ["Peter", "Tim", "Alex", "Myla", "Elie"];

// old way, with a for loop
for (var i = 0; i < friends.length; i++) {
    console.log("Hello, " + friends[i] + "!");
}

// cool new way, with the .forEach iterator
friends.forEach(function (buddy) {
    console.log("Hello, " + buddy + "!");
});

// both output the same thing
// > Hello, Peter!
// > Hello, Tim!
// > Hello, Alex!
// > Hello, Myla!
// > Hello, Elie!
```

__Try it__

Use the `.forEach` iterator to loop over the following
array of foods and say you like them.

```
var foods = ["pizza", "tacos", "ice cream"];

// your code here

// The output should be
// > "I like pizza"
// > "I like tacos"
// > "I like ice cream"
```

map
---

Sometimes we want to loop over an array and build a new array in the
process. This is what `map` helps us solve. It is like `forEach`, but
it __returns__ the new array that is created.

```
var names = ["tim", "myla", "elie", "peter"];

// old way with for loop
var upperCased = [];
for (var i = 0; i < names.length; i++) {
  upperCased.push(names[i].toUpperCase());
}
console.log(upperCased);

// new way with `map`
var upperCased = names.map(function (person) {
  return person.toUpperCase();
});
console.log(upperCased);

// Should output
// > ["TIM", "MYLA", "ELIE", "PETER"]
// > ["TIM", "MYLA", "ELIE", "PETER"]
```

filter
------

Filter is an iterator that loops through your array and filters it
down to a subset of the original array. A callback is called on each
element of the original array: if it returns true, then the element is
included in the new array, otherwise it is excluded.

```
var names = ["tim", "myla", "elie", "peter"];

var isEven = function (name) {
  return name.length % 2 === 0;
};
var isOdd = function (name) {
  return name.length % 2 !== 0;
};

var evenLengthNames = names.filter(isEven);
var oddLengthNames = names.filter(isOdd);

console.log(evenLengthNames);
console.log(oddLengthNames);

// Should output
// > ["myla", "elie"]
// > ["tim", "peter"]
```

reduce
------

Reduce iterates over an array and converts it into one, accumulated
value. In some other languages it is called `fold`. I like to imagine
the game 2048 as it reduces, or folds up, several smaller blocks into
fewer, bigger blocks.

```
var nums = [1,2,3,4];
var add = function (a, b) {
  return a + b;
};

var sum = nums.reduce(add);
console.log(sum);

// Should output:
// > 10
// which is, 1 + 2 + 3 + 4
```

Reduce also usually accepts an optional third parameter that will be the
initial accumulated value. If it is omitted, then the reduction starts
with the first two values in the array.

```
var nums = [1,2,3,4];
var add = function (a, b) {
  return a + b;
};

var sum = nums.reduce(add, 10);
console.log(sum);

// Should output:
// > 20
// which is, 10 + 1 + 2 + 3 + 4
```

some & every
------------

`some` will run through an array and return true if at least one
element meets a condition. `every` will return true only if all of the
elements in the array meet the condition.

```
var isOdd = function (num) {
  return num % 2 !== 0;
};
[1,2,3].some(isOdd);
=> true
[1,2,3].every(isOdd);
=> false
```

References
----------

- [Reducing Filter and Map Down to Reduce](http://www.elijahmanor.com/reducing-filter-and-map-down-to-reduce/)
