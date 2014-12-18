---
summary:    An introduction to the simple Bookmark printing service for the Go Free Range Printer platform.
blog_post:  true
title:      Bookmark printing service for the Go Free Range Printer platform
created_at: 2012-04-12 17:36:00.295575 +01:00
guid:       d605a057-02c2-4506-b49b-78e8695614eb
layout:     blog
---
  I've spent the last couple of days creating a simple service for the [Printer platform][].  This service allows you to print a bookmark (in the traditional sense) for the book you're reading.  Although it's probably of most use to those people with their own printers, you can definitely have a play with generating your own bookmarks (and see a printed example) over on the [Printer bookmarks app on Heroku][].

  The idea of a book-specific bookmark, on which I can record when I start and finish along with some reading notes, appeals to me.  I can actually imagine that a custom bookmark printing service like this might be useful outside of this little experiment with the Printer platform.

  Developing this little bookmark application ([source on github][]) allowed me to use the Printer platform in anger, which was great as I'd only really been following [James A][]'s impressive work from the sidelines.

  ## Building the bookmark service

  The rest of this post is a fairly high level view of how I approached the development of this little service.  Hopefully I'll convey how simple it is to build your own Printer service.

  I started by looking at the example [Printer Mail][], [Printer Paint][] and [Printer Weather][] apps.  While these services are geared toward sending content (from a person in the case of mail and paint, and from a machine in the case of weather) to another person's printer, I think the bookmark service is most useful for someone wanting to print to their own printer.  This made my life a little easier as it meant I didn't need to worry about storing printer details in my app: I could rely on the user entering their printer address at the time they wanted to print the bookmark.

  The first thing I did was create a simple html bookmark (see [7652ba][]) that I could preview using the [Printer API][] (you can think of the Printer API as something like [Google Cloud Print][] for receipt printers).  Once happy that the preview looked OK I moved on to making the bookmark dynamic based on a supplied Amazon URL (see [3f5377][]).  The addition of some tests allowed me to refactor the code in preparation for the simple Sinatra web interface (see [a75e4a][]).  Once able to view the bookmarks in a browser I wanted them to look a little closer to how they'd look once printed.  Fortunately, I was able to borrow the template from the Printer Mail app to do just that (see [0ba536][]).  I had the app deployed to [Heroku][] by this time so I was "done" in the most simple of senses: I could use the publicly accessible bookmark preview (e.g. [bookmark for The Da Vinci Code][]) to print to the [Go Free Range Printer backend][].  After that, apart from making it easier to print (see [d84b75][]) and preview (see [617d24][]) bookmarks, the remainder of the changes were mainly aesthetic.  Pretty simple, huh.

  For more information about the Printer platform and how to get involved, checkout any or all of the [introductory blog post][], the [Printer wiki][] and the [Printer platform][].  For more information about building these sort of content applications see [Building Content Services][] on the wiki.

  [bookmark for The Da Vinci Code]: http://printer-bookmarks.heroku.com/bookmark?url=http%3A%2F%2Fwww.amazon.co.uk%2FThe-Vinci-Code-Dan-Brown%2Fdp%2F0552149519%2Fref%3Dsr_1_2%3Fie%3DUTF8%26qid%3D1334252406%26sr%3D8-2
  [Building content services]: https://github.com/freerange/printer/wiki/Building-content-services
  [Go Free Range Printer backend]: http://printer.gofreerange.com/
  [Google Cloud Print]: http://www.google.com/cloudprint/learn/
  [Heroku]: http://www.heroku.com/
  [introductory blog post]: http://gofreerange.com/hello-printer
  [James A]: http://gofreerange.com/james-adam
  [Printer platform]: http://gofreerange.com/printer
  [Printer bookmarks app on Heroku]: http://printer-bookmarks.heroku.com/
  [Printer API]: https://github.com/freerange/printer/wiki/API
  [Printer Mail]: https://github.com/freerange/printer-mail
  [Printer Paint]: https://github.com/freerange/printer-paint
  [Printer Weather]: https://github.com/freerange/printer-weather
  [Printer wiki]: https://github.com/freerange/printer/wiki
  [source on github]: https://github.com/freerange/printer-bookmarks
  [7652ba]: https://github.com/freerange/printer-bookmarks/commit/7652ba185832ecf1e7e7bad44442d4292b5d5e1a
  [3f5377]: https://github.com/freerange/printer-bookmarks/commit/3f5377c3b8809565ebb6cc26aad11075a073a625
  [a75e4a]: https://github.com/freerange/printer-bookmarks/commit/a75e4aa20a3eb3f3f90480636719443322841502
  [0ba536]: https://github.com/freerange/printer-bookmarks/commit/0ba53664fc3cfa091567ef678cad0211811acb8e
  [d84b75]: https://github.com/freerange/printer-bookmarks/commit/d84b751bda676fefceb286519cda31d6610b7e79
  [617d24]: https://github.com/freerange/printer-bookmarks/commit/617d24ff5d1ed2460b151aa09f4cbfa2f510015b
