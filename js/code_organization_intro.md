# Intro to Code Organization & Modularity, Dependency Management, Build Tools

## Core Objective

* Build a well-organized html/css/project

### Global scope is bad news
### Putting everything in one JS file is bad news
### Let's refactor the starter code for the drag race weekend lab!

#### Enter modules

#### Before we do, let's read these two articles:

* [Understanding module.exports](http://www.sitepoint.com/understanding-module-exports-exports-node-js/)
* [Node.js Require and Exports](http://openmymind.net/2012/2/3/Node-Require-and-Exports/)

#### Enter browserify, let's install it for your use:

```
$ npm install -g browserify
```

##### Two key commands:

```
$ browserify --debug js/main.js > js/bundle.js
```

```
$ browserify js/main.js > js/bundle.js
```