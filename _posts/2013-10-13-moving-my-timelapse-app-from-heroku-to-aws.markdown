---
summary:    I ran into some of the limits with the free Heroku plan and moved the app to AWS
blog_post:  true
title:      Moving my timelapse app from Heroku to AWS
created_at: 2013-10-13 18:08:54.847076 +01:00
guid:       e3d6bffa-f81d-4a4c-93f0-c14766b68617
layout:     blog
---
:markdown
  I love [Heroku](https://www.heroku.com/) and tend to use the free resources to deploy apps when they're in their very early stages of development. I have a few things that I continue to use Heroku for but unfortunately ran into some of the limits with the [Thames Time Lapse project](https://github.com/chrisroos/thames-time-lapse).

  The first limitation was the number of rows in the free development database. The dev plan gives you 10,000 rows for free but I managed to get up to around 150,000 before receiving a warning email from Heroku. I only create around 1,000 rows a day, and I'm nowhere near 150 days in, so I'd obviously screwed up somewhere along the line.

  Another limitation was in my use of the [S3 gem](http://rubygems.org/gems/s3) to find the new images that had been uploaded to S3. As far as I can tell the gem doesn't understand S3 folders which meant that I had to scan the entire S3 bucket looking for new images. As more were uploaded, so this took longer and longer which just wasn't sustainable. Moving to AWS has allowed me to use the excellent [s3cmd](http://s3tools.org/s3cmd) command line interface to greatly improve the performance of looking for new images.

  Finally, having the app running on AWS should also make it easier to use imagemagick to create smaller versions of the images, and ffmpeg to automatically create a timelapse of each day of images.

  Instructions for settings up an AWS instance (I'm using a free micro instance) are in the README of the application should you be so inclined to play along.
