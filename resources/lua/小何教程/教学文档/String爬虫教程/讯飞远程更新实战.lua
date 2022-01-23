--[[
很多同学似乎还不会远程更新，其实所谓讯飞远程更新也就是爬虫的
一种运用方式，结合前面所学和查看下面的链接的网页结构
你就能写出属于你的远程更新。
]]
SorrowClover=--随便写的一个布局，没有任何意义。
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或图片路径)
};
activity.setContentView(loadlayout(SorrowClover))--显示布局
--定义一个你的讯飞远程链接
--可以复制到浏览器看看网页结构
url="http://www.iyuji.cn/iyuji/s/akc1ZDNSKyt5RW9nUlA3MW5CNzJ1UT09/1562658886677508"
--使用http获取网页源码
Http.get(url,nil,"utf8",nil,function(code,content)
 --判断网页状态 
  if code==200 then
    --获取当前应用包名
    包名=activity.getPackageName()
    --利用包名获取到当前版本号
    当前版本=tonumber(activity.getPackageManager().getPackageInfo(包名, 0).versionName)
    --获取远程更新版本号
    更新版本=tonumber(content:match("【版本】(.-)【版本】"))
    --比较版本号
    if 更新版本 > 当前版本 then
      --制作对话框，显示更新提示
      更新说明=content:match("【更新说明】(.-)【更新说明】")
      更新链接=content:match("【更新链接】(.-)【更新链接】")
      AlertDialog.Builder(this)
      .setTitle("你有新版本更新")
      .setMessage(更新说明)
      .setPositiveButton("更新",{onClick=function(v)
          import "android.content.Intent"
          import "android.net.Uri"
          url=更新链接
          viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
          activity.startActivity(viewIntent)
        end})
      .setNegativeButton("取消",nil)
      .show()
     --判断正版软件
     elseif 更新版本 < 当前版本 then
      更新链接=content:match("【更新链接】(.-)【更新链接】")
      AlertDialog.Builder(this)
      .setTitle("非正版警告")
      .setMessage("你的软件版本远远高于正式版，被人非法修改，属于盗版行为，请支持正版！")
      .setPositiveButton("下载正版",{onClick=function(v)
          import "android.content.Intent"
          import "android.net.Uri"
          url=更新链接
          viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
          activity.startActivity(viewIntent)
        end})
      .setNegativeButton("取消",nil)
      .show()
     else
      print("已是最新版本")
    end
   else
    print("检测更新失败")
  end
end)