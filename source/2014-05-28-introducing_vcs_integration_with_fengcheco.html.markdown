---
title: "如何集成 VCS"
date: 2014-05-28 09:47 +08:00
tags: VCS, Integration, Git, 代码库, 集成
author: roy
---

我们致力于设计一款开发友好的工具，希望能够帮助使用者团队更加快速便捷的开发项目以及管理项目进度。

像我们这样的开发者每天都使用 VCS (版本控制系统) 完成工作， 比如 Git 或者 SVN 。将 VCS 融入您目前的开发过程中，可以使您更加详细精确的了解到代码情况以及项目进度，使代码和项目管理融为一体。

![VCS Integration](/images/integrate-version-control-system-with-pragmat/vcs-integration.png)

目前我们已经支持了 [GitHub](https://github.com/), [BitBucket](https://bitbucket.org/) 以及 [Gitlab](http://gitlab.org/)，如果您正在使用的版本控制器我们还不支持，只需联系我们，我们回尽快帮您解决。

使用方法请参考[这里](/how-we-use-vcs-integration-with-fengcheco)

#### 如何设置 ####

1. 首先，你需要确认 Git 中所使用的用户名或者邮箱和您在 Fengche.co 账号中使用的保持一致。如果不一致，您可以在 Git 中做修改：

        $ git config user.name "Roy Young"
        $ git config user.email "roy@fengche.co"
2. 在项目的设置选项中找到 Commit Hook URL

![where to set](vcs_integration_with_fengcheco/where_to_set.png)
![commit hook url](vcs_integration_with_fengcheco/commit_hook_url.png)

#### Github 设置 ####

1. 打开 Github 项目设置界面，点击 "Setting" 标签。

    ![GitHub Project Setting](/images/integrate-version-control-system-with-pragmat/github-project-setting.png)

2. 然后点击 "Service Hooks"，选择 "WebHook URLs"。
3. 把刚才从 Fengche.co 中获取的 Commit Hook URL 粘贴至这里，并点击 "Update settings'。

    ![Github WebHook](/images/integrate-version-control-system-with-pragmat/github-webhook.png)

#### BitBucket 设置 ####

1. 打开 Bitbucket 中项目设置页面，在侧边栏中点击 "Services"
2. 选择 "POST" 并且将 Fengche.co 中获取的 Comiit Hook HRL 粘贴至这里。
3. 点击 "Save"

    ![BitBucket WebHook](/images/integrate-version-control-system-with-pragmat/bitbucket-webhook.png)

#### GitLab 设置 ####

Gitlab 设置方法和 GitHub 中设置相似，您可以参看 GitHub 中的设置方法。
