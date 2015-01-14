# DOM Events

This morning we learned how to grab specific HTML elements and
(possibly) modify them. Another thing we can do is listen for _events_
on those elements. For example, we can ask to be notified when a
button is clicked, when the mouse is moved, or when a form is
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
    - `.preventDefault()`
    - `.target`

## Exercises

- Work through the `events` exercises continuing from Part 4.
