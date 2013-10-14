---
summary:    How I get pictures of the Thames from my phone to my desktop background
blog_post:  true
title:      Automatically updating my desktop background from my Thames time lapse pictures
created_at: 2013-09-09 11:39:55.348897 +01:00
guid:       32f11fcc-2675-450a-885e-6107aba7760a
layout:     blog
filter:     haml
---
:markdown
  One of the things I wanted to do with the [pictures of the Thames that I've been capturing](/blog/2013-08-14-android-and-some-time-lapse-ish-magic) is to periodically update my desktop background to show the most recent image.

  I was investigating how best to hook it all up when I came across this article that describes how to [Set the Desktop Picture to NASA Image of the Day](http://www.macosxautomation.com/automator/examples/ex08/03.html). I figured that I could add a feed of the recent images to the [thames-time-lapse website](http://thames-time-lapse.chrisroos.co.uk/images) and follow the same workflow to set my desktop background.

  Once I had the workflow downloading images and automatically setting my desktop background, I added a cron job to execute that workflow every 15 minutes.

  Another thing I've been meaning to do is try to improve the quality of some of the images: They're being taken through a pretty dirty window and suffer from both the dirt and reflections as the light changes during the day. I'm hoping that the increased visibility of the images will prompt me to do something about this sooner rather than later.
