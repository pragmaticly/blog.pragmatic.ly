---
title: Improving Ticket Interactive
date: 2012-12-10 19:00 +08:00
tags: Ticket Management, UI, Lean Product Management, ChangeLog
author: ben
---

### Improve the stability of ticket item in the list ###

Users informed us that the ticket list in the center column was unstable, and we were rushing into this problem immediately.

As shown in the screenshot, we found the old list item was a interactive savage, from left to right:

1. The ticket number will change into movable knob when hovered.
2. The ticket status could be clicked to switch into the next.
3. The assignee was shown as a link.
4. The ticket title was editable when focused.
5. The tags would be a ticket filters immediately.
6. The little right pointer had an onhover state.

![Old Ticket Interactive](/images/improving-ticket-interactive/old-ticket-interactive.jpg)

This is quite a burden to users, we'd relieve it as soon as possible.

Though the UI looks same as before, the current list item goes like this:

* The Assignee is shown as text rather than a link, since we already have a handy sidebar that contains links to team members.
* The ticket title's Edit In Place feature has been removed, to prevent users' accidental editing.
* When hovering on list item, only the left knob and the right pointer will change their statuses, while others stay calm.
* What's left is just simple click to select, drag&drop to move.

We have also changed the status naming and their section order. Do they make sense to you? Let's know about your thoughts.

![New Ticket Interactive](/images/improving-ticket-interactive/new-ticket-interactive.jpg)

### Ticket status switching become more handy ###

Ticket status indicates how's the ticket going, it drives our daily development work. Everyday we generate todo ticket , assign it to someone, start working on it, complet it, and someone review on it. Without doubt, ticket status switching is the most frequently used in our application. We need to polish it again and again to help you more productive, now it looks like this.

![New Ticket Switch](/images/improving-ticket-interactive/new-ticket-switch.jpg)

Before the improvement, the status can only switch to next status by one click on the checkbox. Now by clicking outside of the checkbox, you will get a popup menu(To Do/Start/Complete/Accept), where you can change ticket to any status. By clicking inside of the checkbox, you are switching as the old way.

Note that we have some new icons for representing the status, and we hope you like them. We'd love to hear your inspiration with the status imagery.

Stay tuned, we will post improvements very soon.

<br/>

### About Pragmatic.ly ###

[Pragmatic.ly](https://pragmatic.ly) is a lean collaborative project management tool aiming to help small teams make better products easier. It's the ideal and elegant project management tool for tech startups.
