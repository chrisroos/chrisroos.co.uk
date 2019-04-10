---
blog_post: true
guid: b2b9da2d-69fa-4285-ad8c-33f4c66f744a
title: A great day at work and reevoovision (twittervision for reviews)
date:       2007-06-26 09:20:00 +01:00
layout: blog
---

A few of days ago I [came
across](http://twitter.com/chrisroos/statuses/114202552)
[twittervision](http://twittervision.com/). Just ten hours later I had
checked some code into [our](http://www.reevoo.com) repository that
allows us to do the same thing (as twittervision) but for our reviews.
Yup, it was a very good day indeed. Although the initial code was
complete within a few hours, it needed a bit of polishing (kudos to
[Paul](http://po-ru.com)) which meant that we only got it deployed
yesterday. I guess one working day between proof of concept and
deployment isn’t that bad… Anyway, go check it out -
[reevoovision](http://www.reevoo.com/vision.html).

The days events
---------------

I started the morning by creating an
[xml](http://en.wikipedia.org/wiki/Xml) feed of the ten most recently
published reviews. On filling a review, the reviewer is asked to enter
their town, which needed to be converted to latitude/longitude to allow
us to plot a point on the map. Luckily, a little googling revealed the
[geonames](http://www.geonames.org/) web service that did exactly what I
wanted. So, using a combination of [ruby](http://www.ruby-lang.org/en/),
[rails](http://rubyonrails.com/), [curl](http://curl.haxx.se/),
[hpricot](http://code.whytheluckystiff.net/hpricot/) and
[mongrel](http://mongrel.rubyforge.org/) I had a simple web server that
downloaded and parsed the reviews, converted place name to lat/long, and
plotted the results on a google map (with help from the
[fridays](http://pragmaticprogrammer.com/fridays.html) [google map
book](http://pragmaticprogrammer.com/titles/sdgmapi2/index.html)). A
good proof of concept but not quite right.

I was reminded that we collect the purchaser’s postcode from our
retailers. This, in combination with a [free
list](http://www.easypeasy.com/guides/article.php?article=64) of UK
[outcodes](http://en.wikipedia.org/wiki/UK_postcodes) (the first bit of
the postcode) against latitude/longitude, allowed for much greater
accuracy (well, to within about 2km) in plotting the location of the
reviewer.

The next step was to polish up the rough demo. Instead of the previous
server side hackery, I used the excellent [jquery](http://jquery.com)
javascript library to perform an “Ajax” request of the reviews and parse
the xml to build a simple hash of the required data. Using the
twittervision source as reference, I got a ‘proper’ (i.e. reviews
popping up in sequence) demo running.

From here, it was a basic case of tidying up some rough edges. Instead
of returning the reviews data as xml, I converted it to
[json](http://json.org/) to make for trivial parsing in javascript. I
also added the jquery
[dimensions](http://jquery.com/plugins/project/dimensions) plugin to
resize the containing div, and in turn the map, to the size of the page.
The final touch was attempting to keep the UK centered in the window.

Reevoovision currently selects and displays published reviews at random
to provide a constantly updating map, although maybe it’d be cool to get
it to display submitted/published reviews in real-time.

I can’t get over how addictive it is to watch the reviews pop-up all
over the country, it really emphasises the fact that these are actually
real people writing about their experiences. Hmm, that sounds a bit
sales & marketing. I do mean it though, honest.
