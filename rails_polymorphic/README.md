# Polymorphic Associations

What is polymorphism in programming?

> Polymorphism - the provision of a single interface to entities of different types 
> 
> -[Bjarne Stroustrup](Bjarne Stroustrup)

How does this apply to the world of Rails?

What if you wanted to create associations, for example a `belongs_to`-`has_many` association, or a `belongs_to`-`has_one` association, such that *multiple entities* in your schema may be associated with the *same single* entity type? How would you do it?

## Examples of the concept in the wild:

* Think about how Facebook implements `Comments` on `Photos`, `Videos`, `Notes`, etc. The `Comments` work in the same exact way across all of those different entities. 

* How there are `Photos` of `Users`, photos of `Places`, etc. In that case, it doesn’t matter that they are photos of users or photos of places - photos are photos are photos.

With [Polymorphic Associations](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations) this is possible and awesome!

## Pre-reading/Watching

* [Active Record Associations: Polymorphic Associations](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations)
* [Polymorphic Associations Railscast](https://www.youtube.com/watch?v=07TAJkev9ow)
* [Polymorphic Associations with ActiveRecord](http://www.thoughtsonrails.com/polymorphic-associations-with-active-record/)

