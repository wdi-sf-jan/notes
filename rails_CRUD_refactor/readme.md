# Essential Rails Concepts To Understand for our refactor

## Resources

### Review: what do we know about routes? ###

What would the following accomplish, if it was located in `routes.rb`?

    get '/authors/:id', to: 'authors#show'

- `'/authors/:id` is the URL to be matched.
- `to: 'authors'` refers to the authors_controller.rb
- `#show` refers to the show method within authors_controller.rb

In other words, if a request comes in to the server matching the
'/authors/:id' URL, then we call the `show` method (a.k.a., action)
inside of `authors_controller.rb`.

Q: What does this do if it's located in `routes.rb`?

    resources :authors

What's a good way to check? Hint: `rake routes`.

A: It generates all the URLs for a given resource (e.g., Author).

    $ rake routes
          Prefix Verb   URI Pattern            Controller#Action
         authors GET    /authors               authors#index
                 POST   /authors               authors#create
      new_author GET    /authors/new           authors#new
     edit_author GET    /authors/:id/edit      authors#edit
          author GET    /authors/:id           authors#show
                 PATCH  /authors/:id           authors#update
                 PUT    /authors/:id           authors#update
                 DELETE /authors/:id           authors#destroy

### Nested resources

Ok, we've seen resources.  What's all this nonsense about _nested_
resources? Well, sometimes you'll have resources that "belong to"
other resources.  We've already seen how to establish such a
relationship at the  model/database layer, but we can also represent
this relationship in our routes.  In our example, we may have a
resource called Book that belongs to another resource, called Author.

#### Exercise ####

In `routes.rb`, replace `resources :authors` with the following:

    resources :authors do
        resources :books
    end

Running `rake routes` will show that this generates the following
URLs:

    $ rake routes
    
               Prefix Verb   URI Pattern                             Controller#Action
         author_books GET    /authors/:author_id/books               books#index
                      POST   /authors/:author_id/books               books#create
      new_author_book GET    /authors/:author_id/books/new           books#new
     edit_author_book GET    /authors/:author_id/books/:id/edit      books#edit
          author_book GET    /authors/:author_id/books/:id           books#show
                      PATCH  /authors/:author_id/books/:id           books#update
                      PUT    /authors/:author_id/books/:id           books#update
                      DELETE /authors/:author_id/books/:id           books#destroy
              authors GET    /authors                                authors#index
                      POST   /authors                                authors#create
           new_author GET    /authors/new                            authors#new
          edit_author GET    /authors/:id/edit                       authors#edit
               author GET    /authors/:id                            authors#show
                      PATCH  /authors/:id                            authors#update
                      PUT    /authors/:id                            authors#update
                      DELETE /authors/:id                            authors#destroy

- '/authors' will list all the authors.
- '/authors/17' will show info about that author.
- '/authors/17/books' will show all that author's books.
- '/authors/17/books/5' will show info about that author's 5th book.

## The prefix (or "path") included in link_to and form_for

If we look back at our resources in the previous example (or just by typing rake routes after including resources) we see that there is a column called "Prefix" - what does that do? 

Simply, it's an alias for the route, so instead of typing a long route like `/authors/:author_id/books/:id/edit` we can just use `new_author_book_path`. Anytime we use the prefix, we always add `_path` at the end. 

So why do we use this? Well, it's incredibly useful and saves us from writing long routes over and over. We can include the prefix when using redirects, form_for and link_to as a way to help clean up our code. Here are some examples:

`redirect_to author_books_path(@author.id)`

`link_to "authors", author_path`

## One to Many Associations (has_many and belongs_to)

Example:

One Owner `has_many` pets and 
Many Pets `belogs_to` one owner

(FK goes in the pets table)

Always remember - whenever there is a belongs_to in the model, there should be a FK in the matching migration!

In our models we add:

```
Owner
- has_many :pets
Pet
- belongs_to :owner
```

In our pets migration file we can add:

` t.references :owner` or `t.integer :owner_id`

Now in Rails console add some information:

```
fido = Pet.create(name: "Fido")
lassie = Pet.create(name: "Lassie")
elie = Owner.create(name: "Elie")
elie.pets
fido.owner
elie.pets << fido
elie.pets << lassie
elie.pets.size
elie.pets.map(&:name)
elie.pets.each {|x| puts "My pet is named #{x.name}!"}
fido.owner
```

## Flash hash

Unfortunately...not this: 

[![Flash](http://img.youtube.com/vi/MS4_Z84-rRE/0.jpg)](https://www.youtube.com/watch?v=MS4_Z84-rRE)

The flash is a special part of the session which is cleared with each request. This means that values stored there will only be available in the next request, which is useful for passing error messages etc. It is accessed in much the same way as the session, as a hash (it's a FlashHash instance).

The easiest way to do this is by sending a message before a redirect (and less commonly before a render)

`flash[:notice] = "You have successfully logged out."`

The flash has has two default keys, notice and alert. We can include these any time after a redirect by passing it in as a second parameter like this:

`redirect_to root_url, notice: "You have successfully logged out."
`

We can also create our own keys for the flash hash. Suppose we want something like flash[:success] we can either call it like this 

```
redirect_to root_url, flash: { success: "Nice!" }
```

or 

```
flash[:success] = "Nice!" 
redirect_to root_url
```

Read more [here](http://guides.rubyonrails.org/action_controller_overview.html#the-flash)

### Including flash messages in our view

While there are many ways to do this, a simple setup which allows you to use notice, alert and a another option (success for example) can be added to your `application.html.erb` like this:

```
<% flash.each do |key, value| %>
  <% if key == "notice" %>
    <%= content_tag :div, value, class: "text-center alert alert-warning" %>
  <% elsif key == "alert" %>
    <%= content_tag :div, value, class: "text-center alert alert-danger" %>
  <% else %>
    <%= content_tag :div, value, class: "text-center alert alert-success" %>
  <% end %>
<% end %>
```

### flash vs. flash.now

The flash variable is intended to be used before a redirect, and it persists on the resulting page for one request. This means that if we do not redirect, and instead simply render a page, the flash message will persist for two requests: it appears on the rendered page but is still waiting for a redirect (i.e., a second request), and thus the message will appears again if you click a link.

Long story short....use flash when you are going to redirect and use flash.now when you render. 

Read more about it [here](http://stackoverflow.com/questions/18748072/rails-4-flash-message-persists-for-the-next-page-view)

## Miscellaneous Topics 

### field_with_errors

If you have label tags in your form, you may quickly discover that when you include some validations and render a page displaying the errors, you will see in your html that a `div` with a class of `field_with_errors` has been added around each `label` tag you have. This can mess up your styling so if you want to ensure that this element does not appear, see [here](http://stackoverflow.com/questions/5267998/rails-3-field-with-errors-wrapper-changes-the-page-appearance-how-to-avoid-t) how to deal with this issue.

You also have the option of styling the class `field_with_errors` however you please.

If you want to remove it completely you can include this code in your `config/application.rb` inside `class Application < Rails::Application`

```
config.action_view.field_error_proc = Proc.new { |html_tag, instance|
	html_tag
}            
```

Make sure to restart your server after including this change.

You can also style the class of field with errors so that it does not become a block level element in your css by using:

```
.field_with_errors {
	display: inline
}
```

### ignoring your secrets.yml file

In your .gitignore, make sure to include `config/secrets.yml` as you do not want people seeing your secret keys for signing cookies. To generate new keys run `rake secret` and paste over your existing `secret_key_base`. Also make sure to restart your server for these changes to take effect.

### Making our app look even better using bootswatch

It's time to start paying attention to how our app looks. We've been learning and using Bootstrap for a little while now, so let's style our application! There is a wonderful resource called bootswatch that let's us use free templates which means we can use bootstrap and not have our app look like every other bootstrap page! 

#### Getting Started

We need to include a couple gems in order to get started. In our Gemfile let's include 

```
gem bootstrap-sass
gem bootswatch-rails
```

After running `bundle` in the terminal, let's rename our `application.css` to `application.css.scss` so that we can include our scss extentions. Now paste in the following code

```
// Example using bootswatch
//
// First import  variables
@import "bootswatch/journal/variables";

// Then bootstrap itself
@import "bootstrap";

// And finally bootswatch style itself
@import "bootswatch/journal/bootswatch";

// If you want to import your own styles just use 

@import "name_of_scss file"

// Here are the free themes you can use:

// Amelia
// Cerulean
// Cosmo
// Cyborg
// Darkly
// Flatly
// Journal
// Lumen
// Paper
// Readable
// Sandstone
// Simplex
// Slate
// Spacelab
// Superhero
// United
// Yeti
```




