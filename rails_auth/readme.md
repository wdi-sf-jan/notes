## Auth in Rails + Simple Form

Very similar to our node applications, we will NEVER be storing passwords in plain text and we will be ensuring that only users who have logged in successfully can access certain pages. 

### Getting started with hashing passwords using has_secure_password

While there are lots of different ways to authenticate users, we are going to use Rails sessions and `has_secure_password`

0. Start with a new rails app `rails new learnauth -TBd postgresql`

1. In your gemfile, comment out the `bcrypt-ruby` gem and add `pry-rails`

2. Run `bundle install`

2. Create a user model

	```
	rails g model User username password password_digest
	```

5. Validate that your user always has a username 

3. Run `rake db:create db:migrate`

What does `has_secure_password` do under the hood? It adds the following code for us

	attr_reader :password
	
	validates_presence_of :password, on: create
	validates_presence_of :password_confirmation
	validates_confirmation_of :password

	# methods
	authenticate(plain_text_password)

### Testing our authentication

1. First, let's jump in rails console - `rails c` in terminal
2. Let's create a new user
3. Save the new user
4. Test out the authenticate method on the user and pass in a correct and incorrect password and see what it returns
5. Notice the fields for password and password digest. If you see a hashed password, you did something right!

## Essential concepts + topics for auth in rails

### Session hash

Your application has a session for each user in which you can store small amounts of data that will be persisted between requests. All session stores use a cookie to store a unique ID for each session (you must use a cookie, Rails will not allow you to pass the session ID in the URL as this is less secure).

Rails sets up a secret key used for signing the session data. This can be changed in config/initializers/session_store.rb and initializers/secrets.yml

You can access the session simply by using `session[]` so when a user successfully logs in we can assign  `session[:user_id] = @user.id` assuming that `@user` is an instance of the User class that we authenticated successfully. We can now use this `session[:user_id]` in our code to ensure that only logged in users have access to certain pages. We can also use the `session` hash to ensure that only users with the current session id can view their personal information. 

Here is an example of creating a user and immidiately logging them in with our session hash. Notice the use of an instance variable in this action. This is so that we can preserve form values if there is an issue submitting. 

```
def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You are now logged in!"
      redirect_to students_path
    else
      render :signup
    end
  end
```

When we log out a user, we assign any session keys to be nil. Here is an example:

```
def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path
  end
```

Read more [here](http://guides.rubyonrails.org/action_controller_overview.html#session)

### Flash hash

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

### ignoring your secrets.yml file

In your .gitignore, make sure to include `config/secrets.yml` as you do not want people seeing your secret keys for signing cookies. To generate new keys run `rake secret` and paste over your existing `secret_key_base`. Also make sure to restart your server for these changes to take effect.


## Cookies and Sessions

[http://guides.rubyonrails.org/action_controller_overview.html#cookies](http://guides.rubyonrails.org/action_controller_overview.html#cookies)

[http://www.theodinproject.com/ruby-on-rails/sessions-cookies-and-authentication](http://www.theodinproject.com/ruby-on-rails/sessions-cookies-and-authentication)

[http://pothibo.com/2013/9/sessions-and-cookies-in-ruby-on-rails](http://pothibo.com/2013/9/sessions-and-cookies-in-ruby-on-rails)

## Simple Form

[https://github.com/plataformatec/simple_form](https://github.com/plataformatec/simple_form)

[http://railscasts.com/episodes/234-simple-form](http://railscasts.com/episodes/234-simple-form)