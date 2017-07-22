## Converting to Jekyll

* Use html tidy, or simmilar, to tidy the html of the Webby and Jekyll versions of the site, before comparing the output. I'm aiming for them to be as close as possible before switching to Jekyll.

* Why are hashes being "escaped"? For example, "unless instance_variable_get("@\#{attribute}")" in 2006-03-01-ruby-quiz-number-67-metakoans.html.
  * It looks like I've manually escaped the hash in the raw content but I'm not sure why.

* Consider using excerpt in metadata, rather than summary. The excerpt name is already used by Jekyll.

## Other

* Display the date in the /blog listing. There's currently no indication of when something was written and it took me a while to work out how to find that information.

* Use a clearer date format on a single blog post. It's currently, for example, "Thu, 12 Apr 12".
