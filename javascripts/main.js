(function(){var n;!function(){var n,e,i,o,r,a,l;for(r=function(){},o=["assert","clear","count","debug","dir","dirxml","error","exception","group","groupCollapsed","groupEnd","info","log","markTimeline","profile","profileEnd","table","time","timeEnd","timeStamp","trace","warn"],n=window.console||(window.console={}),e=a=0,l=o.length;l>=0?l>=a:a>=l;e=l>=0?++a:--a)i=o[e],n[i]||(n[i]=r);return!0}(),window.location_pathname=function(){return location.pathname.replace(/index.\w+$/,"")},n=function(){return"undefined"!=typeof mixpanel&&null!==mixpanel&&mixpanel.track("page viewed",{"page name":document.title,url:window.location.pathname}),"undefined"!=typeof mixpanel&&null!==mixpanel?mixpanel.track_links(".nav-collapse li a","click nav link",{referrer:document.referrer}):void 0},$(function(){return n()})}).call(this);