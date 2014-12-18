---
summary:    Getting my Webby powered website running on Mac OS X El Capitan
blog_post:  true
title:      Getting my Webby powered website running on Mac OS X El Capitan
created_at: 2015-10-29 17:20:00.000000 +00:00
guid:       7f9f06d4-4cf6-407e-9f92-83321e34d105
layout:     blog
---

  This is what I needed to do to get [Webby](https://github.com/TwP/webby) powered [website](https://github.com/chrisroos/chrisroos.co.uk) working on my laptop.

      $ cd ~/Code/github/chrisroos.co.uk

      $ cat .rbenv-version
      1.8.7-p352

      $ rbenv install 1.8.7-p352

      ERROR: This package must be compiled with GCC, but ruby-build couldn't
      find a suitable `gcc` executable on your system. Please install GCC
      and try again.

      DETAILS: Apple no longer includes the official GCC compiler with Xcode
      as of version 4.2. Instead, the `gcc` executable is a symlink to
      `llvm-gcc`, a modified version of GCC which outputs LLVM bytecode.

      For most programs the `llvm-gcc` compiler works fine. However,
      versions of Ruby older than 1.9.3-p125 are incompatible with
      `llvm-gcc`. To build older versions of Ruby you must have the official
      GCC compiler installed on your system.

      TO FIX THE PROBLEM: Install Homebrew's apple-gcc42 package with this
      command: brew tap homebrew/dupes ; brew install apple-gcc42

      You will need to install the official GCC compiler to build older
      versions of Ruby even if you have installed Apple's Command Line Tools
      for Xcode package. The Command Line Tools for Xcode package only
      includes `llvm-gcc`.

      BUILD FAILED (OS X 10.11.1 using ruby-build 20150818)

      $ brew tap homebrew/dupes ; brew install apple-gcc42
      ==> Tapping homebrew/dupes
      Cloning into '/usr/local/Library/Taps/homebrew/homebrew-dupes'...
      remote: Counting objects: 42, done.
      remote: Compressing objects: 100% (42/42), done.
      remote: Total 42 (delta 0), reused 4 (delta 0), pack-reused 0
      Unpacking objects: 100% (42/42), done.
      Checking connectivity... done.
      Tapped 39 formulae (103 files, 420K)
      ==> Installing apple-gcc42 from homebrew/homebrew-dupes
      ==> Downloading http://r.research.att.com/tools/gcc-42-5666.3-darwin11.pkg
      ######################################################################## 100.0%
      ==> /bin/pax --insecure -rz -f usr.pkg/Payload -s ,./usr,/usr/local/Cellar/apple-gcc42/4.2.1-5666.3,
      ==> Caveats
      NOTE:
      This formula provides components that were removed from XCode in the 4.2
      release. There is no reason to install this formula if you are using a
      version of XCode prior to 4.2.

      This formula contains compilers built from Apple's GCC sources, build
      5666.3, available from:

        http://opensource.apple.com/tarballs/gcc

      All compilers have a `-4.2` suffix. A GFortran compiler is also included.
      ==> Summary
      🍺  /usr/local/Cellar/apple-gcc42/4.2.1-5666.3: 104 files, 75M, built in 23 seconds

      $ rbenv install 1.8.7-p352
      Downloading ruby-1.8.7-p352.tar.gz...
      -> https://dqw8nmjcqpjn7.cloudfront.net/2325b9f9ab2af663469d057c6a1ef59d914a649808e9f6d1a4877c8973c2dad0
      Installing ruby-1.8.7-p352...
      Installed ruby-1.8.7-p352 to /Users/chrisroos/.rbenv/versions/1.8.7-p352

      Downloading rubygems-1.6.2.tgz...
      -> https://dqw8nmjcqpjn7.cloudfront.net/cb5261818b931b5ea2cb54bc1d583c47823543fcf9682f0d6298849091c1cea7
      Installing rubygems-1.6.2...
      Installed rubygems-1.6.2 to /Users/chrisroos/.rbenv/versions/1.8.7-p352

      $ rbenv rehash

      $ gem install bundler
      Fetching: bundler-1.10.6.gem (100%)
      Successfully installed bundler-1.10.6
      1 gem installed

      $ bundle install
      Fetching gem metadata from http://rubygems.org/..........
      Fetching version metadata from http://rubygems.org/..
      Resolving dependencies...
      Installing rake 0.9.2.2
      Installing RedCloth 4.2.7 with native extensions
      Installing activesupport 3.0.0
      Installing addressable 2.2.6
      Installing diff-lcs 1.1.3
      Installing directory_watcher 1.4.1
      Installing haml 3.0.25
      Installing hpricot 0.8.5 with native extensions
      Installing launchy 2.0.5
      Installing little-plugger 1.1.3
      Installing logging 1.6.1
      Installing loquacious 1.9.1
      Installing rdiscount 1.6.8 with native extensions
      Installing rspec-core 2.7.1
      Installing rspec-expectations 2.7.0
      Installing rspec-mocks 2.7.0
      Installing rspec 2.7.0
      Installing webby 0.9.4
      Using bundler 1.10.6
      Bundle complete! 5 Gemfile dependencies, 19 gems now installed.
      Use `bundle show [gemname]` to see where a bundled gem is installed.

      $ webby autobuild
      WARNING: Global access to Rake DSL methods is deprecated.  Please include
      ...  Rake::DSL into classes and modules which use the Rake DSL methods.
      WARNING: DSL method Webby::Apps::Main#import called at /Users/chrisroos/.rbenv/versions/1.8.7-p352/lib/ruby/gems/1.8/gems/webby-0.9.4/lib/webby/apps/main.rb:177:in `import_default_tasks'
      WARNING: DSL method Webby::Apps::Main#import called at /Users/chrisroos/.rbenv/versions/1.8.7-p352/lib/ruby/gems/1.8/gems/webby-0.9.4/lib/webby/apps/main.rb:177:in `import_default_tasks'
      WARNING: DSL method Webby::Apps::Main#import called at /Users/chrisroos/.rbenv/versions/1.8.7-p352/lib/ruby/gems/1.8/gems/webby-0.9.4/lib/webby/apps/main.rb:177:in `import_default_tasks'
      WARNING: DSL method Webby::Apps::Main#import called at /Users/chrisroos/.rbenv/versions/1.8.7-p352/lib/ruby/gems/1.8/gems/webby-0.9.4/lib/webby/apps/main.rb:177:in `import_default_tasks'
      WARNING: DSL method Webby::Apps::Main#import called at /Users/chrisroos/.rbenv/versions/1.8.7-p352/lib/ruby/gems/1.8/gems/webby-0.9.4/lib/webby/apps/main.rb:177:in `import_default_tasks'
      [17:22:46]  INFO: starting autobuild (Ctrl-C to stop)
      [17:22:47]  INFO: running the build
      [17:23:18]  INFO: running the build
