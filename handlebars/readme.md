#Handlebars

###What is handlebars anyway?
* Handlebars is a front end templating framework
* Front end templating is taking a collection of data and displaying it in a specified way
* Handlebars is great at displaying JSON
* Templating solves the problem of creating your HTML sturcture with jQuery functions, which can become really messy quickly. Remember this?

```
// create unordered list and list item elements
var ul = $("ul");                                                                                                           
var li = $("<li></li>");                                                                                                    
// create an anchor tag with specific text and attributes 
var a = $("<a></a>").text(movie.Title).attr("href", movie.Link);                                                            
var img = $("<img>").attr("src", movie.Poster);                                                                             
// add the elements to the DOM
a.append(img);                                                                                                              
li.append(a);                                                                                                               
ul.append(li);
```

###So how does it work?
*	Handlebars templates are created with `<script>` tags in the html. The script tag just tells Handlebars which template to render, based on id, and are ignored once rendered. An example of such a script tag is:

```
<script id="my-template" type="text/x-handlebars-template">
```

* Take special note that the type must always be specified as `"text/x-handlebars-template"` for Handlebars to read the script
* Inside of the script you can write html as normal (the script tag will probably make your colors funky in sublime, but no worries it all works the same)
* Once you get JSON from an AJAX call, you can pull in the data in two ways:
	* If you are only pulling in one object, an example could look like:
	
	```
	<script id="my-template" type="text/x-handlebars-template">
    	<div class="container">
        	<h1>{{movie.Title}}</h1>
        	<div class="body">
            	   {{movie.Poster}}
        	</div>
    	</div>
	</script>
	```
	*	Or if you have an array of multiple objects, you can loop through the data like so:
	
	```
	<div id="movies">
    	   {{#each movieData}}
        	<h2><a href="/posts/{{movieData.id}}">{{movieData.Title}}</a></h2>
        	<div>{{movieData.Poster}}</div>
    	   {{/each}}
	</div>
	```
	*	The curly braces (yes it's like a handlebars mustache!) tell the script to render that data based on your AJAX call related to that script id. 
*	Before a template is used however, it must be first "compiled":

```
var source   = $("#my-template").html();
var template = Handlebars.compile(source);
```
*	The source here identifies the script's html by id, then you create a template by telling Handlebars to compile it.
* The function `Handlebars.compile` returns a function that can be passed JSON data as an argument.
* This resulting function returns HTML after the JSON data is processed into it.

```
var template_html = template(jsonData);
$("#some-div").html(template_html);
```
* Here we save the resulting HTML and JSON into `template_html` which we then pass into the html of a div with an id of `some-div` (this can obviously be flexible!)

##Okay let's try it!
* Let's visit the OMDB API again and chose a movie: [OMDB](http://www.omdbapi.com/)
* OR if you want to use the movie I used, check out the JSON output by clicking [here](http://www.omdbapi.com/?t=guardians+of+the+galaxy&y=2014&plot=full&r=json) 
	
