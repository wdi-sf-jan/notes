## HTML

### What is this <!DOCTYPE html>?

Always, always make sure to put this at the top of your HTML file, otherwise you will enter quirks mode, which is no fun for anyone - read more about quirks mode here [http://en.wikipedia.org/wiki/Quirks_mode](http://en.wikipedia.org/wiki/Quirks_mode) and read a very good Stack Overflow answer as to why you need a Doctype [here](http://stackoverflow.com/questions/6076432/why-do-i-need-a-doctype-what-does-it-do)

### Meta Tags

Metadata is data (information) about data. The <meta> tag provides metadata about the HTML document. Metadata will not be displayed on the page, but will be machine parsable. Meta elements are typically used to specify page description, keywords, author of the document, last modified, and other metadata. The metadata can be used by browsers (how to display content or reload the page), search engines (keywords), or other web services.

Some common meta tags you will see are charset, content, author, description (for SEO), http-equiv (which we will learn about more when we discuss HTTP Headers)

### Divs + Spans

HTML provides for us two 'empty' containers to store whatever content we want. One is a div (block element) and the other is a span (inline element)

### Forms, Labels, Input Types and HTML5 Attributes

Forms - One of the most common ways to send data to a server is by using a form. A form has two essential attributes, action and method.

* Action - This specifies a route where you are going to. For example an action of '/test' will take you to the /test route (something you have probably configured in your server side code)

* Method - The HTTP Verb that this form will be using (HTML only knows GET and POST, but there are ways to override this default which we will see when we use Node and Rails. The default method is GET so if you are making a GET request you can leave this empty.

Label - Labels are text you place before/after inputs to tell the user what the input is for. The for attribute is for screen readers and if the ID of the input matches the ID of the for attribute then you can click on the label and have it automatically focus/check the input.

HTML5 provides a couple new attributes for inputs which improve user experience. Some of these are:

* autofocus - automatically focuses on an input (don't put this on more than one)
* required - ensures that there is text in the input field you place it before the user submits the form (you can put this on as many inputs as you'd like). If your input type is email or number, the validation will be a bit different.

### Tables

Before CSS became mainstream, websites were designed using tables. Although they are much less frequently used, building tables is still a very useful skill to know. The tags for tables are such:

* `<table></table>` - create a table
* `<tr></tr>` - create a table row
* `<th></th>` - create a table heading
* `<td></td>` - create a table cell
* `<tbody></tbody>` - create the body of the table (newer tag)
* `<thead></thead>` - create the head of the table (newer tag). No matter where this is located, whatever is in it will be the first row
* `<tfoot></tfoot>` - create the foot of the table (newer tag). No matter where this is located, whatever is in it will be the last row

# CSS

### 3 ways to style

1. Inline
2. `<style>`
3. Seperate css file

### IDs vs Classes

1. ID's are assigned with a #
2. Classes are assigned with a .

### The cascade (!important, inline, ID, class, element)

##### What happens if you have an ID and a class that conflict? The Cascade in CSS comes into play here. In order of importance:

1. !important (use very rarely! This is like dropping an atomic bomb on your css style)
1. Inline Style (use infrequently as you want to try to separate your CSS from HTML)
2. ID (use infrequently as well, lot's of IDs pollute your CSS)
3. Classes (your most common way of styling)
4. Element (use for broad styling like font-size, padding and margin)

Awesome article from CSS tricks on the cascade - [http://css-tricks.com/specifics-on-css-specificity/](http://css-tricks.com/specifics-on-css-specificity/)

### Centering, positioning (absolute, relative, fixed)

To center your text you can use `text-align:center` and for block elements you can set `margin: 0 auto`

When you want to move elements around the page or set their position so that they do not change you use the position property. An element's position can either be static (default), relative, absolute or fixed. Once position is applied to an element, that element has access to top, left, right and bottom properties which will move the element around. Absolutely positioned elements are in relation to their parent container (if there is none, it is in relation to the browser window just like relatively positioned elements). Fixed positioning will fix the element to the page and ensure that it never moves.


### Box Model (margin, padding, border)

Although we don't use tables anymore to design our site, we can still think of the layout of a page as a series of boxes. This thought process is the foundation of the box model, which is an essential principle in CSS that helps us create layouts and define width and height. The box model encompases width and height along with padding, border and __not__ margin. Here is a good visual to help:

![The Box Model](http://guistuff.com/css/images/boxmodel.png)

To calculate the true width/height include the padding and border

### Display (inline vs block level elements)

Different elements in CSS have different display properties. For example a span is an inline element and a div is a block level element which means that multiple spans next to each other will continue in a line like this:

- span1 span2 span3

while block elements like divs will stack on top of each other like blocks:

div1
<br>
div2
<br>
div3

This also means that properties like width and height can not be applied to the span. If you want to change the display of an element use the CSS property `display` and set it to `block`, `inline`, or `inline- block` (allows the element to line up and also have properties like width and height)

### CSS selectors

[This](http://code.tutsplus.com/tutorials/the-30-css-selectors-you-must-memorize--net-16048) is ESSENTIAL memorizing material, but here are some of the most common ways to select elements based on certain characteristics

1. Select by element - `div { }`
2. Select by class - `.className`
3. Select by ID - `#IDName`
4. Select an element inside of another element - `li a` (select all a tags inside an li)

### Pseudo Selectors

Some actions like hovering can be targeted using a pseudo selector. Some common ones are :hover, :visited, :focus, and :active. To apply these, just add them to your CSS selector. For example `.link:hover` or `li:focus`

### Media queries

Let's jump ahead for a second and think about how we can apply our knowledge of CSS for designing apps for devices of different sizes. We know how to change the width, height and size of our elements, but what happens when everything is condensed to <420px (phones) or <760px (tablets)? How do we write different styles for different width's and heights? Media queries is our answer. We define our media query and the dimensions that we want to target and then apply specific styles here. Here is the syntax:

`@media screen and (max-width:___px) and (min-width:___px) { } `

# Bootstrap

A little while back, a couple wonderful folks at Twitter created a front end framework called Bootstrap to make responsive web development much easier. Bootstrap is extremely popular and knowledge of at least one CSS framework is a very valuable skill to have. Bootstrap comes with a ton of features including a responsive grid system, buttons, icons and some very nifty JavaScript plugins.

### How to include it

You can include Bootstrap multiple ways, the easiest to start is a CDN and the most practical as you build more robust applications is to use something like Bower (or a gem when we get to rails)

1. CDN (content delivery network - someone else hosts the library/framework and you access it via a URL)
2. Include the actual CSS and JS files - great for offline development
3. Bower - a package manager for your front end dependencies (written by some Twitter people also!)

### Start with a container

To make sure that all your bootstrap styles behave properly, it's always best to put your content inside an element with a class "container" (usually a div). This will create a width of 1170px, and center all your content. If you would like to use the full width of the screen use `class = "container-fluid"`

### Layout/Grid (row class, spans, offset, nesting)

The bootstrap grid is based on 12 columns that can are accessible using by placing the columns in ```<div class = "row">``` (you must place your columns in a row) and then you use the following classes for these screen sizes.

* col-xs = <768px
* col-sm = <992px
* col-md <1200px
* col-lg >1200px

Here is an example of an two column layout.

```
<div class="row">
  <div class="col-md-6">.col-md-6</div>
  <div class="col-md-6">.col-md-6</div>
</div>
```

You can see some more good examples [here](http://getbootstrap.com/css/#grid)

You can also offset and nest your columns. When you offset a column, you add a column of whitespace and push the column to the right. Here is a example

```
<div class="row">
  <div class="col-md-3 col-md-offset-3">
  	This column takes 1/4 of the width of the page and is moved to the 	right by 1/4 of the page
  </div>
</div>
```

Here is an example of nesting columns (putting one row inside another)

```
<div class="row">
  <div class="col-sm-6">
    Level 1: Column takes 1/2 the width of the page
    <div class="row">
      <div class="col-sm-4">
        Level 2: This column takes 1/3 the width of it's parent column
      </div>
      <div class="col-sm-8">
        Level 2: This column takes 2/3 the width of it's parent column
      </div>
    </div>
  </div>
</div>
```

### Buttons/positioning

To align text, use these classes.

```
<p class="text-left">Left aligned text.</p>
<p class="text-center">Center aligned text.</p>
<p class="text-right">Right aligned text.</p>
<p class="text-justify">Justified text.</p>
<p class="text-nowrap">No wrap text.</p>
```

### Icons

Bootstrap comes with a set of icons which can be accessed using the `<i></i>` tag. You can access these icons (here)[include bootstrap link]

### Typography (lead, muted, warning/error/success/info, small>cite attr -> cite title = "test")

Bootstrap also comes with some nice styles to improve the quality of your typography including:

`<p class="lead">This text will stand out in a paragraph</p>`

`<small>This line of text is meant to be treated as fine print.</small>`

`<p class="text-lowercase">Lowercased text.</p>`
`<p class="text-uppercase">Uppercased text.</p>`
`<p class="text-capitalize">Capitalized text.</p>`

### lists (unstyled class removed padding and bullets class inline to display on the same line")

You can also use Bootstrap to style your lists and remove bullet points and margin

```
<ul class="list-unstyled">
  <li>I will have no list-style and left-margin</li>
  <li>Me neither!</li>
</ul>
```

You can also style them to be inline (good for navigation)

```
<ul class="list-inline">
  <li>About</li> |
  <li>Pricing</li> |
  <li>Contact</li>
</ul>
```

### Tables

Bootstrap is really awesome at formatting tables for you and with only a couple classes you can have some spiffy looking tables. Add `class="table"` to your table tag to include this and if you would like a striped design include the class `table-striped` to your table tag. The table-striped will only add stripes to whatever is in your `tbody` tag. If you would like borders as well include `table-bordered` in your table tag.

### Buttons (link, xs, sm, lg, block, disabled)

Bootstrap comes with quite a few button default sizes and colors, to add these make sure you add a `class = btn btn-___` Bootstrap defines  these as:

```
<!-- Standard button -->
<button type="button" class="btn btn-default">Default</button>

<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
<button type="button" class="btn btn-primary">Primary</button>

<!-- Indicates a successful or positive action -->
<button type="button" class="btn btn-success">Success</button>

<!-- Contextual button for informational alert messages -->
<button type="button" class="btn btn-info">Info</button>

<!-- Indicates caution should be taken with this action -->
<button type="button" class="btn btn-warning">Warning</button>

<!-- Indicates a dangerous or potentially negative action -->
<button type="button" class="btn btn-danger">Danger</button>

<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
<button type="button" class="btn btn-link">Link</button>
```

You can also add .btn-lg, .btn-sm, or .btn-xs for additional sizes.

### Images (img-rounded, img-responsive, img-circle)

Bootstrap helps you format images using img-rounded (rounds the corners), img-circle (makes the image a circle) and img-thumbnail (adds a border). You can also add a class of img-responsive to your image to make it scale well when the screen size changes (this sets its max-width to 100% and the height to auto)

### Forms

Bootstrap is also very helpful when you need to style your forms. All textual `<input>, <textarea>, and <select>` elements with `.form-control `are set to width: 100%; by default. Wrap labels and controls in .form-group for optimum spacing. You can create horizontal and inline forms and style each of your inputs and validations as well. Read more about form styling [here](http://getbootstrap.com/css/#forms)

### JavaScript + Bootstrap

Bootstrap can also do some nifty things for you with it's JavaScript plugins. This includes carousels, modals, popovers, dropdowns and other nice pieces of functionality that will really spruce up your app. Always make sure you understand what the code is doing before copying and pasting it. Fortunately, this is not too challenging and Bootstrap has excellent documentation. As always, if you're confused or things are breaking - google around. Bootstrap is pretty much ubiquitous and it is likely that the problems you have, other people have had (and hopefully solved) as well.
