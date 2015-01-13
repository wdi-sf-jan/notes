# Living in the Command Line

| Objectives |
| :--- |
| Navigate the terminal and have an understanding of the tools available in it. |


# Background

Web programmers have to live on the command line.  It gives us fast,
reliable, and automatable control over computers.  Web servers usually
don't have graphical interfaces, so we need to interact with them
through command line and programmatic interfaces.  Once you become
comfortable using the command line, staying on the keyboard will also
help you keep an uninterrupted flow of work going without the
disruption of shifting to the mouse.

# Topics

* Command Overview
  * `ls`
  * `cd`
  * `mkdir`
  * `cat`
  * `touch`
  * `rm`
  * `grep`
  * `|` (pipe), `>`, `>>`
  * vim
  * `ZShell`

## Metaphors
The command line is my home.  I literally think of using the command line as walking around a building.

#### Where am I?

* the entrance, __root directory__: `/`
* my room, __home directory__: `~` or `/Users/alex`
* current room, __working directory__: can be retrieved by running `$ pwd`

#### Look around:

* look around the room, list directory contents: `ls`
* open the current directory in finder: `open .`
* see the things in the corners and in the back of the closet, the hidden stuff (list all): `ls -a`
  
* In every room (folder) you'll see `.`, which I think of as being the floor.
* You'll also see `..`, the door you came in through, which is the folder above the current folder.
* Any other files which begin with `.` are considered hidden files.
    
I can look at everything in a more detailed list with `ls -l`.  List in a long format.  I've put in a header line so you can see what some of the columns are.  

    Permissions     Owner    Group    Size   Last Modified Filename
    drwxr-xr-x   45 raphael  staff      1530 Nov 21 23:30  Applications
    drwx------+  11 raphael  staff       374 Dec  4 09:09  Desktop
    -rw-r--r--    1 raphael  staff      8872 Nov 13  2012  downloads.txt
    -rw-r--r--    1 raphael  staff    191858 Nov 16 14:45  dump.rdb
    lrwxr-xr-x    1 root     staff         4 May 10  2011  usr -> /usr

* File permissions

* List all in a long format: `ls -la` 

Some of the entries I see are other rooms, which we call directories or folders.  
List the contents of another room with `ls [dirname]`.  
Try `ls Downloads`.  
We can go further down into the house, into a sub-directory.

#### Move around:
I can change the room I'm in with `cd`.  `cd` stands for change directory.

We can move back to the root directory: `cd /`.  

A path which starts from the entrance, the root directory, is called an __absolute path__.  

Now look around.  What do you see?

We can move back home: `cd ~`.  What do you see?

I can move into my workspace directory: `cd workspace`.  

A path which is relative to the current directory is called a __relative path__.

Hitting `<TAB>` autocompletes.  Hit `<TAB>` constantly.

It's important to remember that being in one room is much like being in another room.  
The difference is in the contents and the relative position of other folders.

#### Build new rooms (making directories with mkdir)

`mkdir living_room`

#### Exercise: Furnishing the Room (editing files)

Let's `cd` into our new `living_room`  
Look around with `ls`, and `ls -a`.  
What do you see?

I want my living room to have a bookshelf full of books.  
Let's make a file that lists all of our books.  
Type `subl books` to open Sublime Text editing a new file called `books`.  
Add a few books, copy and paste the section below so we all have some books in common, and save the file.  
Make sure the books you add are in the same format:  `<author_given_name>, <author_last_name>:<title>`.

```
Carroll, Lewis:Through the Looking-Glass
Shakespeare, William:Hamlet
Bartlett, John:Familiar Quotations
Mill, John Stuart:On Nature
London, Jack:John Barleycorn
Bunyan, John:Pilgrim's Progress, The
Defoe, Daniel:Robinson Crusoe
Mill, John Stuart:System of Logic, A
Milton, John:Paradise Lost
Johnson, Samuel:Lives of the Poets
Shakespeare, William:Julius Caesar
Mill, John Stuart:On Liberty
Bunyan, John:Saved by Grace
```

Now try `ls` again.  Do you see the `books` file?  Look at the contents with `cat`.  Let's make another, smaller file, which will be our bookshelf.  Describe the bookshelf, and just say the description to ourselves.

    echo "The particle board of this bookshelf flexes under the weight of the books it holds, but it serves its purpose and does it cheaply."
  
`echo` is a command that just echoes (outputs) what we give to it as arguments (same as operands).  Now we want to put that line in a file called `bookshelf`.
  
    echo "The particle board of this bookshelf flexes under the weight of the books it holds, but it serves its purpose and does it cheaply." > bookshelf

Using the closing angle bracket `>` in this way is called redirection.  Every command that we run in the shell has an input, an output, an error output, and arguments/operands.  We are saying:  "Run `echo` with this string as an operand, and take the output and put it in a new file called bookshelf."  Try running `ls` again, and `cat` our new file.  

Adapted from [http://en.flossmanuals.net/command-line/piping/](http://en.flossmanuals.net/command-line/piping/)

#### Exercise: Piping

Let's look back at our books.  Read out the file.  Notice that the list of books is unsorted!  We need to organize this using the `sort` command.

Try `cat books`, and `cat books | sort`.  The character `|` is called the pipe.  We take the output from `cat books` and send it through a pipe to `sort`.  The output of `cat books` becomes the input of `sort`.  Now send the output of `sort` to a file:

    cat books | sort > sorted_books

Look around again to see how the room has changed.

There are dozens of powerful tools we can leverage using pipes.  One of the ones you'll be using the most is `grep`.

    cat books | grep Mil
  
See how we filtered out just the lines that contain Mil?  Try grepping for something else.

#### Exercise: Moving 

Now that we have our books sorted, we really don't need our unsorted list of books.  `mv` stands for move, and that's how we move files and folders from place to place.

    mv sorted_books books
  
Look around and see how the room has changed.

#### Exercise: Copying 
To copy files, we use the `cp` command.  Extrapolate from the way we used `mv` to copy the file `bookshelf` to add a file `second_bookshelf`.

#### Exercise: Removing
`rm` is short for remove.  Use `rm` to remove the `second_bookshelf` file we just created with `cp`.

#### The Shell is Programming

In interacting with the terminal like we did today, we've been using a programming language called __bash__, which stands for _Bourne-again shell_.  There are many different shell languages, but the commands we went over today will work in almost any.  Another common shell is __zsh__.  

The fact that we interact with the computer by programming empowers us. Instead of struggling to talk about the difference between two menus in a graphical program, we can communicate precisely about shell commands that have a predictable effect.

#### What happens when you run a command?

Sometimes it's important to know how the shell finds the commands that you run.  The command `which [command-name]` will tell you the location of the file which will be run when you execute that command.  For example, `which rm` on my computer gives `/bin/rm`.

`which ruby` gives `/Users/raphael/.rvm/rubies/ruby-2.0.0-p247/bin/ruby`

The shell finds these commands by looking at the PATH variable in the shell.  `echo $PATH` will show you the contents of PATH.  It should be a list of directories separated by `:`.  When you run any command, the shell looks in the directories for files that match the name of the command you're trying to run, and executes the first one it finds.  Most of you should have a line changing PATH in your `~/.bash_profile` file, which is run every time you open a new terminal session (tab or window).

## Afternoon lab: 

For the afternoon lab, we will all do the [command-line murder mystery](https://github.com/veltman/clmystery) in pairs

#### Further Reading
Linux is almost the same as OSX, and this is a great manual about the Linux command line:

[The GNU Guide to the Command Line](http://en.flossmanuals.net/command-line/)

Here's a starter book on using the command line:

[The Command Line Crash Course](http://cli.learncodethehardway.org/book/)

Here's an interesting anecdote about why Standard Output and Standard Error are separate:

[The Birth of Standard Error](http://www.spinellis.gr/blog/20131211/)

## Everything is Text (Almost)

Programs and code are basically all text.  We can edit them with any text editor.   We want an editor that's easy to use but has a programmer's features.  Some document editors are not text editors.  For example, Microsoft Word saves files by default in the Microsoft Word Document format which is not text, and we can't view it using `cat` and `grep`, and can't manipulate it using a text editor.

We use Sublime Text because it's easy, has been extended to be good for editing a lot of programming languages, and it's made for programmers.  

You also might see Vim or other terminal editors, which are good because they don't require a graphical (non-command line) interface to use, so we can use them over the internet to edit files on remote servers, and to edit files in the context of terminal commands.

Files are files, names are just names, file extensions are just a convenience so programs like Sublime Text can be smart about showing the files to you, it doesn't make a difference when it comes to running them.

Programmer's editors have many features that editors like Word do not have, like:
  
  - Auto-reindentation.  Edit -> Line -> Reindent in Sublime Text will reindent code to make it more readable.
  - Syntax highlighting.  Sublime Text will show code in helpful colors to make it more readable.
  - Parenthesis matching. Sublime text will show you the matching close parenthesis when you highlight an open parenthesis, and vice versa.
  
Sublime Text's settings can be adjusted.  Be proactive in making your environment comfortable and you will become more productive.


 

