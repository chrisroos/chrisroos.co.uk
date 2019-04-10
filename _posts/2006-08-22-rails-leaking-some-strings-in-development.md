---
blog_post: true
guid: 17e3dfab-6ca4-4245-94ad-181079e16b37
title: Rails leaking some strings in development
date:       2006-08-22 10:47:00 +01:00
layout: blog
---

I spent some time this morning checking out [Scott
Laird’s](http://scottstuff.net/blog/) [memory
profiler](http://scottstuff.net/blog/articles/2006/08/17/memory-leak-profiling-with-rails)
against a fresh rails app.

I was suprised to see that around 110 strings were being leaked on each
request. I was incredibly surprised when I used the string\_debug option
(to the memory profiler) to generate logs of strings living in
ObjectSpace. There were strings appearing that I *knew* were not in my
new rails app anywhere.

After grepping my working directory for some of these strings (and not
coming up with anything), [James](http://blog.floehopper.org) suggested
that the strings could be in my irb history. Although it wasn’t
immediately obvious how they were appearing, the strings were indeed in
my history (just over 100 lines worth.)

A little inspection and the culprit was found. The [rails breakpoint
library](http://api.rubyonrails.com/classes/Breakpoint.html) requires
irb, which loads the irb\_history.

In summary: the contents of irb\_history are loaded into object space on
each request made to your rails app, while in development. These strings
do not appear to get garbage collected. The problem does not affect apps
running in production as the breakpoint library is not loaded in that
environment.
