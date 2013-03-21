---
title: Introducing VCS integration with Pragmatic.ly
date: 2013-01-29 10:00 +08:00
tags: VCS, Lean Product Management, Integration
author: terry
---

Today, we're glad to introduce our new [VCS](http://en.wikipedia.org/wiki/Revision_control)(Version Control System) integration with Pragmatic.ly to the public. We have released this feature to some of our users in last two months and glad to hear how they love it. I'm sure you'll love the feature too!

[Pragmatic.ly](https://pragmatic.ly) is a lean collaborative project management tool featuring real time collaboration. We design the tool to be developer friendly and hope to help startup teams deliver better products, easier and faster. Developers like us work with VCS such as Git or SVN every day. The new VCS integration can deeply integrate with your current development process and improve your team productivity.

With VCS integrated into Pragmatic.ly, all the commits related to a ticket will be auto associated with that ticket and the commit message will be displayed in the activity timeline. As a result, your team will know the status update about that ticket immediately and go for a review if they want. It's a big benefit to code collobration. What's more, you can manipulate the status of tickets within your projects directly from the commit messages. There is no need to interrupt your work and visit Pragmatic.ly to mark the ticket as Completed or Accepted. Instead, let the commit message do the work!

Feel free to try this feature by signing up at [pragmatic.ly](https://pragmatic.ly).

![VCS Integration](/integrate-version-control-system-with-pragmat/vcs-integration.png)

So far, we have already supported three VCS services: [GitHub](https://github.com), [BitBucket](https://bitbucket.org) and [Gitlab](http://gitlab.org). And more are coming. Let us know if the VCS you're using now is not in the list and you want to see it soon!

##### How to setup #####

1. First, you should make sure the user name or the email is the same with what you use in your Pragmatic.ly account. If not, you can always set the setting in the project. For example:

        $ git config user.name "Terry Tai"
        $ git config user.email "terry@pragmatic.ly"

2. Get the commit hook url on your Pragmatic.ly project setting panel and copy this url to your clipboard. We will use it as the callback url latter. Only the administrators of the project can view the settings.

    ![Project Setting](/integrate-version-control-system-with-pragmat/project-list.png)

    ![Edit Project](/integrate-version-control-system-with-pragmat/edit-project.png)

3. As said, now Pragmatic.ly supports three services: Github, Bitbucket, Gitlab. Below are the integration steps for each service.

###### **Github** ######

1. Go to your project page on Github, click the 'Setting' tag of the project to go to project setting page.(If you don't see this tab, it means you don't have this permission. Please contact the owner of this project on Github.)

    ![GitHub Project Setting](/integrate-version-control-system-with-pragmat/github-project-setting.png)

2. Then click the 'Service Hooks', and choose the 'WebHook URLs'.
3. Paste the url to the field and click 'Update settings'.

    ![Github WebHook](/integrate-version-control-system-with-pragmat/github-webhook.png)

###### Bitbucket ######

1. Go to your setting page of your project on Bitbucket and click the 'Services' on side bar
2. Choose the the 'POST' from the select box and paste the URL on the url field
3. Click 'Save'

    ![BitBucket WebHook](/integrate-version-control-system-with-pragmat/bitbucket-webhook.png)

###### GitLab ######

The Gitlab configuration is the same as GitHub. So you can refer to the section how to configure GitHub.

##### How to use #####

1. Associate the commits with your ticket on Pragmatic.ly.

    For example we have a ticket whose number is 529.

    ![Ticket Example](/integrate-version-control-system-with-pragmat/ticket-example.png)

    There are two ways to associate your commits with a specify ticket.

    1. If you prefer to implement every new feature in a new branch, you could name a branch starting with the ticket number, such as 529_regenerate_token. Then all commits in this branch will be automatically associated with this ticket.
    2. If you want to associate the commit to a ticket no matter which branch it's in, you could alway include the hash tag with the ticket number such as '#529' in your commit message. For example:

            $ git commit -m "#529 Associate the commit with ticket 529."

2. Manipulate the status of tickets directly from the commit message.

    You can complete or close the tickets by using commands in your commit messages. The supported commands are as follows:

    1. complete (*completes, completed, resolve, resolves, resolved, solve, solves, solved, fix, fixes, fixed*) will change the status of the specified ticket to Completed.
    2. accept (*acceptes, accepted, close, closes, closed*) will change the status of the specified ticket to Accepted.

    Here are some examples of how to use this feature.

        $ git commit -m "Resolved #529 This will mark 529 as Completed"
        $ git comimt -m "Closed #529 This will mark 529 as Closed"

<br/>

We hope you enjoy this new feature, as always, any feedbacks are welcome!
