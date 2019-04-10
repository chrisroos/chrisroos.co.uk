---
blog_post: true
guid: 5aa190cb-86d6-43fd-aec3-c36e4e8cb404
title: Operating systems should be managed by version control
date:       2005-11-27 08:24:00 +00:00
layout: blog
---

I spent from about 09:30 until 15:00 yesterday trying to get some
graphics software talking to two output devices (basically printers) on
Windows.

On arrival, it kinda worked, although not as requested. There were some
additional problems that needed to be sorted too.

I managed to go from a working state to a non-working state very quickly
(great) and then had to spend several hours trying to return it. In the
end, I had one of the connected machines talking correctly but couldn’t
for the life of me work out the other one.

I found myself trying to diagnose the problem (complaints of missing
driver files / mis-communication between ports) using several (very
good) utilities from [sys internals](http://www.sysinternals.com).
Indeed these did help to a certain extent but it was not easy.

Coming from a development perspective where every little change is
registered in version control, it got me to thinking. If the changes to
an operating system were version controlled I’d be able to see exactly
what changed during every ‘upgrade’ to the OS, making it potentially
easier to spot the cause of a problem and far easier to roll back to a
working state.

I know that Windows XP (which this machine was running) offers a kind of
‘rollback’ functionality; but, to be honest, I don’t trust it in the
slightest; hence not using it.

Mmm, I think I might install a fresh copy of XP, add all files to
version control (which I guess might not even work), change something
and then diff between the versions. I can already think of problems when
diffing registry files as they are in binary format so it will not be
easy to see differences.. Although, I guess it wouldn’t be too difficult
to store registry files in a text format, i.e. customize the version
control somehow. Just an idea.
