---
title: "Improving the usability on tickets readability and team collaboration"
date: 2013-01-17 00:00 +00:00
tags: UI, Ticket Management, Usability
author: dingding
---

Steve Krug's instant classic book "[Don't Make Me Think](http://www.amazon.com/Dont-Make-Me-Think-Usability/dp/0321344758)" is one of our favorite design books. Simplicity and usability is our lifetime of pursuit on products design. With regard to single page application like [Pragmatic.ly](https://pragmatic.ly), balancing the complexity of features with the simplicity of design is indeed difficult, but we're keep iterating. Here're some improvements to the ticket details.

##### Markdown Supported #####

Last week is a sad week for IT world. One of the top talented internet genius [Aaron Swartz](http://en.wikipedia.org/wiki/Aaron_Swartz) left us at 26. R.I.P Aaron Swartz! However, Aaron's contributions to the world will live forever. One of them is [Markdown](http://en.wikipedia.org/wiki/Markdown), a lightweight markup language designed for easy-to-read and easy-to-write.

Now you can write ticket description and comments with Markdown syntax. It's easy to write and rendering a good format for reading, sure supporting code highlight.

Get to know more about the markdown syntax, John Gruber's [tutorial](http://daringfireball.net/projects/markdown/) is an excellent guide. And we support [github's flavored markdown](http://github.github.com/github-flavored-markdown/) syntax too.

![Markdown Example](/improving-the-usability-on-tickets-readabilit/markdown-example.jpg)

##### Ticket fields rearranged #####

Ticket attribute fields are mainly for manageing ticket, as well as showing what's current statues of ticket. So both usability and readbility is considered when we're polishing the UI.

1. Move tags field upper, make it into ticket content section, along with ticket titile, description, they are ticket descriptive content.
2. Make iteration/assignee/priority/due-date fields as visual blocks which are implicit in the editable. Also we have subtle improved the editing interactive experience.
3. Responsive design on ticket fields. No matter when you on extended monitor, laptop or tablet, the read and update experience of ticket keeps the same because the ticket fields will be adaptive to the resolution.
4. Make file drop zone a bit bigger. Much easier and comfortable to drag and drop files for uploading.

![Ticket Attributes](/improving-the-usability-on-tickets-readabilit/ticket-attributes.jpg)

##### Full-column scroll on ticket details #####

We turn back to full-column scroll instead of seperated scroll.

Within the [Improving Ticket Interactive](http://blog.pragmatic.ly/improving-ticket-interactive) release, we changed the ticket detail column to a seperated, activity-only scroll. Thanks to our lovely users who give us the feedbacks on the changes and we learn more from them! What we expect is that we should be able to review ticket info while reading and posting comments. So we made them seperated. And the activity-only scroll works very good for big screen resolution.

However, smaller resolution like 1280x800 is not good due to the height limitation. As a result, we turn back to full-column scroll but with some extra improvements. Based on different screen resolution, the column will be smart balanced the two section of ticket information and its activities. So far it works good.

##### Sticky comment form #####

Now the comment form will always be sticky on the bottom. So you can always start to write comments with a single click. No scroll needed.

<br/>

We hope you enjoy the changes, as always, any feedbacks are welcome!

