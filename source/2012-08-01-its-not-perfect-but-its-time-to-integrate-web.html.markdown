---
title: "It's not perfect but it's time to integrate web notifications"
date: 2012-08-01 20:00 +08:00
tags: html5 notification, JavaScript, web notification
author: dingding
---

One feature [Pragmatic.ly](https://pragmatic.ly) has had from the beginning is Web Notifications. When I first saw the feature in Gmail I was convinced it was a feature every web application should have. As a project management tool Pragmatic.ly should enhance collaboration and ease communication. Instant desktop-like notification is one way to achieve the goal.

![Chrome Web Notification](/its-not-perfect-but-its-time-to-integrate-web/chrome-notification.png "Chrome Web Notification")

![Safari Web Notification](/its-not-perfect-but-its-time-to-integrate-web/safari-notification.png "Safari Web Notification")

##### Browser Support #####

For a long time only Chrome users have been able to benefit from such features. But the release of Safari 6 in Mountain Lion has changed things for the better and now it's time to integrate web notification into your application.

| **Browser** |	**Whether Support**                  |
| :---------: | :------------------------------------|
| Chrome    	| Yes                                  |
| Safari	    | Yes. version 6 in Mountain Lion only |
| Firefox   	| Yes. Install Plugin [ff-html5notifications](https://code.google.com/p/ff-html5notifications) |
| IE	        | No. But can work in [Chrome Frame](https://developers.google.com/chrome/chrome-frame/)       |

For more list, checkout [https://html5test.com/compare/feature/notifications-notifications.html](https://html5test.com/compare/feature/notifications-notifications.html).

Since different browsers support the notifications in different ways, there are two specs of web notifications we need to cover. One is the [older version](http://www.chromium.org/developers/design-documents/desktop-notifications/api-specification) which is implemented in latest version of Chromium, and the other is the [newer version](http://www.w3.org/TR/notifications/) at W3C which safari followed. (The Firefox plugin followed the Chromium implementation). Considering safari 6 also does support the old spec, I would say it's better to still stick in the old spec, at least for now.

##### How to Use #####

Danger Cove wrote an awesome [demo](http://dangercove.github.com/html5-notifications/) on how to use HTML5 web notifications, based on the old spec. If you're looking for the samples of the new spec, [safari document](https://developer.apple.com/library/safari/#documentation/AppleApplications/Conceptual/SafariJSProgTopics/Articles/SendingNotifications.html) definitely is a good resource. Below are several notes from the experience I added the integration.

1. The request permission dialog only shows after user interactions. Automation such as usingJavascript to click the link/button doesn't work.
2. requestPermission requires the callback to make it work with Safari
3. You can interact with your application using events such as onclick, by referring window.parent. For example as in Pragmatic.ly, when user clicks the popup notification, it will show you the ticket where event happens.

Check the [Gist](https://gist.github.com/3233112) to see how [Pragmatic.ly](https://pragmatic.ly) integrates web notifications.

<script src="https://gist.github.com/3233112.js"></script>

##### Limitation #####

While Safari 6 in Mountain Lion brings the support, it also brings some limitations, for example,

1. Custom icons aren't supported any more in Mountain Lion, no matter which browser you use. It's controlled by the Notification Center and will always show the application icon such as Safari, Chrome. However, users in other OS doesn't have the problem. Hope Apple can fix it soon.
2. Title is truncated to 30 characters in Mountain Lion. So does body. However, you can view the whole body in the Notification Center.
3. You can't control how the notifications close in Mountain Lion. It's taken by the Notification Center setting.
4. HTML Notification doesn't work in Safari because the new W3C spec only have simple notification. So I suggest using simple notification only in your application.

##### One More Thing #####

If you're developing Chrome extensions, do remember to add the "notifications" permission in the manifest.json. So when users install the extensions, the permission will be automatically granted. For Safari extensions, nothing needs to be added since it's handled by Safari with permission auto granted.

<br/>

##### About Pragmatic.ly #####

[Pragmatic.ly](https://pragmatic.ly) is a lean collaborative project management tool aiming to help small teams make better products easier. It's the ideal and elegant project management tool for tech startups.

Now that you've read so far, you should follow me [@yedingding](https://twitter.com/yedingding)!
