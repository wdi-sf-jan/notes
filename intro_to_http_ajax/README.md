# Intro to HTTP and AJAX

## Pre-watching

* [History of the Internet](https://www.youtube.com/watch?v=9hIQjrMHTv4)
* [What is a protocol](https://www.youtube.com/watch?v=VlKks__ZhI0)
* [Intro to HTTP](https://www.youtube.com/watch?v=AMf7IX1vu9U)

## Deconstructing a request to a URL (uniform resource locator):

```
http://domain.com/path/to/resource?param=value&another_param=value
```

### _http_: the protocol/scheme
How to connect/what handshake method to use
### _host_: domain name/ip address/etc
Where to connect
### _full path_: path/to/resource
What to get once the connection has been established
### _query string_: `?param=value&another_param=value`
Optional data to be passed to the server

#### An HTTP request is a handshake between a web client and a web server.
#### It is stateless.

## HTTP verbs/methods

### Safe methods: only for information retrieval

* GET
* HEAD

### Unsafe methods: for changes to information

* POST
* PUT
* PATCH
* DELETE

## HTTP status codes

* Informational: 1XX
* Successful: 2XX
* Redirection: 3XX
* Client Error: 4XX
* Server Error: 5XX

[Status Cats](https://www.flickr.com/photos/girliemac/sets/72157628409467125)

[List of HTTP Status Codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Response_codes)

## Add a great tool to your toolchain: chrome network tab

## Exercise 1:

With your partner, visit the following URLs, and for each URL, identify the unique HTTP status codes, and reason about why those status codes are being returned by the server:

* http://wikipedia.com
* http://google.com/does-not-exist

## Exercise 2

After you've done that, try the following in your terminal, on the same urls:

```
$ curl -I http://wikipedia.com
```

Now, try:

```
$ curl -I -L http://wikipedia.com
```

What is the difference between the two above?
Hint: Read the status codes and what happens.

## What about when you want your browser to make requests for the user, vs having the user type in URLs?

Enter `$.ajax`, or `$.getJSON` for pulling json data. 

Tim will talk about the latter in the afternoon.

## Exercise 3

Let's talk about `$.ajax`. But, before we talk about it, please [read the overview](http://learn.jquery.com/ajax/) and [jquery ajax methods](http://learn.jquery.com/ajax/jquery-ajax-methods/) individually, and then discuss what you have found with a partner.

## Prep for exercises 4 and 5

* Clone the repo [jquery ajax playground](https://github.com/wdi-sf-jan/jquery-ajax-playground) to your wdi exercises directory
* Open up a terminal, follow the instructions in the repo's README 
* Run `$ npm start` from where you cloned the repo

### Exercise 4

Insert/append some HTML from a file, let's say `greeting` in the same directory as your `index.html` file.

### Exercise 5

Insert/append some HTML, based on some JSON data in a json file, let's say `greeting.json`, in the same directory as your `index.html` file.