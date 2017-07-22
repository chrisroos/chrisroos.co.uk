---
summary:    Simple guide to getting started with Asterisk and Adhearsion on a Mac
blog_post:  true
title:      Getting Started With Asterisk And Adhearsion On A Mac
created_at: 2011-04-21 11:12:15.466472 +01:00
guid:       858011e0-9f93-4298-b060-e7b8ca6ec347
layout:     blog
filter:     haml
---
:markdown
  These are some basic notes that should enable you to get [Asterisk](http://www.asterisk.org/) and [Adhearsion](http://adhearsion.com/) up and running on a Mac.  You'll need [homebrew](https://github.com/mxcl/homebrew) in order to install Asterisk.

  There are slightly more detailed [Getting Started instructions](https://github.com/adhearsion/adhearsion/wiki/Getting-Started) on the Adhearsion wiki should you wish to explore further.

  ## Install Asterisk

  *NOTE* Asterisk, by default, doesn't come with any config files.  You can install the sample config files by supplying the `--with-sample-config` flag to the command below.  It might be an idea to install Asterisk with the sample config files and move them elsewhere on your system to refer back to.  The rest of these notes assume that you don't have any asterisk configuration files.

      $ brew install asterisk

  ## Generate basic configuration files to allow us to test that Asterisk is working

      # Load all modules so that Asterisk can understand SIP, among other things
      $ cat > `brew --prefix`/etc/asterisk/modules.conf
      [modules]
      autoload=yes
      <ctrl-d>

      # Create a demo context that answers extension 1 and plays 'hello world'
      $ cat > `brew --prefix`/etc/asterisk/extensions.conf
      [hello-world-demo]
      exten => 1,1,Playback(hello-world)
      <ctrl-d>

      # Create a device that will forward all calls to our demo context
      $ cat > `brew --prefix`/etc/asterisk/sip.conf
      [softphone]
      type=friend
      secret=password
      host=dynamic
      context=hello-world-demo
      <ctrl-d>

  ## Start Asterisk

      $ asterisk

  ## Testing the Asterisk configuration

  1. Install the [Telephone](http://www.tlphn.com/) app from the App Store.  *NOTE* Although possibly not the most stable of software I prefer the simplicity of this softphone over some of the others available.

  2. Add an account using the following details:

      * Full Name: Anything you like
      * Domain: localhost
      * User Name: softphone (this corresponds to the name of the device in sip.conf)
      * Password: password (this corresponds to the secret defined in the 'softphone' device in sip.conf)

  3. Dial extension 1 (i.e. the number 1).

  4. Confirm that you hear the 'hello world' message.

  ## Install Adhearsion

  This installs version 1.0.2 at the time of writing.

      $ gem install adhearsion

  ## Create an Adhearsion project

      $ ahn create ~/sample-adhearsion-project

  ## Configure the Adhearsion project

  We need to create a 'hello_world_demo' context to mirror the 'hello-world-demo' context we created above in extensions.conf.  The 'simon_game' line tells adhearsion to use the simon_game component that you'll find in ~/sample-adhearsion-project/components.

      $ cd ~/sample-adhearsion-project
      $ cat >> dialplan.rb
      hello_world_demo {
        simon_game
      }

  ## Start the Adhearsion server

      $ cd ~/sample-adhearsion-project
      $ ahn start .

  ## Extend the Asterisk configuration files with the location of our Adhearsion server

  This assumes you followed the instructions above exactly as they were written, i.e. this is going to add to the 'hello-world-demo' context in extensions.conf.

      $ cat >> `brew --prefix`/etc/asterisk/extensions.conf
      exten => 2,1,AGI(agi://localhost)
      <ctrl-d>

  ## Start Asterisk

  You'll probably want to do this in another terminal window unless you started the adhearsion server as a daemon.

      $ asterisk

  ## Test that Adhearsion and Asterisk are configured to work together

  Use the telephone app mentioned above but this time dial extension 2 (i.e. number 2) rather than extension 1.  You should be prompted to play the [Simon game][]: simply repeat the numbers that you hear read out.

  And that's hopefully all there is to get Asterisk and Adhearsion set-up end to end on your Mac.

  [Simon game]: http://en.wikipedia.org/wiki/Simon_(game)
