# Intro To Ruby
## Control Flow and Functions

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

We will convert the examples from our
[JavaScript Control Flow lesson](https://github.com/wdi-sf-fall/notes/blob/master/week_01_fundamentals/day_3_intro_to_javascript/dusk_control_flow_and_functions/control_flow.md)

##### If/Else #####

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

##### Loops #####

    i = 0
    while i < 5 do
       puts "i is " + i.to_s
       i += 1
    end

... is the same as ...

    i = 0
    until i == 5 do
       puts "i is " + i.to_s
       i += 1
    end

... is the same as ...

    5.times do |i|
       puts "i is #{i}"
    end

    # Will _all_ print out:
    # >i is 0
    # >i is 1
    # >i is 2
    # >i is 3
    # >i is 4

##### Iterating through Arrays #####

    foods = ["carrots", "kale", "beets"]
    foods.each do |vegetable|
        puts "i like #{vegetable}"
    end

... is the same as ...

    for veg in ["carrots", "kale", "beets"] do
        puts "i like #{veg}"
    end

    # Will _each_ print out:
    # >i like carrots
    # >i like kale
    # >i like beets

##### Iterating through Hashes #####

    car = {wheels: 4,doors: 2,seats: 5}
    car.each do |key, num|
      puts "my car has #{num} #{key}"
    end

    # Will print out:
    # my car has 4 wheels
    # my car has 2 doors
    # my car has 5 seats

### Functions

#### Javascript

* Function
    * anonymous: `function (param1, [..param2, [...]]){...}`,
    * named: `function Name(param1, [..param2, [...]]){...}`
    * uses lexical scope
    * used as values
    * require explicit return
    * all `params` are optional

### Ruby

* Function
    * uses `def`
    * does not capture scope
    * not used as values
    * optional parameters must be specified
    * implicitly returns last evaluation

#### Examples

Convert several examples from our
[JavaScript Functions lesson](https://github.com/wdi-sf-fall/notes/blob/master/week_01_fundamentals/day_3_intro_to_javascript/dusk_control_flow_and_functions/functions.md#javascript-functions)

##### Syntax #####

    def say_hello
        puts "Hello, World!"
    end

    say_hello()

... is the same as ...

    def say_hello
        puts "Hello, World!"
    end

    # note missing parentheses
    say_hello

In Ruby, leaving the `()` off of a function call is acceptable. Since
functions can't be passed as values (i.e., aren't first-class), Ruby
knows that we mean to call the function, so it calls it.

##### Parameters (Arguments) #####

    def say_hello(friend)
        puts "Hello, #{friend}!"
    end
    say_hello("Tim")

... is the same as ...

    def say_hello(friend)
        puts "Hello, #{friend}!"
    end
    # note the lack of parentheses
    say_hello "Tim"

##### Return Values #####

    def add(num1, num2)
        return num1 + num2
    end
    sum = add(2, 3)
    puts "2 + 3 = #{sum}"

... is the same as ...

    def add(num1, num2)
        # note the lack of explicit return
        num1 + num2
    end
    sum = add(2, 3)
    puts "2 + 3 = #{sum}"

Ruby will automatically return the value of the last evaluated
expression.  This is called having "implicit returns". You are free to
have an explicit return statement, but you don't have to.

### Input / Output

You've already seen how `puts` will output information to the screen.
What if we want to accept user input? Let's try `gets`.

    puts "Enter your name:"
    you = gets
    puts "Enter a friend's name:"
    friend = gets
    puts "Hello, #{friend}. #{you} says hi."

    # Outputs
    # Enter your name:
    # Tim
    # Enter a friend's name:
    # Bob
    # Hello, Bob
    # . Tim
    #  says hi.

That almost works as we want, but `gets` is reading in the newline
character from when we pressed the Enter key. Generally, when reading
user input we want to `chomp` the data. (See
http://www.ruby-doc.org/docs/Tutorial/part_02/user_input.html)

    puts "Enter your name:"
    you = gets.chomp
    puts "Enter a friend's name:"
    friend = gets.chomp
    puts "Hello, #{friend}. #{you} says hi."

    # Enter your name:
    # Tim
    # Enter a friend's name:
    # Frank
    # Hello, Frank. Tim says hi.

Much better. Now the unnecessary newlines are removed, thanks to `chomp`.
