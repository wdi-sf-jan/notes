# DOM Events

This morning we learned how to grab specific HTML elements and
(possibly) modify them. Another thing we can do is listen for
__events__ on those elements. For example, we can ask to be notified
when a button is clicked, when the mouse is moved, or when a form is
submitted.

## Listening for DOM events

- `.addEventListener`

## Events

Some common events:

- `click`, `mousedown`, and `mouseup`
- `mouseover`, `mouseout`, and `mousemove`
- `keydown`, `keypress`, and `keyup`
- `submit`
- `load`

## Example

```html
<button id="howdy">Hello</button>
```

```javascript
function showPopUp() {
  alert("the button was clicked");
}

var taco = document.getElementById("howdy");
taco.addEventListener("click", showPopUp);
```

Alternative event listener syntax:

```javascript
function showPopUp() {
  alert("the button was clicked");
}

var taco = document.getElementById("howdy");
taco.onclick = showPopUp;
```

## Exercises

We will continue to do the exercises in the
[dom_exercises](https://github.com/wdi-sf-jan/dom_exercises)
repository from this morning.

- Work through the Parts 1-3 in the `events` exercises.

## The `event` object

You may have noticed that the function that acts as the event handler
accepts one parameter. By convention, we usually name this parameter
`event` (sometimes you'll see it named `e`).

- `event`
    - `.preventDefault()`: prevents the brower's default action. One
      example usage is stopping the page from refreshing when a form
      is submitted.
    - `.target`: refers to the HTML element that triggered the event.

## Exercises

- Work through the `events` exercises continuing from Part 4.

## Resources

- [DOM Events](http://en.wikipedia.org/wiki/DOM_events)
- [.addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget.addEventListener)
- [.preventDefault](https://developer.mozilla.org/en-US/docs/Web/API/event.preventDefault)
