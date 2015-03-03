JSON APIs in Rails
==================

Acronyms
--------

- AJAX
- JSON
- API

Remember the AJAX
-----------------

- What is AJAX?
- Have we seen examples?
    - GitHub Image viewer
    - [Space Station tracker](http://iss.astroviewer.net/)
- Sample
```javascript
$.getJSON("test.json", {name:"John", time:"2pm"}, function(data) {
  console.log("JSON Data: ", data);
});
```

Never forget the JSON
---------------------

- What is JSON?
- What is it used for?
- How do you pronounce it?

Recall the API
--------------

- What is an API?
- Have we seen examples?
    - GitHub, Space Station, Yelp, etc.

Rails can call other APIs
-------------------------

[Typhoeus](https://github.com/typhoeus/typhoeus) is a gem that allows
Ruby to make HTTP requests to web servers. It also allows you to make
several requests in parallel, but we'll be ignoring that feature for
now. Some basic steps to use it are:

Include it in your `Gemfile`:

```ruby
gem "typhoeus"
```

Make an HTTP request to an API, possibly from within a controller:

```ruby
request = Typhoeus::Request.new(
  "www.example.com",
  method: :get,
  params: {s: "True Grit"}
)
request.run
puts "body of the response is #{request.response.body}"
```

When the response comes back, it's body will be a string. Most of the
time, you'll want to convert the data into a more useful Ruby data
structure. If the data is JSON, you may want to look into Ruby's
[JSON module](http://ruby-doc.org//stdlib-2.0/libdoc/json/rdoc/JSON.html).

Rails knows JSON APIs
---------------------

You can make your own JSON API in Rails. The following is a normal
`index` method that will list all the people in the database. In
addition to responding with HTML as we're used to, we can also respond
with JSON.

```ruby
def index
  @people = Person.all
  respond_to do |format|
    format.html # render .erb template as normal
    format.json {render :json => @people}
  end
end
```

You're used to running `rake routes` by now.

```sh
$ rake routes
      Prefix Verb URI Pattern             Controller#Action
movies_index GET  /movies/index(.:format) movies#index
```

That `(.:format)` indicates that if you call either
`/movies/index.html` or `/movies/index.json`, `respond_to` will
chose the correct formatting option. You can have a single route
respond to both HTML and JSON requests.

[More on respond_to](http://apidock.com/rails/ActionController/MimeResponds/respond_to)

Resources
---------

- [Layouts and Rendering in Rails](http://guides.rubyonrails.org/layouts_and_rendering.html)
    - up to and including `2.2.9 Rendering JSON`
- [API Basics and Building Your Own](http://www.theodinproject.com/ruby-on-rails/apis-and-building-your-own)
    - stop reading at `Service Oriented Architecture (SOA)`
- [Typhoeus](https://github.com/typhoeus/typhoeus)
- [respond_to](http://apidock.com/rails/ActionController/MimeResponds/respond_to)
