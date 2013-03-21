---
title: "A Practical Guide to Use Spine.JS in Real World App"
date: 2012-08-20 04:00 +08:00
tags: SpineJS, JavaScript MVC, JavaScript, Spine
author: dingding
---

To give users the best possible fluid experience, we designed [Pragmatic.ly](https://pragmatic.ly) and complied with the [single page application](http://en.wikipedia.org/wiki/Single-page_application) standard. We believe that could make users focus on building product rather than spending time on project management itself. A wide range of technology solutions are available to make a single page application. Current trends suggest moving core application from server to client side and keeping server load at minimum for better performance by pure data APIs. [Pragmatic.ly](https://pragmatic.ly) took on the challange to cater to this need by developing server side in Rails, Spine.js at client side.

##### Why Spine.JS #####

There are many different JavaScript MVC frameworks such as [Backbone.js](http://backbonejs.org/), [Spine.js](http://spinejs.com/), [Knockout.js](http://knockoutjs.com/), [Ember.js](http://emberjs.com/), etc. There are too many choices and when I started Pragmatic.ly, I was struggling with the problem of which one I should pick up. Instead of wasting time on choosing I did a quick review by comparing the documents and then decided to choose Spine.js to start with. With months of development so far, I'm glad that Spine.js works pretty well and below are the great benefits I have found in using Spine.js.

* *Simple and lightweight*. It's easy to dive into the core and extend as you need to.
* *MVC pattern at its core*. It's very similar to the Rails counterparts. So I'm very comfortable with it from the first day.
* *Rails integration*. It can't be easier to use Rails as the backend data API in Spine.js app. And the [spine-rails](https://github.com/maccman/spine-rails) gem is another great addition.
* [*Asynchronous UI*](http://alexmaccaw.com/posts/async_ui). Ideally UIs never block and it will automatically update the data in backend. This brings the fast and very responsive user interface.

If you want to get a brief review among different frameworks, check out [this article](http://codebrief.com/2012/01/the-top-10-javascript-mvc-frameworks-reviewed/) written by Gordon L. Hemption.

##### How we use Spine.js in Pragmatic.ly #####

We use spine-rails to generate the Spine.app structure, very similar to Rails app structure.

<script src="https://gist.github.com/3370365.js"></script>

So basically it's controllers, models and views.

##### Controllers #####

There are two kinds of Controllers in Pragmatic.ly. In Spine, Controllers are considered the glue of an application, adding and responding to DOM events, rendering templates and ensuring that views and models are kept in sync. For example,

<script src="https://gist.github.com/3370386.js"></script>

We split the page into multiple blocks and each block is a Spine Controller. Talking the above example, LeftIterationsController is the Controller to manage the iterations list in the left sidebar.

Then what's the other kind? The answer is Routes! We extract the routes to the dedicated controllers now. It will setup the routes and respond to the navigation event. Then it will prepare the data and trigger the event to let another controller handle it to render templates. For example,

<script src="https://gist.github.com/3370398.js"></script>

##### Models #####

Models manage data for the application. It's very similar to Rails models. I just want to mention one thing though - as we moved the logic from server side to client side, there was no need to translate 1:1 on the client side. Instead, encapsulate the data into model which is suitable for the page based on the user.

<script src="https://gist.github.com/3370424.js"></script>

##### Views #####

Views are about building and maintaining the DOM elements. Views in Spine are very simple and don't have the built-in UI binding. So most of the time you should let Controller observe the Model and get notified when the model changes, then update the view accordingly.

By doing all the view rendering client-side, you should use JavaScript templating solution to define templates for views as markup containing tempalte variables. There are a number of good candidates, such as Mustache, jQuery.tmpl and Eco.

I use Eco in Pragmatic.ly. The Erb-like syntax and CoffeeScript support is a big triumph. However, you should know that every eco template generates the same helpers which will increase the file size. You can use this gist to avoid the problem which will register the global helpers and inject into the Eco templates.

<script src="https://gist.github.com/2360781.js"></script>

##### Problems #####

So that's how we use Spine.js to power Pragmatic.ly. It works very well but still have some limitations.

* By default, you can only monitor the whole Model change event and update the view accordingly. For example, even the username is not changed, you still have to update the views containing that data. There is a "change:field" event in Backbone.js which allow you only to update the view when that field of data changed. I like that. So I made a plugin to support that. Check the Gist out.
    <script src="https://gist.github.com/2866558.js"></script>

* The Ajax plugin in Spine.js plays very nice with backend REST APIs, such as Rails. For example, creating the model will trigger a "CREATE /collections" event to the server and updating the model will trigger a "PUT /collections/id" event, seemlessly. However, nested resources in Rails is very common but Spine lacks to support that. Either you have to trigger requests to top-level URL or setup the request yourself. I have done a dirty hack to support scoping. It's dirty but works.
    <script src="https://gist.github.com/3371899.js"></script>

* Asynchronous UI is cool and works for 99% situations. But in a real world app you have to deal with errors like bugs or network failures. Spine doesn't have the default error handling for this situation and leave all work to you. It's fine but you should know that for that 1% situation, you have to spend lots of time to avoid the impact.

##### Test #####

I would like to cover how Test works in Pragmatic.ly in another post. To give a quick overview, we use [Jasmine](http://pivotal.github.com/jasmine/) for JS test and [JSCoverage](http://siliconforks.com/jscoverage/) for measuring code coverage. Nice pair!

<br/>

##### About Pragmatic.ly #####

[Pragmatic.ly](https://pragmatic.ly) is a lean collaborative project management tool aiming to help small teams make better products easier. It's the ideal and elegant project management tool for tech startups.

Now that you've read so far, you should follow me [@yedingding](https://twitter.com/yedingding)!
