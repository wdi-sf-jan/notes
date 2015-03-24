var test = "This is a test";

var MYNAMESPACE = (function(foo){

  // PUT OUR PRIVATE METHODS ON THE TOP

  // This array should be private! This property will only belong to the function instead of directly to the namespace

  var siblings = ["haim", "david", "tamar"];
  siblings.push(foo);

  // a function to add siblings...but I don't want any more so let's keep that private! This method will only belong to the function instead of directly to the namespace
   var addSiblings = function(){};
  // PUT OUR PUBLIC METHODS HERE IN AN OBJECT WHICH BECOMES THE NAMESPACE

return {

  // This can be public, I don't mind other people messing with this
  friends: ["tim", "alex", "myla", "pete"],

  // a function manipulate my friends array - let's make that public
  seeSiblings: function(){
    console.log(siblings);
  }
 };
})(test);