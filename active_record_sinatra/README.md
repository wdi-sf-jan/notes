ActiveRecord (in Sinatra)
==========================

Goals
-----

- Define and understand the role of an ORM.
- Discuss ActiveRecord, Models, and Migrations.
- Integrate ActiveRecord into a Sinatra webapp.

Where have we been?
-------------------

We've used Sinatra to create web applications. We've seen how SQL can
be used to interact with our database. We've written SQL from within
our Ruby code. Yesterday we wrote our own ORM by refactoring the Squad
lab into having Squad and Student models.

Where are we going?
-------------------

Today we let ActiveRecord handle most of the work we did
yesterday. Rails comes with a built-in
[ORM](http://en.wikipedia.org/wiki/Object-relational_mapping)
called
[ActiveRecord](https://github.com/rails/rails/tree/master/activerecord).
As we work our way from Sinatra to Rails, a good way to prepare will
be by getting familiar with ActiveRecord ahead of time.

ORM
---

__Object-relational mapping__. In other words, a tool to convert
between Objects in our programming language and Relational Tables in
our database. The goal of an ORM is to help us avoid writing SQL in
our programs. Instead, we should let our Objects take care of
persisting themselves to the database.

Active Record
-------------

[ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html)
is an implementation of the more general
[active record pattern](http://en.wikipedia.org/wiki/Active_record_pattern)
coined by
[Martin Fowler](http://en.wikipedia.org/wiki/Martin_Fowler). It is
mostly known for being the ORM included with Rails, but we can also
use it on its own in our Sinatra applications.

Active Record Migrations
------------------------

Once you have ActiveRecord setup with Sinatra (and once we move into
Rails and have ActiveRecord automatically available to us) there are
many tools available to help with managing your database.

- `rake -T` will list all of the available `rake` tasks.
- `rake db:create` will create the database for you app.
- `rake db:create_migration NAME=<name>` will create a new migration
file.

Migration files are stored along with your source code and describe
the changes to your database over time.  You can create tables, drop
tables, add columns, remove columns, add constraints, remove
constraints, etc.

[Active Record Migrations](http://guides.rubyonrails.org/active_record_migrations.html)

Active Record Models
--------------------

Yesterday we created our own Models, `squad.rb` and `student.rb`. We
implemented all of our own ORM methods (`.all`, `.create`, `.find`,
`.destroy`, etc). ActiveRecord implement all of these methods for us
if we have our model classes inherit from `ActiveRecord::Base`.

```ruby
class Product < ActiveRecord::Base
end
```

[Creating Active Record Models](http://guides.rubyonrails.org/active_record_basics.html#creating-active-record-models)

Active Record CRUD Methods
--------------------------

You'll find that ActiveRecord provide all the methods we worked on yesterday:

[CRUD: Reading and Writing Data](http://guides.rubyonrails.org/active_record_basics.html#crud-reading-and-writing-data)

In-class Exercise
-----------------

[https://github.com/wdi-sf-jan/snack_exercise](https://github.com/wdi-sf-jan/snack_exercise)

Lab
---

[https://github.com/wdi-sf-jan/music_lab](https://github.com/wdi-sf-jan/music_lab)

To complete the lab, you may want to consult:

- These very notes.
- The notes in the README.md of the in-class exercise.
- The code we wrote for the in-class exercise.
- The resources below (and any others you like).

Resources
---------

- [RailsGuides: Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html)
- [Active Record - Object-relational mapping in Rails](https://github.com/rails/rails/tree/master/activerecord)
- [GitHub page for sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
- [Sinatra: Building an ActiveRecord and Postgres application](http://www.millwoodonline.co.uk/blog/sinatra-activerecord-postgres-application)
- [Active Record Migrations](http://guides.rubyonrails.org/active_record_migrations.html)
