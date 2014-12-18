---
summary:    The ruby magic required to list controller filters in Rails 4
blog_post:  true
title:      Listing controller filters in Rails 4
created_at: 2013-08-19 18:24:13.084743 +01:00
guid:       b8968e4e-8239-44e9-af20-c017735c6d65
layout:     blog
---
  While trying to debug some [filter/callback](http://guides.rubyonrails.org/action_controller_overview.html#filters) weirdness in a Rails 4 app[1], I tried to work out how to list all the callbacks for an action. I spent a while digging through the code until I found out that you could get the callbacks from the `_process_action_callbacks` method. So, popping something like this in your index action will write all the callbacks to the page. Magic.

      def index
        render text: self._process_action_callbacks
      end

  [1] There's every chance that this same method works in earlier versions of Rails but I haven't tried it.
