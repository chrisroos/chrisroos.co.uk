---
blog_post: true
guid: f2559cee-46db-4e78-89db-6793fd70f01b
title: NewNet and BT Broadband problems
date:       2007-11-16 13:38:00 +00:00
layout: blog
---

I’ve been having broadband problems for about 6 weeks now. My connection
continually drops in and out and when it does connect, it does so at
about 100Kbps. I held off getting a [BT](http://www.bt.com) engineer
involved because I didn’t want to have to pay the £200 if it turned out
to be my fault. Having satisfied myself that I hadn’t done anything
stoopid, I called [NewNet](http://www.newnet.co.uk/) and arranged for
the BT engineer to come round this morning. He was able to confirm that
my line was capable of connecting at around 5Mbps (I’m on the upto 8Mbps
service) but noticed that there was a high [Signal to
Noise](http://en.wikipedia.org/wiki/Signal-to-noise_ratio) ratio on the
line (around 19dB I think). He mentioned that the SNR should be around
10dB and that this might be the cause of my connectivity problems. He
then went to the local junction box to test the line between my house
and the junction box and the junction box and the exchange. The line
between the house and the junction box was OK but he changed the line
between the junction box and the exchange to rule out any problems at
that end. Even with these changes, he was still seeing a high SNR. He
then mentioned that he’d spoken to the helpdesk and they informed him
that my line had been limited at 135Kbps. This explained the poor
performance once I was actually connected. It also explains (I think)
why I would see downstream connections of around 5Mbps in my router
status but only actually download at around 100Kbps according to the
[thinkbroadband](http://www.thinkbroadband.com/)
[speedtest](http://www.thinkbroadband.com/speedtest.html). I guess that
my [Netgear
DG834G](http://www.netgear.co.uk/wireless_adslrouter_dg834g.php)
actually reports the potential line speed rather than the actual speed
of the connection. In theory, the fact that my line is limited should
sort itself out but I’ve been informed to call NewNet if it’s no better
within the next couple of days.

Fun and games eh.
