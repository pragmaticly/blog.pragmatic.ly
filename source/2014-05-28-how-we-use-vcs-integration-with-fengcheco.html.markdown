---
title: 如何使用 VCS 集成
date: 2014-05-28 11:47 +08:00
tags: VCS, Integration, Git, 代码库, 集成
author: roy
---

![audit commit](/images/vcs_integration_with_fengcheco/audit_commit.png)

像我们这样的开发者每天都使用 VCS (版本控制系统) 完成工作， 比如 Git 或者 SVN 。将 VCS 融入您目前的开发过程中，可以使您更加详细精确的了解到代码情况以及项目进度，使代码和项目管理融为一体。

设置教程请看[这里](/introducing_vcs_integration_with_fengcheco)

READMORE

#### 如何使用 ####

1. 将任务浏览和代码提交关联起来！

    拿我们自己的实际应用来举例，现在有一个任务我需要完成，它的 id 是 909

    ![Ticket Example](/images/vcs_integration_with_fengcheco/ticket-example.png)

    这里有两种方法可以让你的代码提交信息和相应的任务关联起来

    1. 如果你习惯于每一个新功能都新建一个新的 Branch 来完成，你可以使用这个任务的 id 作为开头来命名这个 branch ，比如 `909_downloading_all_attachments_of_a_ticket`
    2. 如果你想要让单个代码提交信息和一个任务对应起来，并且不在乎代码的 branch 的话，你可以在 commit 信息中包含这个任务的 id，"#909"

            $ git commit -m "Ref #909, Implemented downloading all attachments of a ticket."
    ![audit commit](/images/vcs_integration_with_fengcheco/audit_commit.png)

2. 使用提交信息控制任务状态。

    你可以使用提交信息中的“命令”来关闭后者完成任务，命令如下：

    1. 完成任务 (*completes, completed, resolve, resolves, resolved, solve, solves, solved, fix, fixes, fixed*) 这将会是特定任务状态改为“完成”
    2. 验收任务 (*acceptes, accepted, close, closes, closed*) 这将会使特定任务状态变为“验收通过”

    您可以在提交代码时，参照下面的示例：

        $ git commit -m "Resolved #909, This will mark 909 as Completed"
        $ git comimt -m "Closed #909, This will mark 909 as Closed"

<br/>

希望这个功能可以让您的团队协作变得更加高效，有任何反馈或建议，欢迎您联系我们！
