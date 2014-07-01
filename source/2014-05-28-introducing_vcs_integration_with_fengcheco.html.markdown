---
title: "如何集成 VCS"
date: 2014-05-28 09:47 +08:00
tags: VCS, Integration, Git, 代码库, 集成
author: roy
---

我们致力于设计一款开发友好的工具，希望能够帮助使用者团队更加快速便捷的开发项目以及管理项目进度。

像我们这样的开发者每天都使用 VCS (版本控制系统) 完成工作， 比如 Git 或者 SVN 。将 VCS 融入您目前的开发过程中，可以使您更加详细精确的了解到代码情况以及项目进度，使代码和项目管理融为一体。

![audit commit](/images/vcs_integration_with_fengcheco/audit_commit.png)

目前我们已经支持了 [GitHub](https://github.com/), [BitBucket](https://bitbucket.org/) 以及 [Gitlab](http://gitlab.org/)，如果您正在使用的版本控制器我们还不支持，只需联系我们，我们回尽快帮您解决。

使用方法请参考[这里](/blog/how-we-use-vcs-integration-with-fengcheco)

READMORE

#### 如何设置 ####

1. 首先，你需要确认 Git 中所使用的用户名或者邮箱和您在 Fengche.co 账号中使用的保持一致。如果不一致，您可以在 Git 中做修改：

        $ git config user.name "Roy Young"
        $ git config user.email "roy@fengche.co"
2. 在项目的设置选项中找到 Commit Hook URL

    ![where to set](/images/vcs_integration_with_fengcheco/where_to_set.png)
    ![commit hook url](/images/vcs_integration_with_fengcheco/commit_hook_url.png)

    这里我们得到的是

        https://fengche.co/projects/421d6f9a13e6/hooks?token=2d5af19ba281

#### Github 设置 ####

1. 打开 Github 项目设置界面，点击侧边栏中的 "Settings" 标签。

    ![GitHub Project Setting](/images/vcs_integration_with_fengcheco/github-project-setting.png)

2. 然后点击 "Webhooks & Services"，点击 "Add webhook"。

    ![GitHub Project Add Webhook](/images/vcs_integration_with_fengcheco/github-project-add-webhook.png)

3. 在 Add Webhook 页面完成以下操作。
    * 把刚才从 Fengche.co 中获取的 Commit Hook URL 粘贴至页面的 **Playload URL** 输入框。
    * 在 **Content type** 中选择 *application/x-www-form-urlencoded*。
    * 确保 **Secret** 为空。
    * 点击 **Enable SSL verification**，如果默认为开启则不需操作。
    * 选择 **Just the push event**
    * 勾选 **Active**
    * 完成以上操作后点击 **Add Webhooks**

    ![Github WebHook](/images/vcs_integration_with_fengcheco/github-webhook.png)

#### BitBucket 设置 ####

1. 打开 Bitbucket 中项目设置页面，在页面左下角点击 "Settings"
2. 在中间栏中点击 "Hooks"
3. 在右边栏中选择 "POST"，并且点击 "Add hook"

    ![BitBucket WebHook](/images/vcs_integration_with_fengcheco/bitbucket-webhook.png)
4. 并且将 Fengche.co 中获取的 Comiit Hook HRL 粘贴至弹出窗口 "URL"。
5. 点击 "Save"
    ![BitBucket Setting](/images/vcs_integration_with_fengcheco/bitbucket-setting.png)

#### GitLab 设置 ####

1. 打开 GitLab 项目页面，在右上角点击 **Settings**
    ![GitLab Setting](/images/vcs_integration_with_fengcheco/gitlab-setting.png)
2. 在左侧，侧边栏中点击 **Web Hooks**
3. 把刚才从 Fengche.co 中获取的 Commit Hook URL 粘贴至页面的 **URL** 输入框。
4. 勾选 **Pusher events**
5. 点击 **Add Web Hook**
    ![GitLab Setting](/images/vcs_integration_with_fengcheco/gitlab-webhook.png)


*希望这个功能可以让您的团队协作变得更加高效，有任何反馈或建议，欢迎您联系我们！*
