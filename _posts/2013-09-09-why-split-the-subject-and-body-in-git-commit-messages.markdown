---
summary:    Examples of current git tooling that is designed to work with a separate subject and body in the commit message
blog_post:  true
title:      Why split the subject and body in git commit messages?
date:       2013-09-09 16:53:06.040609 +01:00
guid:       2eb2f5e1-748d-4a22-b94d-357e4047000e
layout:     blog
---
Tim Pope's, ["A Note About Git Commit Messages"](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) suggests that we should split our git commit message into subject and body, with a newline between the two. Tim lists some tools that make use of this split and I thought I'd follow that with some screenshots showing how this convention is used in four fairly common (well, I use them) git tools.

## [GitHub for Mac](http://mac.github.com/)

### With a long commit message on a single line

![GitHub.app with a long commit message on a single line](/images/git-commit-message-github-bad.png)

### With the commit message split into subject and body

![GitHub.app with the commit message split into subject and body](/images/git-commit-message-github-good.png)

## [Gitk](https://www.kernel.org/pub/software/scm/git/docs/gitk.html)

### With a long commit message on a single line

![Gitk with a long commit message on a single line](/images/git-commit-message-gitk-bad.png)

### With the commit message split into subject and body

![Gitk with the commit message split into subject and body](/images/git-commit-message-gitk-good.png)

## [GitX](http://gitx.frim.nl/)

### With a long commit message on a single line

![GitX with a long commit message on a single line](/images/git-commit-message-gitx-bad.png)

### With the commit message split into subject and body

![GitX with the commit message split into subject and body](/images/git-commit-message-gitx-good.png)

## [Git cli](http://git-scm.com/)

### With a long commit message on a single line

![Git cli with a long commit message on a single line](/images/git-commit-message-git-cli-bad.png)

### With the commit message split into subject and body

![GitX with the commit message split into subject and body](/images/git-commit-message-git-cli-good.png)
