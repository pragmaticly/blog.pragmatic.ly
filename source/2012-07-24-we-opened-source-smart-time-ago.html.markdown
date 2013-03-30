---
title: "Announcing Smart Time Ago"
date: 2012-07-24 02:00 +08:00
tags: open source, JavaScript, jQuery, smart-time-ago
author: terry
---

The relative timestamps like "5 minutes ago" are more and more used in web applications. So web frameworks like [Ruby on Rails](http://rubyonrails.com) have a builtin helper method to change timestamps to relative timestamps easily on server side as following,

```ruby
time_ago_in_words(item.created_at)
```

But If you use relative timestamps, you should update them on the client side to make sure the users always seeing the correct relative timestamps. And there is already an awesome library to do this job, which is [Timeago](http://timeago.yarp.com/). Thanks to Yarp.com, the author of Timeago.

However, after trying the library in depth, we found that it doesn't fit well in [Pragmatic.ly](https://pragmatic.ly). As a real time single-page application, our users may not refresh the page for days, so refreshing the relative timestamps per minute is meaningless and wasteful.

We need a more efficient solution. So we built [Smart Time Ago](http://pragmaticly.github.com/smart-time-ago/).

### Why Smart ###

Instead of updating the relative timestamps every minute, smart-time-ago can dynamically tune the checking time interval to a proper value depending on the newest time on the page.

For example, if the newest time is '2 hours ago', there is no need to check and update the relative timestamps per minute. Instead, 30 minutes is a better choice.

[Smart Time Ago](http://pragmaticly.github.com/smart-time-ago/) is hosted on github under MIT License. Check it out for more details and share your feedbacks and suggestions. Thanks!

### About Pragmatic.ly ###

[Pragmatic.ly](https://pragmatic.ly) is a lean collaborative project management tool aiming to help small teams make better products easier. It's the ideal and elegant project management tool for tech startups.
