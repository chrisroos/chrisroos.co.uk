---
summary:    The behaviour of XMLHttpRequest.withCredentials when used with CORS
blog_post:  true
title:      Investigation into CORS And XMLHttpRequest
created_at: 2013-03-08 12:46:37.897127 +00:00
guid:       100345a0-53f5-40ed-9f43-67bbec484f64
layout:     blog
---
:markdown

  It's taken me a good couple of days to really understand the purpose of `withCredentials`, and in particular the fact that it (currently, at least) has nothing to do with the username and password you can supply to `XMLHttpRequest.open()`. I figured I'd write it up as it might save other people some time.

  The following examples all use the [rails-json-cors-and-http-auth](https://github.com/chrisroos/rails-json-cors-and-http-auth) Rails app which is currently hosted at [http://rails-json-cors-and-http-auth.herokuapp.com/](http://rails-json-cors-and-http-auth.herokuapp.com/).

  Where I talk about Chrome, Safari and Firefox, I'm talking specifically about Chrome Stable 25.0.1364.155, Safari 6.0.2 (8536.26.17) and Firefox 19.02.

  ### Before CORS

  Before [CORS][], executing the following Javascript snippet from a domain other than the one hosting the Rails app (you can do this by visiting [example.com](http://example.com) and executing the javascript in Chrome's developer console) would have resulted in an error.

      var url = 'http://rails-json-cors-and-http-auth.herokuapp.com/people';
      var req = new XMLHttpRequest();
      req.onload = function() { console.log(this.responseText); };
      req.open('get', url, true);
      req.setRequestHeader('Accept', 'application/json');
      req.send();

  Chrome and Safari would warn you with:

  > XMLHttpRequest cannot load http://rails-json-cors-and-http-auth.herokuapp.com/people. Origin http://www.iana.org is not allowed by Access-Control-Allow-Origin.

  While Firefox warns you with the following slightly confusing error message (you can tell it's an error because it's in red (well, in Firefox it is, not here) and everything):

  > GET http://rails-json-cors-and-http-auth.herokuapp.com/people 200 OK.

  ### CORS to the rescue

  If we make that same request again (ensuring we're still on a different domain to that of the Rails app), but this time tell the server to send us some CORS headers, we'll see that we can now make a cross domain Javascript GET request.

      var url = 'http://rails-json-cors-and-http-auth.herokuapp.com/people';
      url = url + '?enable_cors_headers=true';
      var req = new XMLHttpRequest();
      req.onload = function() { console.log(this.responseText); };
      req.open('get', url, true);
      req.setRequestHeader('Accept', 'application/json');
      req.send();

  This was tested as working (i.e. the browser rendered the JSON response) in Chrome, Firefox and Safari.

  ### CORS and HTTP Basic Authentication without the `withCredentials` option

  So far so good, but what happens if we protect our Rails app using HTTP Authentication?

      var url = 'http://rails-json-cors-and-http-auth.herokuapp.com/people';
      url = url + '?enable_cors_headers=true&enable_http_auth=true';
      var req = new XMLHttpRequest();
      req.onload = function() { console.log(this.responseText); };
      req.open('get', url, true);
      req.setRequestHeader('Accept', 'application/json');
      req.send();

  Chrome and Safari offer up this error message:

  > XMLHttpRequest cannot load http://rails-json-cors-and-http-auth.herokuapp.com/people?enable_cors_headers=true&enable_http_auth=true. Origin http://www.iana.org is not allowed by Access-Control-Allow-Origin.

  It's not immediately obvious what the problem is here unless you inspect the server logs and see the 401. I'd expect to be able to inspect the network request using the Chrome developer tools but they behave slightly oddly in this case: they don't display the response even though the server sent one. Instead, they just display the GET request with a status of (canceled).

  Firefox offers this slightly more helpful error message:

  > "NetworkError: 401 Unauthorized  - http://rails-json-cors-and-http-auth.herokuapp.com/people?enable_cors_headers=true&enable_http_auth=true"

  ### CORS and HTTP Basic Authentication with the `withCredentials` option

  OK, so what's the `withCredentials` option all about? Let's set it and find.

      var url = 'http://rails-json-cors-and-http-auth.herokuapp.com/people';
      url = url + '?enable_cors_headers=true&enable_http_auth=true';
      var req = new XMLHttpRequest();
      req.onload = function() { console.log(this.responseText); };
      req.open('get', url, true);
      req.setRequestHeader('Accept', 'application/json');
      req.withCredentials = true;
      req.send();

  Presuming you haven't entered the HTTP auth username and password in your current session, here's the behaviour you'll see:

  Chrome and Safari will display the standard 'not allowed' error message:

  > XMLHttpRequest cannot load http://rails-json-cors-and-http-auth.herokuapp.com/people?enable_cors_headers=true&enable_http_auth=true. Origin http://www.iana.org is not allowed by Access-Control-Allow-Origin.

  Firefox will both display the following error message *and* the basic auth popup allowing you to enter your credentials:

  > "NetworkError: 401 Unauthorized  - http://rails-json-cors-and-http-auth.herokuapp.com/people?enable_cors_headers=true&enable_http_auth=true"

  It's worth noting here that Chrome Beta (26.0.1410.19) and Chrome Dev (27.0.1430.0) also show the HTTP auth popup dialog, which leads me to assume that the current behaviour (in Stable) is on the buggy side.

  Now, let's do the same thing again but first enter our username/password in a different tab/window of the same browser session. If you've done that and then replay the snippet from above you should see the JSON response correctly rendered in the Javascript console in all of Chrome, Safari and Firefox.

  In summary, the use of `withCredentials` tells all the browsers to send the Authorization header (and cookies but I'm not so interested in those) with the XMLHttpRequest. In addition, when set, it also allows Firefox to display the http auth dialog in response to a 401 from the XMLHttpRequest.

  ## Wow that's awesome, but what does this have to do with passing a username and password to `XMLHttpRequest.open()`

  Well, it turns out that the answer to that is absolutely nothing.

      var url = 'http://rails-json-cors-and-http-auth.herokuapp.com/people';
      url = url + '?enable_cors_headers=true&enable_http_auth=true';
      var req = new XMLHttpRequest();
      req.onload = function() { console.log(this.responseText); };
      req.open('get', url, true, 'username', 'password');
      req.setRequestHeader('Accept', 'application/json');
      req.withCredentials = true;
      req.send();

  Execute this snippet (note the setting of the username and password in `open()`) in a new browser session and you'll the following behaviour.

  In Chrome and Safari we see our standard 'not allowed' error message:

  > XMLHttpRequest cannot load http://rails-json-cors-and-http-auth.herokuapp.com/people?enable_cors_headers=true&enable_http_auth=true. Origin http://www.iana.org is not allowed by Access-Control-Allow-Origin.

  In addition, we can observe that the Authorization header isn't constructed or sent, causing the server to respond with a 401. We see the same odd behaviour where the Chrome Developer tools show the GET request as (canceled) and doesn't show the response at all.

  Firefox displays a different error to any that we've seen before:

  > "Error: Access to restricted URI denied"

  Interestingly enough, we don't see any request being made to the server in this case so something in the code must be stopping the request from even going out.

  ## Finally, manually setting the Authorization header

  This is just here for a bit of completeness, really. It demonstrates that given the [relevant CORS headers][1], and client side logic (to generate the username/password hash) you can avoid the use of `withCredentials` and of supplying the username and password to `open()`.

  *NOTE* The username/password hash below is hardcoded to that of 'username' and 'password'.

      var url = 'http://rails-json-cors-and-http-auth.herokuapp.com/people';
      url = url + '?enable_cors_headers=true&enable_http_auth=true';
      var req = new XMLHttpRequest();
      req.onload = function() { console.log(this.responseText); };
      req.open('get', url, true);
      req.setRequestHeader('Accept', 'application/json');
      req.setRequestHeader('Authorization', 'Basic dXNlcm5hbWU6cGFzc3dvcmQ=');
      req.send();

  ### What does this all even mean

  This whole investigation started because I wanted to add a JSON API to [Roosmarks][] so that I could build a [Chrome extension](https://github.com/chrisroos/roosmarks-chrome-extension). State changing actions on Roosmarks are protected by http authentication so I'd hoped to be able to have the extension authenticate to Roosmarks in order to provide a fairly seemless experience. It doesn't look like this is going to be possible but, having done all this investigation, I'm not so worried about it anymore: I'm pretty happy that the extension can rely on the user having previously authenticated to Roosmarks before it works as expected. In fact, there's every chance that I won't even use the JSON API in the extension, and just render the actual website itself. I need to explore than idea further, though.

  [CORS]: http://www.w3.org/TR/cors/
  [1]: https://github.com/chrisroos/rails-json-cors-and-http-auth/commit/800ad64186f3d8814d8dcde0005225ce43af5172
  [Roosmarks]: https://github.com/chrisroos/roosmarks
