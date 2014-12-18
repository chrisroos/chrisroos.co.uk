---
summary:    Using command line tools to start exploring my Google Location History
blog_post:  true
title:      Exploring my Google Location History
created_at: 2014-11-01 09:44:26.585886 +00:00
guid:       14ac3ce0-6711-4dd9-af2b-3a5e604d4fda
layout:     blog
---
:markdown
  I used [Google Takeout][] to export my [Location History][] as JSON. I wanted to know what date range the file covered (it's not obvious from the Location History site) and figured I'd use command line tools rather than parsing the JSON.

  This is the command I ended up with to display the earliest timestamp in the file:

      $ cat LocationHistory.json | \
      grep timestampMs | \
      grep -o -E "\d+" | \
      sort | \
      head -n1 | \
      cut -c1-10 | \
      xargs -J% date -j -f "%s" %

      #=> Sun  4 Mar 2012 12:33:29 GMT

  ## Building the command

  Use `grep` to extract all the lines containing timestamps.

      $ head LocationHistory.json | \
      grep timestampMs

      #=> "timestampMs" : "1414831041235",

  Use `grep` to extract the timestamp from each line.

      $ head LocationHistory.json | \
      grep timestampMs | \
      grep -o -E "\d+"              # Find 1 or more digits and print the matching string

      #=> 1414831041235

  Use `cut` to strip off the milliseconds from the timestamp.

      $ head LocationHistory.json | \
      grep timestampMs | \
      grep -o -E "\d+" | \
      cut -c1-10                    # Ignore the last three digits (milliseconds) of the timestamp

      #=> 1414831041

  Use `date` to display the timestamp in a human friendly format.

      $ head LocationHistory.json | \
      grep timestampMs | \
      grep -o -E "\d+" | \
      cut -c1-10 | \
      xargs -J% date -j -f "%s" %   # Use `-j` to avoid setting the date
                                    # and -f "%s" to tell date to parse the string as unix time

      #=> Sat  1 Nov 2014 08:37:21 GMT

  The full command adds `sort` to ensure all timestamps are ordered and then either `head -n1` or `tail -n1` to print the earliest and latest dates respectively.

  [Google Takeout]: https://www.google.com/settings/takeout
  [Location History]: https://maps.google.co.uk/locationhistory/b/0
