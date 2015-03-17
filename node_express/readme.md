#Intro to Node + Express

### What is Node? 

Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices. In short, it's a way for us to write JavaScript on the server where all of our code is asynchronous. This means we will make heavy use of callbacks (and even promises) to ensure that our code runs properly. The advantage of an asynchronous environment is that we can build real-time applications with ease. Node is perfect for building things like chat rooms, games and other real-time apps.

### Starting a node application

First create a file called app.js and then run `npm init`. This will create a `package.json` file where all of our dependencies will be stored (what does that remind you of? If you're thinking of a Gemfile, you're absolutely right!). After generating our `package.json` we can install dependencies using `npm install NAME_OF_PACKAGE --save`. 

### What is Express?

Express is a minimal and flexible Node.js web application framework that provides a robust set of features for web and mobile applications. In a nutshell, it's very similar to Sinatra. It's a framework that makes life easier when it comes to routing, starting a server, rendering and much more. Fortunately for us - it's also going to look very similar to Sinatra!

### Express Middleware

Unfortunately, Express is pretty low level, so in order to perform tasks like grabbing data from a form from a POST request or doing method override, we need to install some middleware. Very similar to Sinatra, we include this middleware by using `require`. We will be using body-parser, ejs, method-override and a few more. You can read more about all these on github.

##Example web server with Node
The below is to demonstrate how Node can be used to create network applications. You can specify exactly how the behavior is.

**server.js**

```
var http = require("http");

function doStuff(req, res) {
  res.writeHead(200, {"Content-Type": "text/plain"});
  res.write("Hello World");
  res.end();
}

var server = http.createServer(doStuff);

server.listen(3000);

```

diffrent ways to terminate a connection

```
curl -i localhost:3000
```

We notice a few different things in the header

```
keep alive = persistent encoding
transfer encoding = chunked # streaming!

```	

##Our first Express App

###Setting up a project
1. Create a new folder for use with the project using `mkdir node_calculator`, and cd into `cd node_calculator`

First we want to start a new project by going `npm init`
Follow the instructions, clicking `enter` through the statements. you many want to specify a version number, but most default options should 
be fine. It will also specify an initial file, usually index.js to use

```
npm install --save express
touch index.js
```

###Installing nodemon
`npm install -g nodemon`

If we just ran `node nameOfFile.js`, node will not update its responses after the server has made.

###index.js

The following example, shows a few different ways to get routes working in Node. A `route` is a combination of a url pattern + HTTP Verb (get, post, delete, update)

```
var express = require('express');
var app = express();

app.get('/', function(req, res){
  res.send('hello delmer');
});

app.get("/greet/:name/:lastname", function(req, res) {
  res.send("Hello " + req.params.name + " " + req.params.lastname)
})

app.get("/multiply/:x/:y", function(req, res) {
  res.send("The answer is: " + (req.params.x * req.params.y));
})

app.get("/add/:x/:y", function(req, res) {
  res.send("The answer is: " + (parseInt(req.params.x) + parseInt(req.params.y)));
})

app.listen(3000);
```
In addition to having routes where diffrent portions of the url are diffrent paramaters. We can use the generic string of the url in our route logic.

```
app.get("/add/*", function(req, res) {
  var myParams = req.params[0].split("/")
  var result = myParams.reduce( function(total, num){ return total + parseInt(num) }, 0)
  res.send("The answer is  " + result);
})
```
This will give you a url like `http://localhost:3000/add/5/3/3/2/3` and give you an answer.


###Running your Project
If `"main": "index.js"` is in your `package.json`, then running `nodemon` will automatically start your project and serving your file.

# More Express
## Views and Post Data


## Baseline

Let's start with what we had this morning:

`app.js`

```
var express = require('express'),
  app = express();

app.get('/', function(req, res){
  res.send('Hello world!');
});

```

### Views 

Fistly, we cannot keep using `res.send` to send a response. It would be much more efficient to store them in files. Let's make a folder, `/views`, and create an `index.html` page inside.

```
<!doctype html>

<html>
  <head>
  </head>
  <body>
    Hello world!
  </body>
</html>
```

and let's modify the `app.js` to use this file via `app#render`.

`app.js`

```
var express = require('express'),
  app = express();

app.get('/', function(req, res){
  // use a render
  res.render('index.html');
});

```

without setting the `view engine` this will cause an error.

### BodyParser

The next thing we need to get ready for is parsing params from a form, which you need an external module for called `body-parser`.

`app.js`

```
var express = require('express'),
  bodyParser = require('body-parser'),
  app = express();

// tell your app to use the module
app.use(bodyParser.urlencoded())

app.get('/', function(req, res){
  // use a render
  res.render('index.html');
});

```

### Templating

We might need to render some data into our views, so we'll also need a module for this, `ejs`. To do this change `index.html` to `index.ejs`.


`app.js`

```
var express = require('express'),
  bodyParser = require('body-parser'),
  ejs = require('ejs'),
  app = express();

// tell your app to use the module
app.use(bodyParser.urlencoded())

app.set('view engine', 'ejs');

app.get('/', function(req, res){
  // use a render
  res.render('index.ejs', {name: "Ruby Rud"});
});

```

then we need to update our `index.ejs` to use a templating variable.

`index.ejs`

```
<!doctype html>

<html>
  <head>
  </head>
  <body>
    Hello, <%= name %>!
  </body>
</html>
```
