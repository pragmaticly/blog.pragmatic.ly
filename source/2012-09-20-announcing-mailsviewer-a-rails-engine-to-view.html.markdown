---
title: "Announcing mails_viewer - easiest way to test mails in Rails app"
date: 2012-09-20 06:30 +08:00
tags: open source, rails, mail, engine
keywords: open source, rails, mail, engine
author: dingding
---

*Q:* "I implemented the mail template but how can I preview the mail in my machine?"

*Q:* "I'm running out of emails to test the signup on staging server. Do you have more?"

*Q:* "I accidently sent the mail to test@example.com. I thought the email adress doesn't exist!"

Familiar? I have been asked many times of those questions these years. The requiremeent is simple. Write mailer model, send mail and then verify every part works as expected. But when we're in non-production environment, either development machine or staging server, it's always painful to test mails. Put simple, we just want:

* To preview all the sent mails easily
* To browse the mails easily, for everyone in the team.
* To allow conditioned mails to real sent out.

We feel the same pain at [Pragmatic.ly](https://pragmatic.ly) and that's why we built [mails_viewer](https://github.com/pragmaticly/mails_viewer), a mails preview Engine which provides a table view for all mails under tmp/mails. It's a fork of tomlion's [original code](https://github.com/tomlion/mails_viewer) and I'm glad to be the maintainer. Thanks for tomlion for getting this thing started!

![mails_viewer](/images/announcing-mailsviewer-a-rails-engine-to-view/mails-viewer.png "Mails Viewer")

Generally speaking, mails_viewer is a Rails engine. So it's very easy to integrate it into your rails apps. And it depends on the file delivery method of ActionMailer.

### Usage ###

1.  Add the gem to your Gemfile :

        gem "mails_viewer"

2.  Set ActionMailer's delivery method to :file :

        config.action_mailer.delivery_method = :file

3.  Put this in your routes.rb:

        mount MailsViewer::Engine => '/delivered_mails'

Now just load up http://localhost:3000/delivered_mails

### Advanced ###

*Q:* "I hope the mails sent to my own domain can send to my inbox and I can review it using my favorite client. Does mails_viewer support that?"

We have the same requirement. You can just pass a send_if Proc to the configuration and detect whether the mail object satisfy the condition or not. For example,

```ruby
config.action_mailer.delivery_method = :file
config.action_mailer.file_settings = {
  location: 'tmp/mails',
  smtp_settings: {
    address:              "localhost",
    port:                 25,
    domain:               'localhost.localdomain',
    user_name:            nil,
    password:             nil,
    authentication:       nil,
    enable_starttls_auto: true
  },
  send_if: lambda { |mail| mail.destinations.select { |address| address =~ /@pragmatic.ly$/ }.any? }
}
```

For more information, please check out the [project page](https://github.com/pragmaticly/mails_viewer) on github.

### Other Gems ###

We're not alone. There are already several gems fixing the same problem, such as [mail_view](https://github.com/37signals/mail_view) from 37signal, [letter_opener](https://github.com/ryanb/letter_opener) by Ryan Bytes, [MailCatcher](http://mailcatcher.me/) by Samuel Cochran and [mail_safe](https://github.com/myronmarston/mail_safe) by Myron Marston. However, I would say mails_viewer is the best fit if you need the mails to be browsable, readable and sendable easily. Your QA will love you if you use mails_viewer!

<br/>

### About Pragmatic.ly ###

[Pragmatic.ly](https://pragmatic.ly) is a lean collaborative project management tool aiming to help small teams make better products easier. It's the ideal and elegant project management tool for tech startups.

Now that you've read so far, you should follow me [@yedingding](https://twitter.com/yedingding)!
