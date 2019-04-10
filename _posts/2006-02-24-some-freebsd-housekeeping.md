---
blog_post: true
guid: 0a1ea791-3669-4975-847f-28335e7fe729
title: Some Freebsd housekeeping
date:       2006-02-24 15:17:00 +00:00
layout: blog
---

I use [exonetric](http://www.exonetric.com/) to host this
[typo](http://www.typosphere.org) instance. It’s on a
[freebsd](http://www.freebsd.org) virtual server so I have to maintain
everything. For a long time, I’ve been using
[mysql](http://www.mysql.org) 4. This is fine apart from a problem
during initial installation causing it not to start automatically on
machine restart. This meant that whenever the virtual machine was
rebooted I had to manually restart mysql, which basically wouldn’t
happen until I actually noticed it - not cool.

I spent the time today to upgrade to mysql 5. Luckily this solved the
auto start problem and mysql now comes up with the machine.

Although incredibly interesting (hmm) that wasn’t really the point of
the post. This is… Since using freebsd I’ve always relied on
[ports](http://www.freebsd.org/ports/) (instructions for compilation of
software) for the installation of software. When installing mysql today,
I used the pre-compiled package binary instead. I’m amazed at how much
faster it is; and now really can’t believe I’ve been bothering with the
ports all this time. I guess it was some kind of anal retentive control
I thought I was getting by compiling the software myself; when infact I
was only ever compiling with the default options and just wasting time…
Ho hum.

Two moral’s here me thinks. Use packages if you don’t know what you’re
doing (I don’t). Don’t mess around with things you don’t understand
(manually deleting ports dir before un-installing ports and then
expecting packages to just overwrite them. Oh well, it seems ok).
