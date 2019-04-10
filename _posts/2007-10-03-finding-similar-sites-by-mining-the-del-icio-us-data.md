---
blog_post: true
guid: e077b11a-f34d-4b07-aded-4d4d9fe8ea0e
title: Finding similar sites by mining the del.icio.us data
date:       2007-10-03 08:00:00 +01:00
layout: blog
---

So this is very much proof of concept and definitely not very useful in
its current form…

You need to execute this javascript in the context of a webpage. In
[firebug](http://getfirebug.com/) (for example), paste it into the
console and run.

``` code
// Execute this within an existing webpage, using, for example, firebug console
function includeDelicious() {
  function loadScript(scriptUrl) {
    var scriptTag = document.createElement('script');
    scriptTag.setAttribute('type', 'text/javascript');
    scriptTag.src = scriptUrl;
    document.body.appendChild(scriptTag);
  }
  loadScript('http://s3.amazonaws.com/seagul/delicious.js');
}
if (typeof(getRelatedPosts) != 'function') { includeDelicious(); }
```

The javascript above loads this
[script](http://s3.amazonaws.com/seagul/delicious.js) that in turn loads
[md5.js](http://s3.amazonaws.com/seagul/md5.js),
[jquery.js](http://s3.amazonaws.com/seagul/jquery.js), does some magic
with the [del.icio.us](http://del.icio.us) [json](http://www.json.org)
[feeds](http://del.icio.us/help/json/) before finally writing some
‘similar’ sites to the bottom of the page you’re currently looking. At
the moment it finds the three most recent sites you’ve bookmarked for
each of the tags that people have used when bookmarking the site you’re
looking at. It writes all this to the bottom of the current page, as
this [screenshot](http://flickr.com/photos/chrisjroos/1474875125/)
shows.

Lots of things to do before this could possibly be deemed useful but I
think it’s got some potential.
