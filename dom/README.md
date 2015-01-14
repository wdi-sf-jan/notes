# DOM

Yesterday we learned about JavaScript. Today we will look into how
JavaScript can be used to interact with HTML (and CSS).

## Selecting HTML elements

If you want to interact with your HTML from JavaScript, you need a way
to reference the HTML elements in the page. For example, if you want
to use JavaScript to change a `<ul>`, you'll need to grab it by its
ID, its class, or its tag name.

The following are different functions for grabbing elements on the
page:

- `document.getElementById` [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/document.getElementById)
- `document.getElementsByClassName` [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/document.getElementsByClassName)
- `document.getElementsByTagName` [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/document.getElementsByTagName)
- `document.querySelectorAll` [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Document.querySelectorAll)

Note: `getElementById` returns one element, while the rest return a
list of elements.

## Manipulating HTML elements

Once you have a reference to an HTML element, what can you do with it?
Well, you can change its contents, change its style, or change some of
its attributes.

- `.innerHTML`
- `.value`
- `.style`
- `.getAttribute` and `.setAttribute`

## Exercises

In the [dom_exercises](https://github.com/wdi-sf-jan/dom_exercises)
repository, we have some in-class examples to work through. Clone the
repository to your computer using the `git clone` command.

## References

- [Document Object Model](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model)
