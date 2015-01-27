# Intro to jQuery 

## Objectives
  1. Understand what jQuery is, and when to use it
  2. Learn how to include jQuery in your projects
  3. Understand how to apply jQuery selectors to manipulate DOM elements
  4. Add and remove DOM elements using jQuery
  5. Bind events with jQuery

## What is jQuery?
jQuery is a 3rd-party library that is intended to make front-end development tasks — particularly those involving DOM selection and manipulation — easier, faster, and more fun.

### But wait, what do we mean by 'library'?
We've already seen that we can make our jobs easier and faster by using Node modules (AKA libraries) in our apps.

**A `library`** is just a collection of reusable methods that serve a particular purpose.


### So, as a library, what does jQuery offer us?
  - jQuery helps us manipulate the DOM, allowing us to perform complex manipulations in less code with less hassle
  - jQuery's syntax was developed to mimic CSS selector syntax, making code easier to develop, read, and manage
  - The syntax is shorter, and we're lazy! :)
  - jQuery deals with many cross-browser compatibility issues for us

## Using jQuery

### Installation
**jQuery is a client side library, which means we need to include it in our HTML**. To do this, we have two options:

#### 1. Reference jQuery from a server on the internet
Directly from jQuery's website (http://code.jquery.com/)
`<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>`
From a CDN (content delivery network) like [CDNJS](https://cdnjs.com/) or [Google Hosted Libraries](https://developers.google.com/speed/libraries/)


`<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>`

#### 2. Download a copy of jQuery to host on your own server

[CDNJS](http://www.cdnjs.com), [Google Hosted Libraries](https://developers.google.com/speed/libraries/), and the [jQuery site](http://www.jquery.com) will all allow you to download a copy of jQuery to include in your projects.

### What's with the 'min.js' in the name of the jQuery file?

If you look carefully at the filenames of the jQuery versions you download, or just look at the URL in the "src" attribute for each script tag above, you'll notice something at the end of each file name — namely, that they end in 'min.js'. This means the javascript code has been minified.

#### Minified? Did I read that right?

Yep. You did. Minification is the process of making a javascript file smaller by (among other things) removing all line breaks and whitespace, reducing the length of variable and function names, and stripping out all comments. Minification can significantly reduce the size of a javascript file, and in turn, significantly decrease the time it takes our browsers to load the file into memory.

In jQuery's 1.11.1's case, the original (unminified) code is about 276 kilobytes, whereas the minified code is only 94 kilobytes. That makes the minified version **one-third** the size of the original - not bad!

Minified scripts can be difficult to read, so most servers that host jQuery and other libraries will also offer the original (non-minified) version of the code so developers can understand the code.

Minification is performed on a javascript when it's ready for release and there are many options for doing this. If you'd like to minify your own scripts, try a google search to check out the various options. Or, you can try the [Closure Compiler from Google](https://developers.google.com/closure/compiler/) which runs locally on your computer like any other piece of software you might use as a developer.

Also, if you do happen to come across a library where you can't find a non-minified version to look at, software also exists to decompress a minified script. These are usually called (unminifiers, pretty-printers, or beautifiers). They take a minified javascript and attempt to decompress it, making it easier to read and understand.

**Even if you don't fully understand the code, it's a good exercise to visit code.jquery.com and take a look at minified and non-minified jQuery.**

#### And one more thing: 1.x vs. 2.x jQuery

If you've visited code.jquery.com, you'll see that there are two major versions in development.
  - The 1.x branch is the most cross-browser-compatible version of the jQuery core.
  - The 2.x branch, while offering some new features, is not compatible with older web browsers — most notably, it's not compatible with Internet Explorer versions 8 and below.

### Intro to DOM manipulation

Before we get into jQuery, let's just think about how we would perform the following tasks:
  - `select` a DIV and change it's content
  - `append` a new DIV with some content to a web page
  - `handle` forms where users want to dynamically add elements to the page
  - `listen` for events on a collection of DIVs or other HTML elements
    + For example, a blog site might have a "like" button for each comment on a post.

#### First, let's just talk about selecting an element with jQuery

To select an element in the DOM, we use the global jQuery function:

// This is the basic syntax for jQuery selections
`$(' ')`

// To select a particular element by tag, you do
`$('h2') // selects all h2 elements`

// To select by ID, you use the same syntax as CSS selectors
`$('#someID') // Would select the element with ID="someID"`

// To select all elements of a particular class, use CSS syntax again
`$('.someClass') // Selects all elements of the class "someClass"`

// And you can use more complicated CSS selectors as well
`$('p.anotherClass') // Selects all <p> tags that also have the class "anotherClass" (<p class="anotherClass")`


If you use variable assignment when doing a selection, a "jQuery" object is returned

// We prepend '$' to variable names when a variable is going to be a jQuery object to help us remember what that variable is for.
`var $jqObject = $('p'); // Returns a jQuery object containing all <p> tags on your web page.`

// However, we don't have to prepend '$' to our variables. It's just so we can remember what a variable is being used for.
`var jqObject = $('p'); // This is functionally identical to the version above that includes the '$' in front of jqObject.`

#### Selecting a DOM element and changing it's content

Using the standard DOM API:

`<div id="myDiv">Hello world!</div>`

```
var divToManipulate = document.getElementById('myDiv');
divToManipulate.innerHTML = "Goodbye world!";
```

Now the code above isn't too hard to deal with, but even so, in jQuery, this is a one-liner.

```
$('#myDiv').html("Goodbye world!");
```

See it in action [here](http://jsbin.com/rirumatozu/4/edit?html,js,output)

If we wanted to **save our selection as a jQuery object**, the code would look like this instead:

- First we select the element we want and save it as a jQuery object

`var $myDiv = $('#myDiv');`

- Then we use our jQuery object to perform our task

`$myDiv.html("Goodbye world!");`

```

There are three things about the example above that make jQuery easier to use:
  1. jQuery is using the same syntax as CSS to select elements.
  2. jQuery allows us to chain methods together to accomplish our goals (i.e., $().html(...) ), making code shorter and easier to understand.
  3. jQuery deals with any cross-browser compatibility issues, which may not seem like a big deal in this example, but which quickly become difficult to deal with as things get more complex.

#### Appending a DOM element to a web page

If we had the following HTML page...

```
<html>
<body>

  <div id="container"></div>

</body>
</html>
```

If we want to add a new DIV that provides a nice greeting, our vanilla javascript would have to be:

```
  var myDiv = document.getElementById('container');
  var newP = document.createElement('p');
  newP.innerHTML = "Hello complicated, multi-step world of adding an element to the DOM!";
  myDiv.appendChild(newP);
```

And in jQuery, it looks like this:

```
  $('#container').append("<p>").append("Hello simple insertion using jQuery chaining");
```

In the jQuery code example above, we first select the DIV with id="container", then we append a new paragraph element (automatically created using core jQuery selector function), and then we append the text we want to insert to the new paragraph element we just created. In effect, the new HTML looks like this after the jQuery is run:

```html
  <div id="container">
    <p>
      Hello simple insertion using jQuery chaining
    </p>
  </div>
```

You can [see this in action on JSBin](http://jsbin.com/rocabu/1/edit?)


#### Modifying Styles (CSS) Using jQuery

You can do more than select elements and modify content. You can also create or update CSS style attributes in jQuery using the .css() method

```js
$("#myDiv").css("color", "red");
```

The code above will change the color of all text inside the DIV with id="myDiv" to red.

[Check this out here](http://jsbin.com/cupumu/1/edit?html,js,output)

Or, if we have a bunch of elements that all have the same class (in this example, it's class="myClass"), we can use the class selector to modify the color of all of them at once:

```js
$(".myClass").css("color", "blue");
```

[You'll find this example here](http://jsbin.com/yutoyi/1/edit?html,js,output)

But that seems kind of boring. I mean, what if we want to do something with less hard-coding using jQuery.

[Here's a repeat of the last example](http://jsbin.com/wevoti/1/edit?html,js,output) that sets the text in all elements of class="myClass" to a random color. Try to understand how it works before moving on:

```
var randColorValue = function() {
  return Math.floor( Math.random() * 255 );
}

var randColor = function() {
  var red = randColorValue();
  var green = randColorValue();
  var blue = randColorValue();
  
  return "rgb(" + red + "," + green + "," + blue + ")";
  
}

$(".myClass").css("color", randColor() );
```

#### Applying what we've learned to a real-world site:

Go to http://www.reddit.com

Reddit uses jQuery, so we can use our Chrome developer console to manipulate the site in real time using jQuery.

To do this, once Reddit.com has loaded, go to your view menu in Chrome. Select View > Developer > Javascript Console

Once that's loaded, try entering the following command into the Chrome REPL:

```
$('img').hide()
```

Hit enter. All the images should have disseapeared from the Reddit.com home page. Make sure you understand why before moving on.

Now try this:
```js
$('img').show()
```

That should have brought all the images back. Make sense so far?

Now try some of the other examples we've gone over in the Chrome REPL and see what happens to the Reddit.com website. Remember, this is your laboratory — your chance to experiment and learn. Make use of it.


## Adding and Removing Elements Using jQuery

Sometimes in a dynamic web application, user-input is meant to trigger the addition or removal of content or functionality. Using jQuery, we can easily create new DOM elements and insert them into the DOM, or remove existing elements (and any content they contain) from the DOM.

So, let's imagine we have a web page with the following content on it:

```html
<body>
  <div id="outerContainer">
    <div class="innerItem innerItemHeader">Enjoy some hipster ipsum:</div>
    <div class="innerItem">
      Aesthetic migas paleo McSweeney's, pork belly Kickstarter Echo Park sriracha keytar disrupt viral drinking vinegar fanny pack typewriter.
    </div>
  </div>
</body>
```

Let's say we want to add some more hipster ipsum to the page. Something like:

```
<div class="innerItem">
	Farm-to-table Godard roof party bespoke, fashion axe mustache vinyl.
</div>
```

To add this DIV, and our hipster ipsum content using jQuery, we'd do the following:

Define a new DIV and assign jQuery object to $newDiv

`$newDiv = $('<div>');`

// Add hipster ipsum content

`$newDiv.html("Farm-to-table Godard roof party bespoke, fashion axe mustache vinyl.");`

// Set it's class to innerItem
`$newDiv.addClass("innerItem");`

// Append our new element  
`$('#outerContainer').append($newDiv);`


See this in action (and play around with it) [on JSBin](http://jsbin.com/gupade/3/edit?html,js,output)

