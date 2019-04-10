---
blog_post: true
guid: d8c7bb3d-65b6-4003-999c-e0853f686f6f
title: Visualising the changing responsibilities of objects
date:       2007-01-29 21:17:00 +00:00
layout: blog
---

By parsing the output of svn diff, we can concisely display the
responsibilities that have been added/removed to various objects. It is
based on the assumption that our tests capture these changes.

Taking a very simple (and partially made up) diff:

``` code
Index: test/amount_test.rb
===================================================================
--- test/amount_test.rb (revision 2)
+++ test/amount_test.rb (working copy)
@@ -2,9 +2,8 @@

 class AmountTest < Test::Unit::TestCase

-  def test_should_format_amount
-    formatted_amount = Amount.format(5, '$')
-    assert_equal '$5.00', formatted_amount
+  def test_should_flunk
+    flunk
   end
```

And piping it through the diff\_parser, we get:

``` code
--- Amount
+ should flunk
- should format amount
```

The output is in a diff-like format so that we can pipe it straight into
[TextMate](http://www.macromates.com) and benefit from the colour
formatting therein.

diff\_parser.rb
---------------

``` code
#!/usr/bin/env ruby

class Test
  def initialize
    @added, @removed = [], []
  end
  def add_responsibility(responsibility)
    @added << responsibility
  end
  def remove_responsibility(responsibility)
    @removed << responsibility
  end
  def added_responsibilities
    (@added - @removed).sort
  end
  def removed_responsibilities
    (@removed - @added).sort
  end
  def added_responsibilities?
    !added_responsibilities.empty?
  end
  def removed_responsibilities?
    !removed_responsibilities.empty?
  end
  def changed_responsibilities?
    added_responsibilities? || removed_responsibilities?
  end
end

tests = {}
class_under_test = ''

while line = gets
  if line =~ /Index: (.*)/
    if (test_name = File.basename($1, '.rb')) =~ /_test$/
      name_of_class_under_test = test_name.sub(/_test/, '')
      class_under_test = name_of_class_under_test.capitalize.gsub(/_(\w)/) { |m| $1.capitalize }
      tests[class_under_test] = Test.new
    end
  else
    if line =~ /-\s*def test_(.*)/
      responsibility = $1.gsub(/_/, ' ')
      tests[class_under_test].remove_responsibility(responsibility)
    elsif line =~ /\+\s*def test_(.*)/
      responsibility = $1.gsub(/_/, ' ')
      tests[class_under_test].add_responsibility(responsibility)
    end
  end
end

tests.sort.each do |test_name, test|
  if test.changed_responsibilities?
    puts '--- ' + test_name
    test.added_responsibilities.each { |responsibility| puts '+ ' + responsibility } if test.added_responsibilities?
    test.removed_responsibilities.each { |responsibility| puts '- ' + responsibility } if test.removed_responsibilities?
    puts ''
  end
end
```
