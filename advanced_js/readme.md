## Advanced JavaScript Concepts

### Namespacing

When multiple files are written, there can be a major issue with global variables conflicting. To avoid that we introduce a namespace which is not a native concept to JavaScript at all. It's purpose is to limit global impact and provide data protection.

To start, create an object around your namespace. All of our variables and functions will now be properties of this object. For example

```
var ELIENAMESPACE = {
    list: ["elie","tim","pete","myla"],
    count: function() {
        for (var i = 0; i < this.list.length; i++) {
            console.log(this.list[i])
        };
        }
}
```

Notice that we are using the `this` keyword to refer to our wrapper and namespace. All of our native variables and methods will use `this`. The namespace will now act as a barrier in the global scope. This is very very useful for very large applications.

To make things even cooler, you can nest namespaces inside each other - which is very common in the module pattern. You can read more about namespacing [here](http://addyosmani.com/blog/essential-js-namespacing/) (remember, this is an advanced topic so if you see an example you don't understand, try it in the chrome console and see what you can learn)


### Closures

So far, our module has only public properties. This means that someone can access our namespace and it's properties - what if we don't want that? What if we want some privacy? First we decide which should be public and private. Let's look at this example.

```
var MYNAMESPACE = {

  // This can be public, I don't mind other people messing with this
  friends:["tim", "pete", "myla", "alex"],

  // This array should be private!
  siblings: ["haim", "david", "tamar"],

  // a function manipulate my friends array - let's make that public
  addFriends: function(){},

  // a function to add siblings...but I don't want any more so let's keep that private!
  addSiblings: function(){}
}
```

To 'privatize' properties we can use a closure!

First, we wrap our code in an IIFE and create some local variables that will be closed up into the namespace - so now it looks like this:

```
var MYNAMESPACE = (function(){

  // PUT OUR PRIVATE METHODS ON THE TOP

  // This array should be private! This property will only belong to the function instead of directly to the namespace

  var siblings = ["haim", "david", "tamar"];


  // a function to add siblings...but I don't want any more so let's keep that private! This method will only belong to the function instead of directly to the namespace
  
   var addSiblings = function(){};
  // PUT OUR PUBLIC METHODS HERE IN AN OBJECT WHICH BECOMES THE NAMESPACE

return {

  // This can be public, I don't mind other people messing with this
  friends: ["tim", "pete", "myla", "alex"],

  // a function manipulate my friends array - let's make that public
  seeSiblings: function(){
    console.log(siblings);
  }
 };
})();
```

Our sensitive data is private by closure and our public properties are accessible through the namespace!

### Global Imports

What happens if we have a global variable outside of our namespace? If we have multiple nested variables, this becomes very tricky and expensive to search up all the way to the global namespace! So how can we import global variables to our namespace? It's also essential for other people working on your code, to see in what scope your variables are located in.

For clearer faster global modules we use imports. For every global variable that you import, add it as a parameter in your IIFE and then in the function invocation - pass in the global variable! You can now modify the value without touching the global namespace!

```
var test = "this is a test";

var MYNAMESPACE = (function(foo){

  // PUT OUR PRIVATE METHODS ON THE TOP

  // This array should be private! This property will only belong to the function instead of directly to the namespace

  var siblings = ["haim", "david", "tamar"];
  siblings.push(foo);

  // a function to add siblings...but I don't want any more so let's keep that private! This method will only belong to the function instead of directly to the namespace
   var addFriends = function(){};
  // PUT OUR PUBLIC METHODS HERE IN AN OBJECT WHICH BECOMES THE NAMESPACE

return {

  // This can be public, I don't mind other people messing with this
  friends: ["tim", "alex", "myla", "pete"],

  // a function manipulate my friends array - let's make that public
  addFriends: function(){
    console.log(siblings);
  }
 };
})(test);
```

### More Reading

If you would like to learn more about design patterns in JavaScript check out these sources, they are advanced but incredibly valuable.

[JavaScript Allonge](https://leanpub.com/javascript-allonge)

[Learning JavaScript Design Patterns](http://addyosmani.com/resources/essentialjsdesignpatterns/book/)