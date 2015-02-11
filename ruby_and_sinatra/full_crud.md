# Ruby and Sinatra - Full CRUD

## Objectives

* Build a Sinatra app that will respond to all the core HTTP verbs:
    * `GET, POST, PUT, DELETE`
    * Learn how to send data to the server from the client side of your application
    * Understand how to use `ERB` templating for rendering HTML
* Play a lot more with ruby

## Rendering HTML flavored with data

### `ERB` - ruby embedded and/or evaluated in plain text

`ERB` is a filter, which takes in text as its input and produces processed/filtered text as its output. It evaluates all ruby within the special tags below, and completely ignores all other text, leaving it as it had found it.

```
<% Ruby code -- inline with output %>
<%= Ruby expression -- replace with result %>
<%# comment -- ignored -- useful in testing %>
```

This is great for building up HTML documents.

### Simple sample example

Start by writing a quick sinatra app from scratch in a working directory of your choice, somewhere in your WDI folder.

The app should respond to the following request:

`GET /`

When you have the app running and you visit [http://localhost:4567](http://localhost:4567) you should see the following HTML page:

```
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>WDI 16 Teachers and DiRs</title>
</head>
<body>
  <h2>WDI 16 Teachers and DiRs</h2>
  <ul>
    <li>Elie Schoppik</li>
    <li>Tim Licata</li>
    <li>Myla Baker</li>
    <li>Peter Schulz</li>
    <li>Alex Notov</li>
  </ul>  
</body>
</html>
```

But, what if we have an array of teachers, such as:

```
teachers = [
  { first: 'Elie', last: 'Schoppik' }
  { first: 'Tim', last: 'Licata' },
  { first: 'Myla', last: 'Baker' },
  { first: 'Peter', last: 'Schulz' },
  { first: 'Alex', last: 'Notov' }
] 
```

Well what if you just had to output one teacher?

Simple:

```
<li><%= teachers[0][:first] %><%= teachers[0][:last] %></li>
```

For control flow code, use the `<% Ruby code -- inline with output %>` syntax.

So, to iterate over the `teachers` array:

```
<% teachers.each do |teacher| %>
    What do you think goes here?
<% end %>
```

Attempt to complete the exercise. You'll encounter a bug, which will lead us to the next couple of points:

* Data passed to `ERB` templates from our sinatra app must be referenced with instance variables.

    * The syntax for instance variables is: `@variable = 123`.

* To evaluate `ERB`, we need to call the `erb` function, passing it the erb-enhanced string, like so:
    * `erb("<%= valid ruby expression %>")`

Fix your code.

### Putting the erb into its own file

* Simple, just a `.erb` extension on your file.
* Then just pass a symbol denoting the file name to the `erb()` function

#### Exercise
* Put the `ERB` content from the first exercise into a file called `index.erb` in a directory called `views` - this is your erb template file. So it'll be `views/index.erb`
* Render the erb file, by writing the following: `erb(:teachers)` or not using params: `erb :index`

## Creating a new teacher (`POST`)

Enter forms and `post` routes!

First, let's set up a `post` route:

```
post '/teachers' do
end
```

Then, let's set up a `get` route:
```
get '/teachers/new' do
  erb :new
end
```

Now, let's make a form in a file called `new.erb` and put the following into it:

```
<form action="/teachers" method="post">
  <div>
    <label for="first">First name:</label>
    <input type="text" name="first" id="first">
  </div>
  
  <div>
    <label for="last">Last name:</label>
    <input type="text" name="last" id="last">
  </div>
  
  <input type="submit" value="Add teacher">
</form>
```

Let's now move the `teachers` array out of the `index` route, so it may be used by other routes.

Now, let's write some easy code in the `post '/teachers' route`:

```
post '/teachers' do
  teachers.push({ first: params[:first], last: params[:last] })
  redirect to('/')
end
```

Boom!

## Updating an existing teacher

We can write a new route, such as:

```
get '/teachers/:id' do
end
```

This route would:

1. Find the teacher we want, based on the id in the params hash (from the url)
2. Display a form containing the data for that teacher
3. Submitting the form would send a `PUT` to the following route:

```
put '/teachers/:id' do
  # code to find the teacher by id
  # and update their parameters
end
```

But, the form needs to have a special field in it, which is called the method override field:

```
<input type="hidden" name="_method" value="put">
```

Sinatra's included `Rack::MethodOverride` middleware will now take care of the rest, sending your data to the correct route. 

Basically, HTML forms suck and they don't support `PUT` or `DELETE`, so this is a well accepted and documented hack/best practice to work around that shortcoming.

## [Lab Time!](https://github.com/wdi-sf-jan/faux-db)