## Intro to Rails

Two principles of Rails

1. DRY - keep your code DRY and use concice, conistent code.
2. Convention over configuration - Rails is built using sensible defaults which speeds development and means that there is less code to maintain. All we have to do is specify unconventional aspects if we choose.

Rails uses an __MVC__ architectures

<b>M</b>odel - The model refers to the data objects that we use. It's the object oriented approach to design. The data in our database will be the most common type of object that we'll put there.

<b>V</b>iew - The view is the Presentation layer. It's what the user sees and interacts with, essentially the web pages. The HTML, the CSS and the JavaScript. The controller processes and responds to user events, such as clicking on links and submitting forms. 

<b>C</b>ontroller - The controller will make decisions based on the request and then control what happens in response. It controls the interaction with our models and with our views. 

![MVC Diagram](http://elibildner.files.wordpress.com/2012/06/screen-shot-2012-06-05-at-2-12-18-am.png)

### How to create a rails project

``` rails new NAME_OF_APP```

to create a new project without the Rails testing framework and with a database (rails defaults to sqlite)
``` rails new NAME_OF_APP -T -d DB_TYPE```

But then it says, bundle install at the end, so, it's created all the files, and now it's telling bundler to install all of the gems that might be missing. 

### Bundler

Bundler is a separate gem from Rails, and can be used outside of
Rails, but Rails is going to depend on it to manage the RubyGems that
our application needs. The first thing that you need to know is that
there are two files that matter to bundler - Gemfile and Gemfile.lock.
Look at Gemfile. This contains configuration information about what
gems we want to load. And, specifically, what version of gems as well.
This might look similar to the package.json file from our Node/Express
days.

Bundler is going to sort all of those out for us, and it's going to
create a tree of gems that it ought to load with all the dependencies
that ought to be loaded with it. And, after it creates that list, or
manifest file, it's going to store it in Gemfile.lock. We can take a
look at that file as well. You'll see, it looks very similar in
content, but the format is very different.

You never want to edit Gemfile.lock yourself. That's Bundler's file to
put its results in. Gemfile is the one that you'll edit. Now, how do
you tell Bundler to take your Gemfile and turn it into Gemfile.lock?
Well, with one simple command: `bundle install`. You'll remember that
when we created our rails application at the end of the process, it
ran Bundle Install for us.


bundle exec - run this before rake db:migrate if you're having issues

### Start a server

`rails server`

or the equivalent but shorter:

`rails s`

This will start a server on localhost:3000

## Experiment

- create a new rails app using -d postgresql
- run `rails server` and see what happens

- we need to edit something in our config file! Go to database.yml
- see that it is using NAMEOFAPP_development so we need to fix that
- how do we do that? `createdb NAMEOFAPP_development` or `rake db:create`

- when this is done try rails server again and look at the app

Let's add the better_errors gem

You have to put any gem you want to use in your Gemfile. You have to run bundle anytime you change your Gemfile. Your rails server needs to be restarted after any changes to your Gemfile.

## Create a controller and view

- `rails generate controller demo index`
- add "Hello, World!" in the erb page

- now how do we get to this page? What do we need? A route!
- go to routes.rb see that we have a /demo/index
- start the server and go to demo/index to see hello world!

## Rails File Structure

![Rails File Structure](http://i.imgur.com/whOL4DQ.png)

- most important directory - APP
	- models, views, controllers are all in here
	- helpers is where you put helper code for views
	- mailers - for sending emails
	- assets -> where we put static files
- bin 
	- bundle, rails, rake our binary files
- config
	- set config files for routes, db and environments
- db
	- store code related to db - Migrations go here!
- gemfile/gemfile lock
- lib 
- log
- public - simple html files here (anything here will be visible to the publuc)
- test for testing
- tmp - temp files for rails to store stuff
- vendor - much less used because of gems

## Routing

- in routes.rb we include our routing (very similar to app.js in express)

- simple route or match route
	- get `"/demos/index"`
	- the same as `match "demos/index", to: "demos#index", via: :get`
		
- standard route with controller
	- `get '/demos', to: "demos#index"`

- root route

root `to: 'demo#index'`
or 
root `"demo#index"`

- remember, routes in Rails are like express in that they start from the top and go to bottom

## Rendering templates

- in controller add 

```
def hello
end
```
Always check out the terminal for request/response!

## Redirect

```
def other_hello
	
	# redirect_to(:controller =>'demo', :action => 'index')
	
	redirect_to 'demo/index'
end
```

## Template file names

name.html.erb

- Template name: name
- Process with: ERb
- Output format: HTML

## Instance varialbes for data into our views

- inside a controller action include
	```
	@taco = "Hello instance taco!"
	@array = [1,2,3]
	```


## Misc

If you want to change the port number

Quick solution:`rails server -p 8080`

Longer solution: 

Append to Rakefile

task :server do
  `bundle exec rails s -p 8080`
end

then run rake server










