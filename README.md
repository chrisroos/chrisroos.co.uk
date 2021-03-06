# Intro

This is the raw content of chrisroos.co.uk and these instructions are only really ever going to mean something to me...

It uses [Webby](http://webby.rubyforge.org/) to build a static site from the markdown/textile source. Webby doesn't work with Ruby 1.9.x so I've got a '.rbenv-version' in the project that ties me to Ruby 1.8.7.

## Using Vagrant

I've added a Vagrantfile so that I can ruby this app on a machine with Ruby 1.8.7 installed - it's proving hard to install such an old version of Ruby on MacOS.

```
$ vagrant up
$ vagrant ssh

$ cd /vagrant

# Avoid the following error:
# ragel/redcloth_attributes.c.rl:26:11: error: variable 'act' set but not used [-Werror=unused-but-set-variable]
$ bundle config build.redcloth --with-cflags="-Wno-unused-but-set-variable"

$ bundle install # The default password is vagrant
```

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

    $ webby create:post blog/"<yyyy-mm-dd>-<title of post with spaces>"

## Creating a new day note

    $ webby create:day_note blog/2010-10-14-day-notes

---

# Converting the site to Jekyll

I have the `master` branch checked out at ./chrisroos.co.uk and the `migrate-to-jekyll` branch checked out in a worktree at ./chrisroos.co.uk-jekyll. This allows me to compare the output of the two sites using `diff`.

## In chrisroos.co.uk

```
# Use vagrant to build the site
$ vagrant up
$ vagrant ssh
$ cd /vagrant

# Build site
$ rm -rf output
$ bundle exec webby build

# Tidy HTML
$ find ./output -type f -name '*.html' -exec tidy -modify --wrap 0 --sort-attributes alpha --indent auto {} \;
```

## In chrisroos.co.uk-jekyll

```
# Build site
$ rm -rf _site
$ bundle exec jekyll build

# Tidy HTML
$ find ./_site -type f -name '*.html' -exec tidy -modify --wrap 0 --sort-attributes alpha --indent auto {} \;
```

## Comparing the output

```
$ diff -r ./output ../chrisroos.co.uk-jekyll/_site
```
