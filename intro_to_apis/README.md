# Intro to APIs

| Objectives |
| :---- |
| Know what API stands for |
| Not get scared when hear the term API |
| See some examples of APIs |
| Build GitHub API example |

## Building from earlier lessons

- Use jQuery's AJAX methods for calling APIs
- Use jQuery's DOM methods for rendering data to the page.

## Questions to ask yourselves

- Do you know what API stands for?
- Do you know of any APIs?
- Have we used any APIs in class yet?

## Application Programming Interface

Programs talking to (i.e., interfacing with) each other.

- Browser <-> Browser (e.g., Your JS talks to Google Maps within the browser)
- Browser <-> Server (e.g., Your JS calls a server)
- Server <-> Server (e.g., Your server calls someone else's server)
- Server <-> Database (e.g., Even your database has an API)

### Keyword: Interface

Where else in computing do we see the term "interface"?

- GUI = Graphical User Interface = [U]sers interacting with programs
- API = Application Programming Interface = [P]rograms interacting with programs

## Why do we care?

- Need to know the term API to be a programmer :)
- In order for your software to be useful, it's going to have to talk
  to other software.

## Examples

- __Browser has an API__
    - `document.getElementById()`
    - `window.addEventListener()`
- __Web Storage has an API__
    - [https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API)
    - [https://developer.mozilla.org/en-US/docs/Web/API/Storage](https://developer.mozilla.org/en-US/docs/Web/API/Storage)
    - `localStorage.getItem()`
    - `localStorage.setItem()`
    - `localStorage.removeItem()`
    - `localStorage.clear()`
- __jQuery has an API__
    - [http://api.jquery.com/](http://api.jquery.com/)
    - `$`
    - `$("#someId)`
    - `$(".someClass").find("ul")`
    - `$("form").addClass("someClass")`
- __Twitter has an API__
    - [https://dev.twitter.com/rest/public](https://dev.twitter.com/rest/public)
- __Twilio has an API__
    - [http://www.twilio.com/api](http://www.twilio.com/api)

## Space Station Example

There's an API in the [Open APIs From Space](http://open-notify.org/)
that allows you to retrieve the position of the Internation Space
Station (ISS).

Let's take a look at some example code showing how we would do that:
[space_station_example](space_station_example).

__JSONP (Same-Origin Policy)__

One of the most important security measures in what's called the
Same-Origin Policy which only permits scripts running on pages
originating from the same site – a combination of scheme, hostname,
and port number – to access each other's DOM with no specific
restrictions, but prevents access to DOM on different sites. When
you request JSON or other data from other sites using JavaScript, you
may encounter this error which can be solved multiple ways, we will
show you JSONP. JSONP allows you to make a request from one site for
JSON data from another site.

## GitHub API Exercise

Let's work through an
[example of calling GitHub's API using AJAX](https://github.com/wdi-sf-jan/github_api_example).

## Good API Design

APIs can be big, public endeavors (jQuery, Twitter, etc), or they can
be smaller, less official undertakings such as when your code needs to
talk to your co-worker's. How do you and your co-worker each design
your separate parts so that they interface well but are isolated
enough that they are easy to understand and maintain?

- Separation of Concerns
- Loose Coupling
- Documentation :)

## Resources

- [APIs on Wikipedia](http://en.wikipedia.org/wiki/Application_programming_interface)
- [jQuery AJAX methods](http://api.jquery.com/category/ajax/)
- [Watch one of GA's own explain APIs](https://www.youtube.com/watch?v=FknvOGcLHmc)
- [Same-Origin Policy](http://en.wikipedia.org/wiki/Same-origin_policy)
