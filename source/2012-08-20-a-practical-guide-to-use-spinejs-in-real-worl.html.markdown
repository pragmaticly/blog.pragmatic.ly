---
title: "A Practical Guide to Use Spine.JS in Real World App"
date: 2012-08-20 04:00 +08:00
tags: SpineJS, JavaScript MVC, JavaScript, Spine
author: dingding
---

To give users the best possible fluid experience, we designed [Pragmatic.ly](https://pragmatic.ly) and complied with the [single page application](http://en.wikipedia.org/wiki/Single-page_application) standard. We believe that could make users focus on building product rather than spending time on project management itself. A wide range of technology solutions are available to make a single page application. Current trends suggest moving core application from server to client side and keeping server load at minimum for better performance by pure data APIs. [Pragmatic.ly](https://pragmatic.ly) took on the challange to cater to this need by developing server side in Rails, Spine.js at client side.

### Why Spine.JS ###

There are many different JavaScript MVC frameworks such as [Backbone.js](http://backbonejs.org/), [Spine.js](http://spinejs.com/), [Knockout.js](http://knockoutjs.com/), [Ember.js](http://emberjs.com/), etc. There are too many choices and when I started Pragmatic.ly, I was struggling with the problem of which one I should pick up. Instead of wasting time on choosing I did a quick review by comparing the documents and then decided to choose Spine.js to start with. With months of development so far, I'm glad that Spine.js works pretty well and below are the great benefits I have found in using Spine.js.

* *Simple and lightweight*. It's easy to dive into the core and extend as you need to.
* *MVC pattern at its core*. It's very similar to the Rails counterparts. So I'm very comfortable with it from the first day.
* *Rails integration*. It can't be easier to use Rails as the backend data API in Spine.js app. And the [spine-rails](https://github.com/maccman/spine-rails) gem is another great addition.
* [*Asynchronous UI*](http://alexmaccaw.com/posts/async_ui). Ideally UIs never block and it will automatically update the data in backend. This brings the fast and very responsive user interface.

If you want to get a brief review among different frameworks, check out [this article](http://codebrief.com/2012/01/the-top-10-javascript-mvc-frameworks-reviewed/) written by Gordon L. Hemption.

### How we use Spine.js in Pragmatic.ly ###

We use spine-rails to generate the Spine.app structure, very similar to Rails app structure.

```sh
├── app
│   ├── controllers
│   │   ├── center
│   │   │   ├── filter_controller.js.coffee
│   │   │   └── tickets_controller.js.coffee
│   │   ├── center_content_controller.coffee
│   │   ├── comments_controller.js.coffee
│   │   ├── header
│   │   │   └── project_nav_controller.js.coffee
│   │   ├── header_controller.coffee
│   │   ├── iterations_controller.coffee
│   │   ├── left_sidebar_controller.coffee
│   │   ├── projects_controller.coffee
│   │   ├── right_sidebar_controller.coffee
│   │   ├── sidebars
│   │   │   ├── left_iteration.js.coffee
│   │   │   ├── left_people.js.coffee
│   │   │   ├── right_activities.js.coffee
│   │   │   └── right_detail_section.js.coffee
│   │   ├── tickets_controller.coffee
│   │   └── users_controller.js.coffee
│   ├── index.js.coffee
│   ├── lib
│   │   ├── constants.js.coffee
│   │   ├── eco-helpers.js
│   │   └── view.js.coffee
│   ├── models
│   │   ├── comment.js.coffee
│   │   ├── iteration.js.coffee
│   │   ├── project.js.coffee
│   │   ├── ticket.js.coffee
│   │   └── user.js.coffee
│   └── views
│       ├── comments
│       │   ├── audit.jst.eco
│       │   ├── form.jst.eco
│       │   └── plain.jst.eco
│       ├── iterations
│       │   ├── section.jst.eco
│       │   └── show.jst.eco
│       ├── projects
│       │   ├── edit.jst.eco
│       │   ├── form.jst.eco
│       │   ├── new.jst.eco
│       │   └── switch.jst.eco
│       ├── tickets
│       │   ├── section.jst.eco
│       │   ├── show.jst.eco
│       │   └── toolbar.jst.eco
│       └── users
│           ├── people.jst.eco
│           └── show.jst.eco
├── application.js
├── bootstrap.js.coffee
└── dashboard.js.coffee
```

So basically it's controllers, models and views.

### Controllers ###

There are two kinds of Controllers in Pragmatic.ly. In Spine, Controllers are considered the glue of an application, adding and responding to DOM events, rendering templates and ensuring that views and models are kept in sync. For example,

```coffee-script
class App.LeftIterationController extends Spine.Controller
  el: '.sidebar #iterations'

  elements:
    'ul.list': 'list'

  constructor: ->
    super
    App.Iteration.bind 'create', @addIteration
    App.Iteration.bind 'refresh', @refreshIterations

  release: ->
    super
    App.Iteration.unbind 'create', @addIteration
    App.Iteration.unbind 'refresh', @refreshIterations

  addIteration: (iteration) =>
    iteration.unbind()
    view = new App.IterationItem(item: iteration)
    @list.append(view.render().el)

  refreshIterations: (iterations) =>
    @addIteration iteration for iteration in iterations
```

We split the page into multiple blocks and each block is a Spine Controller. Talking the above example, LeftIterationsController is the Controller to manage the iterations list in the left sidebar.

Then what's the other kind? The answer is Routes! We extract the routes to the dedicated controllers now. It will setup the routes and respond to the navigation event. Then it will prepare the data and trigger the event to let another controller handle it to render templates. For example,

```coffee-script
class App.TicketsController extends Spine.Controller
  constructor: ->
    super
    @routes
      "/tickets": @index
      "/tickets/:id" : (params) ->
        @show(params.id)

  index: ->
    tickets = App.Ticket.all()
    App.Ticket.trigger "tickets:index", tickets

  show: (id) ->
    ticket = App.Ticket.find(id)
    $.publish 'ticket:switch', ticket
```

### Models ###

Models manage data for the application. It's very similar to Rails models. I just want to mention one thing though - as we moved the logic from server side to client side, there was no need to translate 1:1 on the client side. Instead, encapsulate the data into model which is suitable for the page based on the user.

```coffee-script
class App.Project extends Spine.Model
  @configure 'Project', 'id', 'name', 'description', 'owner_id', 'uid'
  @extend Spine.Model.Ajax
  @extend Spine.Model.Dirty

  validate: ->
    'name required' unless @name

  inviteUser: (email) ->
    App.Invitation.create(project_id: @id, email: email)
```

### Views ###

Views are about building and maintaining the DOM elements. Views in Spine are very simple and don't have the built-in UI binding. So most of the time you should let Controller observe the Model and get notified when the model changes, then update the view accordingly.

By doing all the view rendering client-side, you should use JavaScript templating solution to define templates for views as markup containing tempalte variables. There are a number of good candidates, such as Mustache, jQuery.tmpl and Eco.

I use Eco in Pragmatic.ly. The Erb-like syntax and CoffeeScript support is a big triumph. However, you should know that every eco template generates the same helpers which will increase the file size. You can use this [gist](https://gist.github.com/sishen/2360781) to avoid the problem which will register the global helpers and inject into the Eco templates.

```ruby
# Put this file in lib/

require 'sprockets/eco_template'

class CleanEcoTemplate < Sprockets::EcoTemplate
  FROM = "  (function() {"
  TO = "}).call(__obj);"

  def evaluate(scope, locals, &block)
    content = Eco.compile(data)
    from = content.index(FROM)
    to = content.rindex(TO)
    content = content[from...to] + TO
    <<-JS
function(__obj) {
  if (!__obj) __obj = {};
  var __helpers = window.ecoHelpers;
  var __out = [];
  var __sanitize = __helpers.sanitize;
  var __capture = __helpers.captureFor(__obj, __out);
  var __rememberSafe = __obj.safe;
  var __rememberEscape = __obj.escape;
  __obj.safe = __helpers.safe;
  __obj.escape = __helpers.escape;
#{content}
  __obj.safe = __rememberSafe;
  __obj.escape = __rememberEscape;
  return __out.join('');
};
      JS
  end
end
```

```ruby
# Put this file in config/initializers

require 'clean_eco_template'

Rails.application.assets.register_engine '.eco', CleanEcoTemplate
```

```javascript
# Must include eco-helpers.js before eco files

(function(global) {
  var ecoHelpers = {
    sanitize: function(value) {
      if (value && value.ecoSafe) {
        return value;
      } else if (typeof value !== 'undefined' && value != null) {
        return ecoHelpers.escape(value);
      } else {
        return '';
      }
    },

    safe: function(value) {
      if (value && value.ecoSafe) {
        return value;
      } else {
        if (!(typeof value !== 'undefined' && value != null)) value = '';
        var result = new String(value);
        result.ecoSafe = true;
        return result;
      }
    },

    escape: function(value) {
      return ('' + value)
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;');
    },

    captureFor: function(obj, out) {
      return (function(callback) {
        var length = out.length;
        callback.call(obj);
        return ecoHelpers.safe(out.splice(length, out.length - length).join(''));
      });
    }
  };

  global.ecoHelpers = ecoHelpers;
})(window);
```

### Problems ###

So that's how we use Spine.js to power Pragmatic.ly. It works very well but still have some limitations.

* By default, you can only monitor the whole Model change event and update the view accordingly. For example, even the username is not changed, you still have to update the views containing that data. There is a "change:field" event in Backbone.js which allow you only to update the view when that field of data changed. I like that. So I made a plugin to support that. Check the Gist out.

    ```coffee-script
    Spine ?= require('spine')

    Include =
      savePrevious: ->
      @constructor.records[@id].previousAttributes = @attributes()

    Spine.Model.Dirty =
      extended: ->
        @bind 'refresh', ->
        @each (record) -> record.savePrevious()

        @bind 'save', (record) ->
          if record.previousAttributes?
            for key in record.constructor.attributes when key of record
              if record[key] isnt record.previousAttributes[key]
                record.trigger('change:'+key, record[key])
          record.savePrevious()

        @include Include
    ```

    So the model object can bind the event "change:#{field} to trigger event when the field value is changed.

    By default it's off and if need this feature, the model should extend Spine.Model.Dirty.

    A sample case.

    ```coffee-script
    class User extends Spine.Model
      @extend Spine.Model.Dirty
    end
    ```

* The Ajax plugin in Spine.js plays very nice with backend REST APIs, such as Rails. For example, creating the model will trigger a "CREATE /collections" event to the server and updating the model will trigger a "PUT /collections/id" event, seemlessly. However, nested resources in Rails is very common but Spine lacks to support that. Either you have to trigger requests to top-level URL or setup the request yourself. I have done a dirty hack to support scoping. It's dirty but works.

    ```coffee-script
     class App.Ticket extends Spine.Model
      @configure 'Ticket', "id", "project_id"

      @scope: ->
        "projects/#{current.project_id}"

      scope: ->
        "projects/#{@project_id}"
    ```

* Asynchronous UI is cool and works for 98% situations. But in a real world app you have to deal with errors like bugs or network failures. Spine doesn't have the default error handling for this situation and leave all work to you. It's fine but you should know that for that 2% situation, you have to spend lots of time to avoid the impact.

### Test ###

I would like to cover how Test works in Pragmatic.ly in another post. To give a quick overview, we use [Jasmine](http://pivotal.github.com/jasmine/) for JS test and [JSCoverage](http://siliconforks.com/jscoverage/) for measuring code coverage. Nice pair!

<br/>

### About Pragmatic.ly ###

[Pragmatic.ly](https://pragmatic.ly) is a lean collaborative project management tool aiming to help small teams make better products easier. It's the ideal and elegant project management tool for tech startups.

Now that you've read so far, you should follow me [@yedingding](https://twitter.com/yedingding)!
