# Intro

This is the raw content of chrisroos.co.uk and these instructions are only really ever going to mean something to me...

It uses [Webby](http://webby.rubyforge.org/) to build a static site from the markdown/textile source. Webby doesn't work with Ruby 1.9.x so I've got a '.rbenv-version' in the project that ties me to Ruby 1.8.7.

## Viewing the site locally

The best way is to use Apache to serve the 'output' directory so that all the links in the site work as expected (the site expects to have some Apache rewrite rules in place to work correctly). I use [hostess](https://github.com/lazyatom/hostess) to do just this.

If that's not possible, for whatever reason, then you can use webby's autobuild functionality.

    $ webby autobuild

*NOTE* The links won't work when using `webby autobuild` as they exclude the '.html' extension and that is all handled on my server by apache rewrite rules (contained in the 'htaccess' file in this project).

## Building the site

    $ webby build
    
## Forcing a rebuild of the site

    $ webby rebuild
    
## Deploying the site (this forces a rebuild first)

    $ webby deploy
  
## Creating a new post

    $ webby create:post blog/"<title of post with spaces>"
    
## Creating a new day note

    $ webby create:day_note blog/2010-10-14-day-notes

