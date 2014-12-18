---
summary:    Instructions covering how to deploy a Rails app using recap, Apache and Passenger
blog_post:  true
title:      Deploying Rails apps using Recap, Apache and Passenger
created_at: 2013-10-15 09:49:07.382412 -05:00
guid:       a3189abe-2732-4996-bffa-40cc0c770a18
layout:     blog
---
This assumes that you already have [Apache](http://httpd.apache.org/) and [Passenger](https://www.phusionpassenger.com/) installed; and that you've run `recap setup` and configured your `Capfile` with the address of your server.

I'm going to use 'thames-time-lapse' as an example application name but you'll want to replace that with the name of your app in the instructions below.

The first step is to set-up the server and get the code deployed.

    $ cap bootstrap
    $ cap deploy:setup
    $ cap deploy

We now want to make [Recap's](https://github.com/freerange/recap) configuration options available to Passenger. We can do this by changing the application user's shell to bash and loading Recap's environment variables in that user's `.bashrc`.

    # Set the app user's shell to bash
    # So that Passenger can pick up environment variables from .bashrc
    $ sudo chsh -s /bin/bash thames-time-lapse

    # Create a .bashrc that loads the recap environment variables
    $ sudo su - thames-time-lapse
    $ echo 'source ~/.recap-env-export' > ~/.bashrc

Add an Apache virtual host for our application. Note that I'm setting the `PassengerRuby` option as it defaults to the user that owns `config.ru`, which happens to be the user that deployed rather than the application user.

    $ sudo vi /etc/apache2/sites-available/thames-time-lapse.chrisroos.co.uk.conf

    # Paste the following content
    <VirtualHost *:80>
      # Set PassengerRuby if you're using a non-system Ruby
      PassengerRuby /usr/local/bin/ruby
      # We have to set the user because config.ru is owned by the user that deployed
      PassengerUser thames-time-lapse
      ServerName thames-time-lapse.chrisroos.co.uk
      DocumentRoot /home/thames-time-lapse/app/public
      <Directory /home/thames-time-lapse/app/public>
        Allow from all
        Options -MultiViews
      </Directory>
    </VirtualHost>

    # Make the site available to Apache
    $ sudo a2ensite thames-time-lapse.chrisroos.co.uk.conf

    # Restart Apache
    $ sudo service apache2 reload

All being well, your Rails app has now been deployed with Recap and is being served with Apache and Passenger.

The final step is to define the `deploy:restart` Capistrano task so that the app is restarted after deployment. Add the following task to your Capfile.

    namespace :deploy do
      task :restart do
        as_app 'touch tmp/restart.txt'
      end
    end

And that should be everything you need to get your app deployed using recap, and served by Apache and Passenger.
