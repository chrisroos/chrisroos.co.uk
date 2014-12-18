---
summary:    Exploring `git log` along with its `before` and `after` options
blog_post:  true
title:      Confusing git log behaviour
created_at: 2015-11-20 16:20:25.608410 +00:00
guid:       d309caf9-53c2-4b67-9a70-defb2032d154
layout:     blog
filter:     haml
---
:markdown
  I was confused by the behaviour of `git log` when using the `before` and `after` options. After some playing I realised that it was because the default `git log` output shows the author date but the `before` and `after` options operate on the `commit` date.

  I can demonstrate the behaviour in an empty repository.

  ## Create a new git repo

      $ cd /tmp
      $ mkdir testing-git-log
      $ cd testing-git-log
      $ git init

  ## Create a file and add it to the repo

      $ touch file1
      $ git add file1
      $ git commit -m "Add file1"

  ## Edit the author and commit date of the commit

      $ GIT_COMMITTER_DATE="2015-01-02 09:00" \
      git commit --amend \
      --date "2015-01-01 09:00" \
      --reuse-message HEAD

  The `--date` option sets the author date of the commit.

  Setting `GIT_COMMITTER_DATE` affects the commit date of the commit when it’s amended.

  ## Check that the author and commit date have been set as expected

      $ git log --pretty=fuller
      Author:     Chris Roos <chris@seagul.co.uk>
      AuthorDate: Thu Jan 1 09:00:00 2015 +0000
      Commit:     Chris Roos <chris@seagul.co.uk>
      CommitDate: Fri Jan 2 09:00:00 2015 +0000

          Add file1

  ## Use git log to show commits on 1st Jan 2015

      $ git log --after "2015-01-01 00:00" --before "2015-01-01 23:59:59"
      # Nothing shown

  ## Use git log to show commits on 2nd Jan 2015

      $ git log --after "2015-01-02 00:00" --before "2015-01-02 23:59:59"
      commit 5f2c92e2b44ab697f92cb4336fd66c6206f56be2
      Author: Chris Roos <chris@seagul.co.uk>
      Date:   Thu Jan 1 09:00:00 2015 +0000

          Add file1
