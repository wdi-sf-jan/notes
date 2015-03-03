# Feature Specs

It’s all about specifying how your users will interact with your application, while having a repeatable way of verifying that as your application’s code changes, the application still meets that specification, and does its job as your users would expect.

## Pre-reading

* [End-to-End Testing with RSpec Integration Tests and Capybara](https://robots.thoughtbot.com/rspec-integration-tests-with-capybara)
* [Introduction to feature specs in RSpec](http://blog.liveeditorcms.com/introduction-feature-specs-rspec/)
* [Acceptance tests at a single level of abstraction](https://robots.thoughtbot.com/acceptance-tests-at-a-single-level-of-abstraction)
* [Feature specs docs](https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec)
    * [Capybara finders](http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Finders)
    * [Capybara matchers](http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Matchers)
    * [Capybara actions](http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Actions)

## The basics

### Draw up some wireframes for what an app or feature of an app may look and the relationships between parts of the app or feature or steps in accomplishing the task

### Figure out the low hanging fruit features that may be built quickly, that would still give the user some minimum useful functionality

### Determine a specification for those fatures (how will the user interact with the application)

## Specification components

### Setup
* What are the prerequisites of the test?
* Does stuff need to exist in the database?
* Does a user need to be logged in?

### Exercise
* Fill in forms
* Click buttons, links, etc
* Submit forms

### Verify
* Does the next page have what the user will expect it to have?

### Teardown
* Mostly RSpec will take care of it for you    