---
weight: 1
bookFlatSection: true
title: "03-03 LuaWebView自定义进度条"
---

# LuaWebView

------------------

{{< hint info >}}
**From MLUA**
{{< /hint >}}

## 自定义进度条

------------------

需要web.dex，稍微有点麻烦，详见[视频教程](https://www.bilibili.com/blackboard/html5mobileplayer.html?cid=105994341&aid=60913765&hq=true&high_quality=true)


删除进度条
``````lua
web.removeView(web.getChildAt(0))
``````

导包
``````lua
import "com.lua.*"
``````


进度改变事件
```lua
web.setWebChromeClient(LuaWebChrome(LuaWebChrome.IWebChrine{

onProgressChanged=function(view, newProgress)

--事件

end,

```



## LuaWebView设置UA

------------------


```lua
import "android.webkit.WebSettings"

local webSettings = LuaWebViewID.getSettings();

local newUserAgent = "UA字符串";

webSettings.setUserAgentString(newUserAgent);

```


## 获取与设置cookie

------------------


```lua

import "android.webkit.CookieSyncManager"

import "android.webkit.CookieManager"

function 设置Cookie(context,url,content)

CookieSyncManager.createInstance(context)

local cookieManager = CookieManager.getInstance()

cookieManager.setAcceptCookie(true)

cookieManager.removeSessionCookie()

cookieManager.removeAllCookie()

cookieManager.setCookie(url, content)

CookieSyncManager.getInstance().sync()

end

function 获取Cookie(url)

local cookieManager = CookieManager.getInstance();

return cookieManager.getCookie(url);

end

--示例

--获取https://www.baidu.com的cookie并打印

print(获取Cookie("https://www.baidu.com"))

--设置https://www.baidu.com的cookie为This is cookie

设置Cookie(activity,"https://www.baidu.com","This is cookie")

--获取https://www.baidu.com的cookie并打印

print(获取Cookie("https://www.baidu.com"))

```