# Relationship types (that we will use frequently)

## One to many

Example:

One Owner `has_many` pets and 
Many Pets `belongs_to` one owner

(FK goes in the pets table)

Always remember - whenever there is a belongs_to in the model, there should be a FK in the matching migration!

In our models we add:

```
Owner
- has_many :pets
Pet
- belongs_to :owner
```

In our pets migration file we can add:

` t.references :owner` or `t.integer :owner_id`

Now in Rails console add some information:

```
fido = Pet.create(name: "Fido")
lassie = Pet.create(name: "Lassie")
elie = Owner.create(name: "Elie")
elie.pets
fido.owner
elie.pets << fido
elie.pets << lassie
elie.pets.size
elie.pets.map(&:name)
elie.pets.each {|x| puts "My pet is named #{x.name}!"}
fido.owner
```

### Exercise 1

Let's go back to our old Amazon example and create two models - Order and Item. Assume that one order can have many items. Here is an outline of what each model should contain

1. Order - name, description
2. Item - name, description

Validate that each order name and item name are never empty. 

If you have modeled this relationship correctly you should be able to assign a variable o = Order.create and then type o.items without an error. You should also be able to assign a variable i = Item.create and then type i.order without an error

Once that's done - create five items and two orders and assign three items to order_id 1 and the remaining two items to order_id 2. Play around with some array methods you know (each, map, select, size) for each order.


## Many to many

Let's take the example of students and courses. A student can take many courses and a course can have many students. We cant have multiple FK's on each course and each student - so we need a join or linker table

Let's create a table called 
In our models we add:

```
rails generate model Student name:string
rails generate model Course name:string
rails generate model Enrollment enrollment_date:date 
```
After we've generated our model let's open up sublime and edit our models and our migration file<br>


__In the model__ 

A course `has_many` enrollments 
A student `has_many` enrollments
An enrollment `belongs_to` student and `belongs_to` course

__In the migration__

Always remember, the foreign keys go in the table that `belongs_to` others - so we put it in the enrollment table

`t.integer :course_id` <br>
`t.integer :student_id`

```
elie = Student.create(name: "Elie")
tim = Student.create(name: "Tim")
del = Student.create(name: "Del")
```
```
algebra = Course.create(name: "Algebra")
science = Course.create(name: "Science")
english = Course.create(name: "English")
french = Course.create(name: "French")
```

```
elie.enrollments.create(enrollment_date: Time.now)
algebra.enrollments.create(enrollment_date: Time.now)
french.enrollments.create(enrollment_date: Time.now)
```

```
enroll1 = Enrollment.find(1)
enroll2 = Enrollment.find(2)
```

```
elie.enrollments << enroll1
elie.enrollments << enroll2
tim.enrollments << enroll2
science.enrollments << enroll1
algebra.enrollments << enroll2
```

```
elie.enrollments
tim.enrollments
algebra.enrollments
```

What happens when you run elie.courses? <br>
What happens when you run science.students?

### Exercise 2

Let's kick Amazon up a notch - it's now your turn to model a many to many relationship! Let's now model the relationship between customers and products

Many customers can buy many products <br>
Many products can be bought by many customers

1. Create 3 models (you can name the third model Sale)
2. Add your FKs to the migration file
3. Play around in Rails console and see if you can add products to a sale, and customers to a sale 

## Many to many - through (skip over the join table)

So in our last example, we were able to add items to the join table, but our models outside the join table had no ability to relate with each other. How can we fix this! The answer involves using has_many through - let's take a look at our course example

Problem - elie.courses failed and science.students failed. We had to go through our enrollments table to find the data for each one.

Solution - in the Course and Student model, make these changes. Our Enrollment model should stay the same.

```
- Course 
has_many :enrollments
has_many :students, :through => :enrollments
- Enrollment 
belongs_to :course, 
belongs_to :student
- Student 
has_many :enrollments 
has_many :courses :through => :enrollments
```

### Exercise 3

Let's add through to our previous example. 


#Less Common Associations

##has_one

* [has_one](http://guides.rubyonrails.org/association_basics.html#the-has-one-association)

Like belongs_to except the foreign key is in the other other table (the same table as it would be for has_many)

##has_one through:

* [has_one through:](http://guides.rubyonrails.org/association_basics.html#the-has-one-through-association)

Like has_many through except it's singular )

##has_and_belongs_to_many

* [has_and_belongs_to_many](http://guides.rubyonrails.org/association_basics.html#has-and-belongs-to-many-association-reference)

This requires a separate migration for the join table, similar to has_many through in many ways except there's no data associated with the join

#Related Notes
* [Associations Docs](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html)

* [Model field data types](http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-column)
