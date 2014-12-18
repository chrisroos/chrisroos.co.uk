---
summary:    Manually uploading activities that Garmin Fit was refusing to sync to Garmin Connect
blog_post:  true
title:      Manually uploading activities from Garmin Fit app
created_at: 2015-11-14 08:06:40.105783 +00:00
guid:       bcb7fe70-7b45-4965-8552-67aa13276fcb
layout:     blog
---
  I had two activities recorded on 12 Nov 2015 that weren’t syncing to Garmin Connect from the Garmin Fit app on my phone. I signed out and back in a number of times to try to force the sync (as per [Garmin's support page][garmin-fit-support]), but to no avail.

  I eventually used [Airdroid][airdroid-app] to download the two .fit files (stored in /SD Card/Android/data/com.garmin.android.apps.fitness/files/) from my phone to my laptop.

  I was able to manually import those files into [Garmin Connect][garmin-connect-site] and can now see the two activities as expected.

  After signing out and back in to the Garmin Fit app I noticed that the 2 activities on 12 Nov 2015 were now duplicated - presumably the versions on the phone were slightly different from the versions on the website. I fixed this by removing all the Garmin Fit app data from my phone and signing in one final time.

  ## Garmin Fit app has been removed

  While writing this I tried to find a link to the Garmin Fit app in the Google Play Store. While I can see it in my list of installed apps, it no longer appears in the public store. I also followed the link to the app in iTunes but that reports that it's no longer available in the UK store. I can't find any official information about the app being removed but [this thread on the Garmin forums suggests that it was removed in early 2015!][garmin-forum-thread].

  [airdroid-app]: https://play.google.com/store/apps/details?id=com.sand.airdroid&hl=en_GB
  [garmin-connect-site]: https://connect.garmin.com
  [garmin-fit-support]: https://support.garmin.com/support/searchSupport/case.faces?caseId=%7Ba3c0eb60-ff54-11e0-73d0-000000000000%7D
  [garmin-forum-thread]: https://forums.garmin.com/showthread.php?314912-Is-Garmin-Fit-gone
