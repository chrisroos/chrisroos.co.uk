---
blog_post: true
guid: 18ca96bd-e1e3-4b7f-9029-28cc9cdd1f46
title: Rails testing without database
date:       2006-02-23 08:16:00 +00:00
layout: blog
---

Just yesterday I wanted to create a very quick rails app that didn’t
rely on a database.

I removed :active\_record from the frameworks loaded in evironment, but
apparently this wasn’t quite enough. The setup and teardown methods in
Test::Unit::TestCase were still attempting to load fixtures (which
implies that active record is still present somewhere), which require
the presence of a database. This was causing tests not to run. Having
had a quick look at how active record intercepts the setup and teardown
methods, it was relatively simple to stop it from doing so.

Just add the code below within the Test::Unit::TestCase declaration in
test\_helper.

``` code
def self.dont_use_fixtures
  class_eval do
    def self.method_added(method); end
    def setup; end
    def teardown; end
  end
end
```

This still requires that you add dont\_use\_fixtures into each test
class definition.

``` code
class MyTest < Test::Unit::TestCase
  dont_use_fixtures
  def test_
    # my first test
  end
end
```

Having just written this it’s obvious now that it would make more sense
to not require the declaration in each test class (as we supposedly
don’t even have access to active record). We should probably also play
fair and pass messages back to our parent if method\_added isn’t being
called with either setup or teardown.

The new code becomes (again, in Test::Unit::TestCase definition in
test\_helper).

``` code
def self.method_added(method)
  super unless [:setup, :teardown].include?(method.to_sym)
end
def setup; end
def teardown; end
```

This appears to work ok…
