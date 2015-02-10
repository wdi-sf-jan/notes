# Ruby
## Control Flow, Functions, and Iterators

### Control flow

#### Javascript ([Some Control Flow Structures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Statements))

* Conditionals
    * `if`, `else if`, `else`, ...
* Loops
    * `while`,  `for`, `for...in`, ...
* Iterators,
    * `.forEach`, `.map`, `.filter`, ...

#### Ruby ([Some Control Flow Structures](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Control_Structures))

* Conditionals
    * `if`, `elsif`, `else`, `unless`, ...
* Loops
    * `until`, `while`, `times` ...
* iterators,
    * `.each`, `.map`, `.select`, ...

#### Examples

##### If/Else #####

```ruby
course = "wdi"
if course == "uxdi"
    puts "Hello, User Experience Designer!"
elsif course == "fewd"
    puts "Hello, Front-End Developer"
elsif course == "wdi"
    puts "Hello, Immersed Student"
else
    puts "Who are you?"
end
```

##### Loops #####

```ruby
i = 0
while i < 5 do
   puts "i is " + i.to_s
   i += 1
end
```
... is the same as ...

```ruby
i = 0
until i == 5 do
   puts "i is " + i.to_s
   i += 1
end
```
... is the same as ...

```ruby
5.times do |i|
   puts "i is #{i}"
end

# Will _all_ print out:
# >i is 0
# >i is 1
# >i is 2
# >i is 3
# >i is 4
```
##### Iterating through Arrays #####

```ruby
foods = ["carrots", "kale", "beets"]
foods.each do |vegetable|
    puts "i like #{vegetable}"
end
```
... is the same as ...

```ruby
for veg in ["carrots", "kale", "beets"] do
    puts "i like #{veg}"
end

# Will _each_ print out:
# >i like carrots
# >i like kale
# >i like beets
```
##### Iterating through Hashes #####

```ruby
car = {wheels: 4,doors: 2,seats: 5}
car.each do |key, num|
  puts "my car has #{num} #{key}"
end

# Will print out:
# my car has 4 wheels
# my car has 2 doors
# my car has 5 seats
```
### Functions

#### Javascript

* Function
    * anonymous: `function (param1, [..param2, [...]]){...}`,
    * named: `function Name(param1, [..param2, [...]]){...}`
    * uses lexical scope
    * used as values
    * require explicit `return`
    * all params are optional

### Ruby

* Function
    * uses `def`
    * does not capture scope
    * not used as values
    * optional parameters must be specified
    * implicitly `return`s last evaluation

#### Examples

Convert several examples of JavaScript functions into the equivalent
Ruby.


##### Syntax #####

JavaScript:

```javascript
var sayHello = function () {
    console.log("Hello, World!");
};

sayHello();
```

Ruby:

```ruby
def say_hello
    puts "Hello, World!"
end

say_hello()
```

... is the same as ...

```ruby
def say_hello
    puts "Hello, World!"
end

# note missing parentheses
say_hello
```

In Ruby, leaving the `()` off of a function call is acceptable. Since
functions can't be passed as values (i.e., aren't first-class), Ruby
knows that we mean to call the function, so it calls it.

##### Parameters (Arguments) #####

JavaScript:

```javascript
var sayHello = function (friend) {
    console.log("Hello, " + friend + "!");
};
sayHello("Tim");
```

Ruby:

```ruby
def say_hello(friend)
    puts "Hello, #{friend}!"
end
say_hello("Tim")
```

... is the same as ...

```ruby
def say_hello(friend)
    puts "Hello, #{friend}!"
end
# note the lack of parentheses
say_hello "Tim"
```

##### Return Values #####

JavaScript:

```javascript
var add = function (num1, num2) {
    return num1 + num2;
};
var sum = add(2, 3);
console.log("2 + 3 = " + sum);
```

Ruby:

```ruby
def add(num1, num2)
    return num1 + num2
end
sum = add(2, 3)
puts "2 + 3 = #{sum}"
```

... is the same as ...

```ruby
def add(num1, num2)
    # note the lack of explicit return
    num1 + num2
end
sum = add(2, 3)
puts "2 + 3 = #{sum}"
```

Ruby will automatically return the value of the last evaluated
expression.  This is called having "implicit returns". You are free to
have an explicit return statement, but you don't have to.

... and finally ...

```ruby
def add num1, num2
    num1 + num2
end
sum = add 2, 3
puts "2 + 3 = #{sum}"
```

### Iterators

Ruby has many / all of the iterator methods you've grown to
love. Sometimes they even have fun new names.

[Map](http://www.ruby-doc.org/core-2.2.0/Array.html#method-i-map)
(i.e., [Collect](http://ruby-doc.org/core-2.2.0/Enumerable.html#method-i-collect))

```ruby
[1,2,3].map do |num|
    num * 5
end

[1,2,3].collect do |num|
    num * 5
end

# both return [5,10,15]
```

Filter (i.e., [Select](http://www.ruby-doc.org/core-2.2.0/Array.html#method-i-select))

```ruby
[1,2,3].select do |num|
    num % 2 == 0
end
# returns [2]
```

[Reduce](http://ruby-doc.org/core-2.2.0/Enumerable.html#method-i-reduce)
(i.e.,
[Inject](http://ruby-doc.org/core-2.2.0/Enumerable.html#method-i-inject))

```ruby
[1,2,3].reduce do |totalSoFar, num|
    totalSoFar + num
end
# returns 6

["tim", "bob", "frank"].inject do |jumbledMess, name|
    jumbledMess.concat(name)
end
# returns "timbobfrank"
```
