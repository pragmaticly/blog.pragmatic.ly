---
title: Showing up Due Date
date: 2012-09-24 08:00 +08:00
tags: Announcement, Lean Product Management Tool, ChangeLog, UI
author: ben
---

Now you can see *due-date* on ticket list, and capture overdue tickets easily at a glance. Here is how and why we put it this way.

Firstly, *due-date* can be input in the right form, easy click and go.

![Due Date Selector](/due-date-is-showing-up-in-the-ticket-list/date-selector.jpg)

A ticket has *due-date* set will show up a date tag, the visual design is different from normal tags. Basically you're notified that one ticket has due on priority.

![Due Date Tag](/due-date-is-showing-up-in-the-ticket-list/due-date-tag.png)

Once a ticket is due on or overdue, this ticket item in tickets list will be highlighted and the date tag turns red. You can't ignore it since the day is coming :) Hope this can push you a bit for getting things done.

![Overdue Tag](/due-date-is-showing-up-in-the-ticket-list/overdue-tag.png)

When we were designing the interface of due-date, it actually came out a design like this,

![Due date draft](/due-date-is-showing-up-in-the-ticket-list/due-date-draft.png)

Using the calendar icon (same from the editing form) to indicate that a ticket has a *due-date*. When hover on the icon, a tooltip will show up and tell you the *due-date*. This looks good, the UI is clean and space saving, but we gave it up, why?

Baring the KISS design philosophy in mind, we think we should get rid of using two UI elements to delivery one piece of information, and the extra hover action is a hassle too. So why not just using plain text let the user easy to read and less hassle to use.

On the other hand, we'd like to make the *due-date* the same way as tags do, both as filter to find out the qualified tickets when you clicked on them. So may be a tag-like style is good for the due-date.

![Due Date Overview](/due-date-is-showing-up-in-the-ticket-list/due-date-overview.png)

Let us know how this works for you.


##### Coming soon #####

We're working on date priority filter, which can order your tickets by due-date. Help you make a decision which ticket should be working on first. Stay tuned, we'll get you posted.

