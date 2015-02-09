# Ruby in the context of building a web app

## Objectives

* Understand the purpose of the web application framework sinatra
* Solidify some ruby concepts in the process, on an as-needed basis
    * Rubygems
    * Basic ruby objects: 
        * [String](http://www.ruby-doc.org/core-2.2.0/String.html)
        * [Fixnum](http://www.ruby-doc.org/core-2.2.0/Fixnum.html)
        * [Array](http://www.ruby-doc.org/core-2.2.0/Array.html)
        * [Hash](http://www.ruby-doc.org/core-2.2.0/Hash.html)
    * Fundmanetal ruby control flow structures

## A review of the HTTP GET verb

Request-Response

## Exercise: Sinatra takes the stage to say "Hello" and to say something wise

```
$ gem install sinatra # what is a gem and what is gem install?
$ cd your_wdi_exercises_directory
$ mkdir sinatra_takes_the_stage
$ touch sinatra_takes_the_stage/app.rb
$ subl sinatra_takes_the_stage/
```

In `sinatra_takes_the_stage/app.rb`:

```
require 'sinatra'

# our application's routes
get '/hi' do
  "Hi, I am Frank!"
end

get '/quote' do
  "The best is yet to come and won't that be fine."
end

```

Then:

```
$ ruby sinatra_takes_the_stage/app.rb
```

Finally:

Fire up your browser to [http://localhost:4567/hi](http://localhost:4567/hi) and then navigate to [http://localhost:4567/quote](http://localhost:4567/quote). 

Now try modifying the greeting inside the `get '/hi' do` block and refreshing the browser at [http://localhost:4567/hi](http://localhost:4567/hi)

What happens?

## Reloading the application on changes

Install sinatra-contrib

```
$ gem install sinatra-contrib
```

Require sinatra-reloader

```
require 'sinatra/reloader'
```

## Sinatra response fundamental piece of info:

* A response may either be a string, must respond to `.to_str` (a [blog post](http://jvans1.github.io/blog/2013/01/11/to-s/) about it), or must respond to `.each` (enumerable).

## Let's add a parameter to our routes

This parameter should be a tag, that will return sinatra quotes matching that tag (that's in the afternoon)

```
# app.rb

require 'sinatra'
require 'sinatra/reloader'

# our application's routes
get '/hi' do
  "Hi, I am Frank!"
end

# return quotes matching a tag
get '/quote/:tag' do
  "You've requested a quote for tag: '#{params[:tag]}'"
end

# default /quote route
get '/quote' do
  "The best is yet to come and won't that be fine."
end
```

## Let's cause an error

```
# app.rb

require 'sinatra'
require 'sinatra/reloader'

# our application's routes
get '/hi' do
  "Hi, I am Frank!"
end

# return quotes matching a tag
get '/quote/:tag' do
  # raise an error unless the tag is 'life'
  # because sinatra had some good life lessons for us all
  raise "tag must not be anything but 'life'" if params[:tag] != 'life'
  "You've requested a quote for tag: '#{params[:tag]}'"
end

# default /quote route
get '/quote' do
  "The best is yet to come and won't that be fine."
end
```

Now visit any url of the form `http://localhost:4567/quote/asdf` where asdf is anything but `life`.

So this is cool, but let's do better, [better errors](https://github.com/charliesome/better_errors).

## Afternoon lab: 

* With a partner, write the rest of the `get '/quote/:tag'` route to return sinatra quotes based on the tag. 

* Use [Frank Sinatra Quotes](http://www.goodreads.com/author/quotes/220471.Frank_Sinatra)

* Think about what native ruby object you may want to use to store and quickly retrieve multiple quotes based on a tag.

## Afternoon lab refactor:

* Let's write our own ruby class and move some functionality therein

I'll get you started:

```
# greeter.rb

class Greeter
  def greet
  end
  
  def quote(tag)
  end
end
```

```
# app.rb

require 'sinatra'
require 'sinatra/reloader'

require './greeter'

# before filter
before do
  @greeter = Greeter.new
end

# our application's routes
get '/hi' do
  @greeter.greet
end

# return quotes matching a tag
get '/quote/:tag' do
  raise "tag must not be anything but 'life'" if params[:tag] != 'life'
  @greeter.quote params[:tag]
end

# default /quote route
get '/quote' do
  @greeter.quote
end
```

Your job for the rest of the day is:

* Move your code from `app.rb` into `greeter.rb` as necessary
* Bonus: 
    * Have the `get /quote/:tag` route return a random quote from each category
    * [figure out](http://www.sinatrarb.com/intro.html#Sending%20Files) how to load static files in a sinatra app, and then load a random sinatra photo for the route `get /photo`. Add a class to the `Greeter` class to generate the random photo's path
        * **Note**: You'll have to find a stackoverflow post to help you figure out how to serve these photos, because sinatra won't load the photos from `public` directory by default. 