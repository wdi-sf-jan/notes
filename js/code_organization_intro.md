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

#### Enter browserify and gulp, let's install them for your use:

1. `$ sudo npm install -g gulp`
2. `$ sudo npm install -g browserify`
3. `$ npm install`
4. in one terminal window `$ gulp js`
5. in another terminal window `$ gulp serve`

##### Two key commands:

```
$ browserify --debug js/main.js > js/bundle.js
```

```
$ browserify js/main.js > js/bundle.js
```