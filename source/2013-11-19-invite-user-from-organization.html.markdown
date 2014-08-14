---
title:  "新功能：直接邀请组织成员加入项目"
date: 2013-11-19 12:00 +08:00
tags: Announcement, 用户管理
author: dingding
disqus_identifier: 'announcing-invite-from-organization'
---

先向我们用户们表示歉意，这个功能来晚了。随着用户使用 Fengche.co 的时间越来越长，项目开始增多，重复输入团队成员邮件地址来邀请用户成了一个痛点，所以我们觉得是时候开始做直接邀请组织里的成员加入项目，更方便协作。这里先解释两个概念。

### 项目团队

指当前项目里的团队人员，见边栏的团队成员列表。

![Project Team](invite-user-from-organization/project-team.png)

### 组织团队

指你的组织里的团队人员，是你创建的所有项目里的项目团队人员之和，算自然人。

![Organization Team](invite-user-from-organization/organization-team.png)

### 具体实现

下图是我们的具体实现。

![New Invite Modal](invite-user-from-organization/new-invite.png)

在邀请现有成员区域点击邀请以后，会直接给这位成员发送邀请加入项目邮件，很简单。另外，我们目前正在做新的项目页面设计，到时候会有更加优秀的视觉设计和交互设计，包括这里，敬请期待！

### 其他更新

这次的发布还修复了下面几个 bug。

1. 多附件情况下，删除一个附件后导致附件区域显示不全。
2. 新成员加入后，无法通过 @ 来补全新成员。
3. 在空间面板里面增加黑色的圆圈代表 “验收失败” 状态。

如果你有任何问题和建议，随时联系我们，谢谢。
