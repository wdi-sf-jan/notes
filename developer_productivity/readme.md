## Developer Productivity

A big part of becoming a developer is not only learning how to code, but learning how to use valuable tools to help you build faster and more efficiently.

## Chrome Developer Tools (Elements, Console, Network, Resources)

In short, Chrome Developer Tools are freaking sweet. Here is a brief walkthrough of some of the most useful features of the Developer Tools that you will be using with almost every single thing you build in WDI.

### The Elements Tab

This tab is extremely useful for looking at the DOM, and seeing your CSS styling. You can also use it to make changes to your HTML and CSS in real time, which is awesome when you are designing your pages.

### The Network Tab

This tab is an excellent resource for seeing if HTML, CSS, Fonts, JavaScript and other goodies on your page have loaded. You can also use this tab to see responses from a server (SUPER useful when we start doing back-end development and AJAX) and file paths which will help you debug issues of content not being loaded. You can also view how long these files take to load to help when focusing on page load performance.

### The Sources Tab

In this tab you can view the JavaScript your page is loading and make any changes to it. You can also add break points to stop the code and jump into any part of the code to see what your variables and any other data looks like. We will cover this more when we focus on JavaScript in the browser, but know this is one of the best resources for debugging your JS.

### The Resources Tab

In this tab you can view all of the information that has loaded on a page (images, scripts, stylesheets etc) as well as information about cookies, sessions and local storage (all things we will cover later in the course)

### The Console

You are probably going to find yourself in this tab most often. In the console you can play around with JavaScript as well as any of the JS you have included on your page. You can also see AJAX calls on the page (right click to check Log XMLHttpRequests) as well as any errors your browser is reporting. The console along with the sources tab are your best spots for debugging JavaScript and learning to work with them will make your life much easier as you continue to learn JS. 

If you want to learn some more about Chrome Dev Tools, check out this free tutorial on [CodeSchool](http://discover-devtools.codeschool.com/?locale=en)

## Sublime Text 3

It's essential to have a good understanding of your text editor so that you can spend less time typing and more time coding correctly! Here are some awesome tools that Sublime Text has to help you get started.

#### Package Manager

The most important thing you can install right after getting Sublime Text 3 is Package Manager. This will enable you to install external packages and make your life as a developer much nicer :)

#### Subl symbolic link

See [this](http://stackoverflow.com/questions/16199581/opening-sublime-text-on-command-line-as-subl-on-mac-os) Stack Overflow post to get the subl binary working for Sublime Text 3 

#### Important User settings

Here are some useful default settings I have in Sublime Text 3 `Sublime Text > Preferences > Settings-User` The most essential ones are `tab_size` and `translate_tabs_to_spaces` so make sure to add those.

```
{
	"color_scheme": "Packages/User/Solarized (Light) (SL).tmTheme",
	"font_size": 16,
	"highlight_line": true,
	"hot_exit": false,
	"ignored_packages":
	[
		"Vintage"
	],
	"remember_open_files": false,
	"tab_size": 2,
	"theme": "Soda Light.sublime-theme",
	"translate_tabs_to_spaces": true,
	"trim_trailing_white_space_on_save": true
}
```

#### Emmet

This is by far one of my favorite plugins for Sublime and helps you code so much faster! To install it open up Package Manager `Command+Shift+P` and type in Install Packages, press enter and then search for "Emmet" and when you find it press enter to install it. After restarting Sublime you should be good to go!

##### Getting Up and Running with Emmet for HTML

Here are a bunch of super useful Emmet shortcuts to make coding in HTML much, much faster

1. Make sure your file has a .html extension or that the syntax is set to HTML and type `html:5` and press `tab` - this will generate a nice boilerplate for you
2. To give something a class or ID simply type ELEMENT.CLASSNAME or ELEMENT#IDNAME and press tab
3. To give something an attribute simply include [ATTR_NAME="VALUE"] for example `a[href="javascript:void(0)"]`
4. To give something text add {}. For example `li{"Example"}` returns `<li>"Example"</li>`
5. To make an element a child of another one add an >. For example `ul{parent}>li{child}` returns `<ul>parent <li>child</li> </ul>`
6. This gets really awesome when you start chaining these together so typing in `nav.header>ul#listing>h4{sample text}+li*4>a[href="#"]` returns 

```
<nav class="header">
  <ul id="listing">
    <h4>sample text</h4>
    <li><a href="#"></a></li>
    <li><a href="#"></a></li>
    <li><a href="#"></a></li>
    <li><a href="#"></a></li>
  </ul>
</nav>
``` 

Emmet is also super useful when coding in CSS. Here are some sample shortcuts

1. m20 -> `margin:20px;`
2. p10 -> `padding:10px;`
3. lsn -> `list-style:none;`
4. tdn -> `text-decoration:none;`
5. bdt+ -> `border-top: 1px solid #000;`
6. @m -> `@media screen { }`

Ubuntu Instructions for install Emmet: https://gist.github.com/Jon1213/4b9589e13eb47a777ae4

Here is a great cheat sheet for more shortcuts <a href = "http://docs.emmet.io/cheat-sheet/">http://docs.emmet.io/cheat-sheet/</a>


#### Sublime-Linter

This is an incredibly useful tool for working with different languages. The linter checks your code as your write it and alerts you in real time of any issues (missing braces, commas etc.). To install jump into package manager and type in `SublimeLinter` and then install it. 

For every language you work with, install`SublimeLinter NAME_OF_LANGUAGE or Linting Tool` so for JavaScript you will want to install `sublimeLinter-jshint` and then in the terminal type `npm install -g jshint`. To make sure the linter is working in Sublime go to `Tools > SublimeLinter > Mark Style` and make sure one of the tabs is checked (I prefer outline) and then `Tools > SublimeLinter > Lint Mode` and choose 'background'

#### Syntax Highlighting

When we start working with EJS, Sass, Coffeescript and other languages, Sublime Text does not have built in syntax highlighting for us so we have to use Package Manager to install this. Just press `Command+Shift+P` to open Package Manager and start typing the name of the language. Most likely, the first thing that pops up will have syntax highlighting so you will want to install that one. 

#### Snippets

One of the most useful features of Sublime is the ability to create snippets. To do this:

1. Go to `Tools > New Snippet` 
2. Once you are in here, replace the content on Line 3 (everything inside the CDATA array) to whatever you would like your snippet to output. 
3. If you would like your cursor to be at a certain spot in the snippet, just add $0 at that point on line 3.
3. Then uncomment the text on line 6 (the one with `<tabtrigger>`) and then inside that tag, type in what you would like your snippet text to be (what you type in before your press tab and generate your snippet). 
4. When you are all done, save the file in `/Users/YOUR_USER_NAME/Library/Application Support/Sublime Text 3/Packages/User` (don't worry too much about that path, it should be the default when you try to save a snippet).
5. In a new tab you should be able to use your snippet!

### ZSH/Shell/Git (moving around faster and other useful commands - this part is for ZSH Users)

ZSH comes with a bevy of wonderful shortcuts especially for git. If you ever want to see them, just type in `alias` and you will see a whole list.

### Aliasing in terminal

An extremely useful feature in your terminal is the ability to create aliases (very similar to snippets). If you are using zsh, we will be editing our .zshrc file and if you are using bash we will be editing  our .bashrc file (if you're using bash and are more curious about .bashrc vs .bash_profile you can check out the difference [here](http://stackoverflow.com/questions/902946/about-bash-profile-bashrc-and-where-should-alias-be-written-in)) 

1. Type in `subl ~/.zshrc` (for zsh) or `subl ~/.bashrc` (for bash)
2. On a new line type `alias NAME_OF_ALIAS="Add double quotes for a file path" or a command`
3. When you are done type in `source ~/.zshrc` (for zsh) or `source ~/.bashrc` (for bash). This will restart your terminal and allow you to use your new alias right away (without closing and reopening your terminal)
