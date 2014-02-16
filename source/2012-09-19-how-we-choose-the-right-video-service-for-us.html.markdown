---
title: "Video matters! But which hosting service to use?"
date: 2012-09-19 05:00 +08:00
tags: marketing, video service
keywords: marketing, video service
author: terry
---

Nowadays video is used extensively for introducing the products or services to the public. It's no doubt that a good video can increase the conversation rate a lot.

As a startup, it's not easy to create a great product video like other big companies. So we recorded a toturial screencast when we launched [Pragmatic.ly](https://fengche.co) instead. Meanwhile we are working on our new attracting product video and we love the process. It's totally different experience than writing code. We will share more latter when the video is out. But in this post I will talk more about the experience about different video hosting service. We tried [Vimeo](http://vimeo.com/), [SublimeVideo](http://sublimevideo.net/), [Wistia](http://wistia.com/) and [YouTube](http://www.youtube.com/).  The result is interesting and quite different than our common sense.

![Vimeo](/images/how-we-choose-the-right-video-service-for-us/vimeologo.svg "Vimeo")

[Vimeo](http://vimeo.com) is our first choice because we heard many good words from others. It does act great. Both the video quality and play speed are good when watching it from Vimeo's site. But after we use an embed player on our site to play the video, we have the problem. The basic account of Vimeo doesn't have the HD embedding but that's exactly what we want. I think each penny spent on the [Vimeo Plus](http://vimeo.com/plus) account should be worth it but before we do that, we planned to give more solutions a try. If you have sites with HD embedding videos on Vimeo, please share and I'm eager to see how it works. Our video on Vimeo is [here](https://vimeo.com/44030280).

![SublimeVideo](/images/how-we-choose-the-right-video-service-for-us/slv.png "SublimeVideo")

Strictly speaking [SublimeVideo](http://sublimevideo.net/) is not a video hosting service. It's just a video player service. If you use SublimeVideo, you have to host your video files yourself, no matter on your own server or S3. But the good part is that you can totally control your video yourself. Size, quality, anything about the video is under your control. SublimeVideo is really a nice video player. It supports both HTML5 and Flash, almost works on any platform. The control panel is simple, neat, and it also supports simple analytics by time. The integration is also very straightforward. You just need to load a JS file from SublimeVideo and use &lt;video&gt; tag to wrap your video url and SublimeVideo will work like magic.

![Wistia](/images/how-we-choose-the-right-video-service-for-us/wistia.png "Wistia")

[Wistia](http://wistia.com) is a new video service focus on powerful analytics. It can show you how your audience is watching, second by second. So we gave it a try, but after we uploading our video on it. We found the quality is not good. You could check it out [here](http://poshboytl.wistia.com/medias/5jsseu9vom) and compare it with the one on our homepage. I browsed their documents quickly but didn't find the solution. So sorry, we quit.

![youtube](/images/how-we-choose-the-right-video-service-for-us/youtube.png "Youtube")

Before we trying [YouTube](http://youtube.com), we used to think YouTube might not be a good place to host high quality video. But after we uploaded our video, we're shocked. The video quality is perfect, and YouTube help us to translate our video to servial copy from 240p to 720p. I think if our video has higher resolution, we will have a 1080p version too. You could watch the sample [here](http://www.youtube.com/watch?v=OMMDL7I_eaQ&feature=youtu.be&hd=1). To make a embed player on your site with Youtube is also very easy. We just use a iframe and set the src to video url with parameters "autoplay=1" and "hd=1". All done. For more player customization you could check out the document [here](http://code.google.com/apis/youtube/player_parameters.html). And it's free of charge!

So far we're glad with YouTube and it'll be our first choice to host Pragmatic.ly's product video and video tutorials. You could watch the final [embed video on our homepage](https://fengche.co/).

We hope our experience could give you some help. Do you have other recommendations? Please let us know! Thanks.
