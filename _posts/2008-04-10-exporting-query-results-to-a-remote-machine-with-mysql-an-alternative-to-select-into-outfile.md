---
blog_post: true
guid: 3ba09b50-ed76-46e9-9179-8655c943c005
title: Exporting query results to a remote machine with MySql (an alternative to SELECT INTO OUTFILE)
date:       2008-04-10 16:45:29.584250 +01:00
layout: blog
---

Exporting query results to a remote machine with MySql (an alternative
to SELECT INTO OUTFILE)

[MySql’s](http://mysql.com) [SELECT INTO
OUTFILE](http://dev.mysql.com/doc/refman/5.0/en/select.html) syntax
provides a nice way to export the results of a query into a tab
delimited (by default) text file. Unfortunately, the file has to be
created on the MySql host (by a user with file permissions), rendering
it unsuitable for dumping the data to a remote machine. If you wish to
dump the query results to a different machine then the [mysql
docs](http://dev.mysql.com/doc/) suggest redirecting the output from the
mysql command line client:

> The SELECT … INTO OUTFILE statement is intended primarily to let you
> very quickly dump a table to a text file on the server machine. If you
> want to create the resulting file on some client host other than the
> server host, you cannot use SELECT … INTO OUTFILE. In that case, you
> should instead use a command such as mysql -e “SELECT …” \> file\_name
> to generate the file on the client host.

This works great but the default output you’ll get from redirecting
STDOUT won’t be the same as using SELECT INTO OUTFILE. The two main
(only?) differences are, in the redirected output, the addition of the
headers and that NULL values are output as NULL instead of the special
\\N (backslash-N) sequence. We can fix both of these things by
specifying an optional switch (skip-column-names) to the mysql client
and employing some [sed](http://en.wikipedia.org/wiki/Sed) magic.

``` code
mysql -h"my-host" -u"my-user" -p"my-password" -e"select * from my-database.my-table" --skip-column-names |\
  sed -e 's/[[:<:]]NULL[[:>:]]/\\N/g' >\
  my-export-directory/my-table.csv`
```

That sed magic is replacing instances of NULL, surrounded by some
whitespace, with the special \\N escape sequence.

Oh, and it’s probably worth mentioning that this is only really
important if you want to load this data back into mysql (using [LOAD
DATA INFILE](http://dev.mysql.com/doc/refman/5.0/en/load-data.html) for
example). If you were to load the default output, from redirecting the
mysql client, back into mysql then you’d end up with an unwanted header
row and NULL strings (or 0 for numeric columns) where you expected
actual NULL values.

It took us a while to figure this out so I thought it might be of some
use to others.
