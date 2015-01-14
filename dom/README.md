# DOM

Yesterday we learned about JavaScript. Today we will look into how
JavaScript can be used to interact with the HTML (and CSS).

## Selecting HTML elements

If you want to interact with your HTML from your JavaScript, you need
a way to reference the HTML elements in the page. For example, if you
want to use JavaScript to change a `<ul>`, you can grab it by its ID,
its class, or its tag name.

- `document.getElementById`
- `document.getElementsByClassName`
- `document.getElementsByTagName`
- `document.querySelectorAll`

Note: `getElementById` returns one element, while the rest return a
list of elements.

## Manipulating HTML elements

Once you have a reference to an HTML element, what can you do with it?
You can change its contents, change its style, or change some of its
attributes.

- `.innerHTML`
- `.value`
- `.style`
- `.getAttribute` and `.setAttribute`

## Exercises

In the [dom_exercises](https://github.com/wdi-sf-jan/dom_exercises)
repository, we have some in-class examples to work through. Clone the
repository to your computer using `git clone` command.
