# Afternoon problem solving exercises:

* [You Can't Code Under Pressure](http://www.codewars.com/kata/you-cant-code-under-pressure-number-1)
* [2 + 2 * 2 Problem](http://www.codewars.com/kata/2-plus-2-star-2-problem)

# Our Own Objects, Functions, and Basic Control Flow

## Why Objects?

### Encapsulation
### State

## Making our own

### Object literal notation

```
var teacher = {
  firstName: 'Alex',
  lastName: 'Notov'
}
```

### Exercise:

Spend a few minutes and with your partner construct student objects in
a snippet in your browser, containing each others' first and last names,
and add a `fromCity` property, which should contain the city your
partner is from

After you're done, discuss with your partner some limitations of Object
literal notations to share with the rest of the class. Also note what's
nice about this notation.

### What if we wanted to have a template for making objects?

#### Enter functions

Let's make a constructor that will build Teacher objects.

```
function Teacher(first, last) {
  this.first = first;
  this.last = last;
}
```

And, let's make a new Teacher, let's say Elie!

```
var elie = new Teacher('Elie', 'Schoppik');
```

Without knowing too much more about constructors, objects, or functions,
modify the Teacher constructor, so that teachers may be made with the
name of the class that they teach. Take a crack at it.

Now let's dissect what we just did.

#### What if we had an array that looked like this:

```
var staff = [
  'Alex,Notov|WDI|teacher',
  'Elie,Schoppik|WDI|teacher',
  'Tim,Licata|WDI|teacher',
  'Myla,Baker|WDI|DiR',
  'Peter,Schulz|WDI|DiR'
];
```

What if we wanted to make a constructor for objects that would be called
`StaffMember` that could make staff members? And what if we wanted to
loop over that array of staff members, and for each of them, we wanted
to make a staff member.

#### Break out into groups and figure out the parts of this problem.

What are the discrete steps that you'll have to take to solve it?

Let's discuss each step.

#### Review arrays

#### Review the String.prototype.split function

### Functions, more broadly

Let's take a step back from functions that make/construct objects, and visit functions, that perform discrete operations, but we'll certainly come back to constructors, in no time. 

#### Used to perform operations
#### Don't have to be used to construct objects at all


An age calculator:

Forget how old you are? Calculate it.

- Write a function called `calculateAge` that:
	- Takes 2 arguments: birth year, current year
	- Calculates the age based on the years
	- Outputs the result to the screen like so: "You are NN years old."
		- This needs to use `console.log` to output to the screen.
- Call the function three times with different sets of values.
- Bonus: Figure out how to get the current year in JavaScript instead of passing it in.

### [Your lab for today](https://github.com/wdi-sf-jan/functions-lab)