BitBalloon & GitHub Pages
=========================

So far you've been running your sites on your own computers but if
you want to share your creations with other people, you're going to
need to host it on a server.  We're going to explore two different
ways to deploy your site: a simple solution using BitBalloon and a
slightly more complex approach using GitHub Pages.

[BitBalloon](https://www.bitballoon.com/)
----------

Super simple deployment. Go to BitBalloon and drag and drop a folder
from your finder onto their web page.

[GitHub Pages](https://pages.github.com/)
------------

A way to make GitHub host your web site.

Examples:

- [http://gabrielecirulli.github.io/2048/](http://gabrielecirulli.github.io/2048/)
- [http://mdn.github.io/web-storage-demo/](http://mdn.github.io/web-storage-demo/)
- [http://tlicata.github.io/breakout/](http://tlicata.github.io/breakout/)

You can have __User__ pages and __Project__ pages. A __User__ page
would be located at \<username\>.github.io and a __Project__ page would
be located at \<username\>.github.io/\<project_name\>. We're going to
mainly talk about __Project__ pages.

### Why is this nice?

- Your project/code is on GitHub anyway.
- Don't need to find someone else to host your site.

### Why is this not nice?

- Need to learn how to use Git's branches.
    - This is actually nice because Git's branches are awesome and powerful.

Git Branches
------------

- `git branch` - shows all your branches and indictates which one is
currently have checked out.
- `git branch <branchname>` - create a branch called branchname. It
will be based on the branch you currently have checked out.
- `git checkout <branchname>` - switches to a different branch.
- `git checkout -b <branchname>` - creates a new branch and switches
to it (i.e., a combination of the previous two).
- `git merge <branchname>` - combines branchname back into the branch
you're currently on.
- `git push origin <branchname>` - pushes the branch named branchname
to origin.

Steps
-----

In order to publish your site on GitHub Pages, follow the guides
above. I'll record the steps I took here as another reference.

- `git branch`: shows that I'm on the master branch.
- `git checkout -b gh-pages`: create a new branch called gh-pages and
switch to it.
- `git branch`: shows that I'm now on the gh-pages branch.
- `git push origin gh-pages`: push my gh-pages branch up to GitHub.

You can see the code at: https://github.com/tlicata/breakout  
and the GitHub Pages version at: http://tlicata.github.io/breakout/.

Resources
---------

Git Branching

* [Atlassian "Using Branches" tutorial](https://www.atlassian.com/git/tutorials/using-branches)
* [Git Branching documentation](http://git-scm.com/book/en/v1/Git-Branching)

GitHub Pages

* [GitHub Pages landing page](https://pages.github.com/) (make sure to click on
  the "Project site" toggle near the top).
* [GitHub Pages help page](https://help.github.com/categories/github-pages-basics/)

Funtime Weekend Viewing

* [Linus Torvalds on git](https://www.youtube.com/watch?v=4XpnKHJAok8)

[Linus](http://en.wikipedia.org/wiki/Linus_Torvalds) started the
development of Linux (which he refers to as the "kernel") and is also
the initial author of Git. In this talk he discusses Git's strong
points and criticizes some of its competitors (Subversion and CVS,
mainly).
