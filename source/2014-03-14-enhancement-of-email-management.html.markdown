---
title: "新功能：通过邮件完成创建任务、分配任务和设置标签"
date: 2014-03-14 16:25 +08:00
tags: Announcement, New feature, Notification, Email
author: roy
disqus_identifier: 'enhancement-of-email-management'
---

对于 Fengche.co 中[使用邮件集成来管理项目](/blog/new-feature-comment-via-email)这个 Feature 应该大家已经不再陌生了。应用户要求，目前我们加强了邮件管理功能。现在您可以通过使用邮件创建任务的同时，把任务分配给某个团队成员，或者为任务设置标签。

## 在特定任务列表下创建任务

这里发送邮件的地址规则为 `project+PROJECT_ID+ITERATION_ID@info.fengche.co`

首先在浏览器中打开你的 Project

![find ids](enhancement-of-email-management/find_iteration_and_project_id.png)

这里我们可以很清楚的找到当前项目的 PROJECT_ID 和 ITERATION_ID.

所以示例中正确地址应该为 `project+421d6f9a13e6+3da3196195e1@info.fengche.co`

READMORE

![email create ticket](enhancement-of-email-management/email_create_ticket.png)

发送邮件后，Fengche.co 将会在对应的项目的任务列表中创建刚才设置的任务

![create ticket](enhancement-of-email-management/create_ticket_in_iteration.png)

## 设置标签

如果刚才的任务我们想设置一个标签，只需要在邮件标题后面加上 `#标签名称#` 即可。**注意空格哦**

![email set tag](enhancement-of-email-management/email_set_tag.png)

创建任务时，设置标签

![set tag](enhancement-of-email-management/set_tag.png)

## 分配给团队成员

如果您想在创建任务同时分配给某个团队成员，只需要在邮件标题后面加上 `@成员`。**同样需要注意空格**

![email assign to member](enhancement-of-email-management/email_assign_to_member.png)

创建时，自动分配给指定成员

![assign to member](enhancement-of-email-management/assign_to_member.png)

*当然您也可以同时完成上述操作*

![email set tag and assign](enhancement-of-email-management/email_set_tag_and_assign.png)

创建任务时，同时设置标签，并分配给团队成员

![set tag and assign](enhancement-of-email-management/set_tag_and_assign.png)

**如果您有什么疑问，或者更好的建议的话，欢迎您与我们交流。**
