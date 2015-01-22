Persistence, LocalStorage, JSON
===============================

Since we don't have a server / backend yet, everytime you refresh your
webpage it's the same. Eventually, we will use a server with a
database to store dynamic data, and you can show the updated data
every time the page is refreshed.

With the skills you have so far, you can load a web page, use HTML and
CSS to lay it out, and use JavaScript to add interactive
functionality. You can also use JavaScript to manipulate the page
(e.g., change the `innerHTML` of some elements, add new elements,
remove elements, etc). However, every time you refresh the page, all
your changes are lost.

What if you want to save data between visits?

Local Storage
-------------

[Local Storage](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)
allows you to persist some data right in the browser. This almost
offers the functionality of having a server with a database, but the
data is only saved for this particular user in this particular
browser.

[Go read the Local Storage link]  
...  
[Welcome back]  

### Usage

The browser provides you with a `window.localStorage` property you can
use.

```javascript
localStorage.setItem("myCat", "Tom"); // saves "myCat" with value of "Tom".
localStorage.getItem("myCat");        // returns "Tom".
localStorage.removeItem("myCat");     // removes "myCat" from storage.
localStorage.clear();                 // removes ALL items from storage.
```

### Caveats

* LocalStorage is shared within domains. All pages on `google.com` can
  access the same localStorage but pages on `yahoo.com` will have
  their own, separate localStorage.

### Try It (Part 1)

Go to the [MDN example site](http://mdn.github.io/web-storage-demo/)
and in the Chrome DevTools console type:

* `localStorage` to see the stored keys and values.
* `localStorage.getItem("bgcolor")` to retrieve the current background
  color.
* `localStorage.getItem("font")` to see the current font.
* `localStorage.setItem("bgcolor", "008800")` to change the background
  color. (You'll need to refresh the page to see the results).
* `localStorage.setItem("font", "Georgia")` to change the font.
* `localStorage` to view your updates.
* `localStorage.clear()` to reset back to the defaults.

### Stringing Us Along

We've seen how LocalStorage can be used to persist data in the browser
between visits. So far, we've only tried to store Strings as
values.

__Question__: What happens if we try to store Numbers or Booleans?  
__Answer__: We can't, they get converted to Strings.

```javascript
localStorage.setItem("myNumber", 5);
localStorage.getItem("myNumber");
=> "5"
localStorage.setItem("myBoolean", true);
localStorage.getItem("myBoolean")
=> "true"
```

Ok, so we can only store Strings in LocalStorage.

__Question__: What happens if we try to store an Object or Array?  
__Answer__: They also get (poorly) converted to Strings.

```javascript
localStorage.setItem("myArray", [1,2,3]);
localStorage.getItem("myArray");
=> "1,2,3"
localStorage.setItem("myObject", {name:"Bob", age:81});
localStorage.getItem("myObject");
=> "[object Object]"
```

This isn't particularly helpful.  What if we _want_ to store an Object
or an Array?

JSON
----

[JavaScript Object Notation](http://en.wikipedia.org/wiki/JSON)

* `JSON.stringify()` - converts an Object into a String ([docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify))
* `JSON.parse()` - converts a String back into an Object ([docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse))

We can use these built-in browser methods to convert Objects and
Arrays into Strings before we store them, and then back into Objects
and Arrays when we retrieve them.

_Convert an Object to a String:_

```javascript
var bob = {name:"Bob", age:81};
=> undefined
bob;
=> Object {name: "Bob", age: 81}
var fakeBob = JSON.stringify(bob);
=> undefined
fakeBob;
=> '{"name":"Bob","age":81}'
localStorage.setItem("coolPerson", fakeBob);
```

_Convert a String to an Object:_

```javascript
var fakeBob = localStorage.getItem("coolPerson");
=> undefined
fakeBob;
=> '{"name":"Bob","age":81}'
JSON.parse(fakeBob);
=> Object {name: "Bob", age: 81}
```

### Try It (Part 2)

In the Chrome DevTools console:

* Create an Object and store it in a variable.
    * ex. `var person = {name:"Wanda", age:79};`
* Convert the Object to a String with `JSON.stringify;`.
    * ex. `JSON.stringify(person);`
* Save the results in a variable.
    * ex. `var fakePerson = JSON.stringify(person);`
* Store that variable in LocalStorage.
    * ex. `localStorage.setItem("person", fakePerson);`
* Look at LocalStorage to see them persisted.
    * ex. `localStorage;`
* Retrieve the person.
    * ex. `var frozen = localStorage.getItem("person");`
* Turn them back from a String into a real person (Object).
    * ex. `var thawed = JSON.parse(frozen);`

References
----------

Web Storage:

* [Using Web Storage on MDN](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)
* [Web storage on Wikipedia](http://en.wikipedia.org/wiki/Web_storage)
* [Some guy's tutorial on Web Storage](http://tutorials.jenkov.com/html5/local-storage.html)

JSON:

* [JSON on Wikipedia](http://en.wikipedia.org/wiki/JSON)
* [JSON.stringify()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)
* [JSON.parse()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse)
* [Douglas Crockford explains how he discovered JSON](https://www.youtube.com/watch?v=-C-JoyNuQJs)
