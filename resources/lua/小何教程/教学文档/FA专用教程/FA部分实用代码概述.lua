--网页即将加载
if(网页链接:find"关键字(可用正则匹配)")then
  停止加载()
  进入子页面("游览",{链接=网页链接})
end

--加载本地网页
("file:///android_asset/drawable/index.html")

--如何调用浏览器打开当前页面？
import "android.content.Intent"
import "android.net.Uri"
url="https://www.lanzous.com/b251218"
viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
activity.startActivity(viewIntent)
--浏览器打开链接

--收到新标题
设置顶栏标题(webView.title)

--项目点击事件
进入子页面("子页面名",{链接="url",标题="标题名"})

--去头部留白
document.body.style.paddingTop=0--此处用的是JS

--显示或隐藏悬浮按钮
--显示悬浮按钮
fltBtn.setVisibility(View.VISIBLE)
--隐藏悬浮按钮
fltBtn.setVisibility(View.GONE)
--注:fltBtn为悬浮按钮的ID，不需要更改。

--悬浮点击事件
加载Js([[document.getElementsByClassName("apk_topbar_btn")[0].parentElement.onclick()]])

--悬浮选择点击事件
pop=PopupMenu(activity,fltBtn)
menu=pop.Menu
menu.add("选项一").onMenuItemClick=function(a)
进入子页面("子页面名",{链接="url1"..webView.getUrl()})
end
menu.add("选项二").onMenuItemClick=function(a)
进入子页面("子页面名",{链接="url2"..webView.getUrl()})
end
pop.show()

--设置屏幕方向
import "android.content.pm.ActivityInfo"
activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR);
--视频解析播放
加载网页("vip解析url"..webView.getUrl());
--横屏
activity.setRequestedOrientation(0); 
--竖屏
activity.setRequestedOrientation(1); 

--各控件ID
searchEdtTxt       搜索栏
toolbar.parent        顶栏
toolbar             标题栏
titleTvw            顶栏标题
webView           浏览器
fltBtn              悬浮按钮
 pager             滑动窗体
popmenu_position     菜单栏
sidebar             侧滑栏显示图标
pgsBar             进度条
sideLvw           侧滑图标
menu_button       菜单图标
menuBtn          侧滑栏图标

//开启和关闭侧滑
--打开侧滑
drawerLayout.openDrawer(3)
--关闭侧滑
drawerLayout.closeDrawer(3) 

--均放在点击事件
--自定义底栏点击事件

index=1--底栏项目序号

bmBarLin.getChildAt(index-1).onClick=function()
--点击事件
end

--自定义标签栏点击事件

local index=1--标签栏项目序号

tabBar.getChildAt(index-1).onClick=function()

 --点击事件

end
-- 多页面搜索 --
-- By: QQ3
local urls={"https://www.google.com/search?q=%s","https://m.baidu.com/s?wd=%s","https://m.so.com/s?q=%s","http://cn.bing.com/search?q=%s","http://m.chinaso.com/page/search.htm?keys=%s","https://m.sogou.com/web/searchList.jsp?keyword=%s","https://m.sm.cn/s?q=%s"}
searchEdtTxt.setOnEditorActionListener{
  onEditorAction=function(view,action,event)
    local text=tostring(view.text)
    if text~=nil and text~="" then
      searchEdtTxt.setHint(text)
      local URLEncodeer=import"java.net.URLEncoder"
      for index in pairs(urls) do
        if allWebView[index] and urls[index]~=nil and urls[index]~="" then
          local url=tostring(urls[index]):format(URLEncoder.encode(text))
          if pager.getCurrentItem()+1==index then
            task(100,function()allWebView[index].loadUrl(url)end)--解决当前页面无法加载（与默认搜索事件冲突被覆盖）的问题
          else
            allWebView[index].loadUrl(url)
          end
        end
      end
    else
      SearchEdtTxt.setHint("")
    end
  end
}

--[[【小何补充】
1�����的子页面传参问题，因�����的特殊性，所以一般的传参无法实现
但可以利�����自带的方法实现传参
例如：]]
参数 = "demo"
进入子页面("测试",{链接="http://www.baidu.com/?参数="..参数})
--然后在测试子页面的网页即将加载事件里停止加载
浏览器对象,网页链接=...--注意这句话很重要，这里是接收参数
停止加载()
参数 = 网页链接:match("参数%=.+")
--这样就成功接收到参数了，这只是个实例，代码不一定能照搬。

2�����的模板
FA提供了丰富的模板供我们使用：
顶栏模板(提供顶栏(标题栏)，侧滑栏，悬浮按钮)

标签栏模板(提供标签栏(上方的多选项菜单，可以实现多网页或者布局)，顶栏(标题栏)，侧滑栏，悬浮按钮)

底栏模板(提供底栏(下方的多选项菜单，可以设置图标，也可以实现多网页或者多布局)，顶栏(标题栏)，侧滑栏)

纯底栏模板(提供底栏)

空白模板(啥也没有)

其中最适合开发的是顶栏模板，出问题最多的是空白模板(FA的库特殊的问题)
这些模板的自定义性还是很高的，长，宽，高，颜色，图标等都可以自定义

3�����的库问题
FA的库比较特殊，所以在弄研究开发时，会出现很多莫名其妙的问题
例񙠫mob cjson库，�����测试阶段是可以正常使用，但打包安装后就报错提示没有此库
还����������rdView组件库很特殊，如果遇到有依赖关系的事件，会出现圆角丢失等情况，导񑙚ndroLua标准库即可解决
所以需要用到的，可以自己去找到库文件导入，也可以联系到我QQ�����67602180，我发给你

4，打包解析错误
仔细检查工程目录，不得出现任何中文字符以及错误文件和无法识别文件
子页面数量到达一定程度也会出现
具体数量看机型而有所不同