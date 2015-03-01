## OAuth and Omniauth

### What is it?

From Wikipedia: 

OAuth provides client applications a 'secure delegated access' to server resources on behalf of a resource owner. It specifies a process for resource owners to authorize third-party access to their server resources without sharing their credentials.

What does that even mean? Read more [here](http://blog.oauth.io/oauth-tutorial)

### Additional Reading

[https://aaronparecki.com/articles/2012/07/29/1/oauth2-simplified](https://aaronparecki.com/articles/2012/07/29/1/oauth2-simplified)

[http://www.slideshare.net/aaronpk/an-introduction-to-oauth-2](http://www.slideshare.net/aaronpk/an-introduction-to-oauth-2)

[http://www.quora.com/How-does-OAuth-2-0-work](http://www.quora.com/How-does-OAuth-2-0-work)

### How does it work?

![diagram](https://s3.amazonaws.com/uploads.hipchat.com/39979/578197/VZxsUxkZxmvdrYY/upload.png)

A more complex example with Flicker's API

[flicker example](https://s.yimg.com/pw/images/en-us/flickr_oauth_flow.jpg)

### What tools do we use in rails?

The most popular gem in Rails is [omniauth](https://github.com/intridea/omniauth)

## Issues to think about when dealing with OAuth 

### Environment Variables, Security + Private Keys + Figaro

[http://railsapps.github.io/rails-environment-variables.html](http://railsapps.github.io/rails-environment-variables.html)

In this article you will see a reference to a gem called <a href = "https://github.com/laserlemon/figaro">Figaro</a>. Start by using this gem to store your secret keys in an `application.yml` file.

## In Class Exercise

### Try to implement authentication via Twitter and if successful, through Facebook.

### Getting Started

Generate a new rails application and start watching this Railscast. Make sure that you are using <a href = "https://github.com/laserlemon/figaro">Figaro</a> to add your secret keys (this means you will have to include the figaro gem). Make sure to remember to include `pry-rails` for debugging as well as the `omniauth-twitter` gem.

[Railscast with Twitter](https://www.youtube.com/watch?v=D_ttmS4pYJA)

You will need to create a new application on twitter [here](https://apps.twitter.com/). A couple things to note, the Website that you specify does not matter for now, but the Callback URL is **ESSENTIAL** for your application to work correctly. For almost all strategies, you can use `http://localhost:3000` when in development, but for twitter your callback URL needs to use `127.0.0.1` instead of `localhost` so your Callback URL should be something like `http://127.0.0.1:3000/`

#### WARNING

This railscast is a bit outdated so you will run into issues when trying to create a user. Fortunately, these are all issues that can be solved by searching on stackoverflow!

### Additional Topics

#### GPG

How can we easily share environment variables secretly with other users? Learn about GPG [here](https://bugsnag.com/blog/use-gpg-to-hide-rails-secrets)

#### Multiple Identities for one user

What happens if you want a user to be able to authenticate via Twitter, Facebook etc. without creating multiple users? See how to get started [here](https://github.com/intridea/omniauth/wiki/Managing-Multiple-Providers)



