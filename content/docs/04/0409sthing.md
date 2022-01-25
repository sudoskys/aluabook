---
weight: 1
bookFlatSection: true
title: "04-09 事件"
---
# 事件

## 播放音频
 ```lua

--导入包

import "android.media.MediaPlayer"

local 音频播放器=MediaPlayer()

function 播放音频(路径)

音频播放器.reset()

.setDataSource(路径)

.prepare()

.start()

.setOnCompletionListener({

onCompletion=function()

print("播放完毕")

end})

end
 ```


## 强制结束自身并清除自身数据
 ```lua

os.execute("pm clear "..activity.getPackageName())
 ```


## 调用系统下载
 ```lua

--导入包

import "android.content.Context"

import "android.net.Uri"

downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);

url=Uri.parse("绝对下载链接");

request=DownloadManager.Request(url);

request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);

request.setDestinationInExternalPublicDir("目录名，可以是Download","下载的文件名");

request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);

downloadManager.enqueue(request);
 ```


## 获取本应用包名
 ```lua

activity.getPackageName()
 ```

## 删除ListView中某项
 ```lua

adp.remove(pos)
 ```

## 获取剪贴板内容
 ```lua

import"android.content.*"

--导入包

a=activity.getSystemService(Context.CLIPBOARD_SERVICE).getText()
 ```

## 对话框Dialog
 ```lua

--简单对话框

AlertDialog.Builder(this).setTitle("标题")

.setMessage("简单消息框")

.setPositiveButton("确定",nil)

.show();

--带有三个按钮的对话框

AlertDialog.Builder(this)

.setTitle("确认")

.setMessage("确定吗？")

.setPositiveButton("是",nil)

.setNegativeButton("否",nil)

.setNeutralButton("不知道",nil)

.show();

--带输入框的

AlertDialog.Builder(this)

.setTitle("请输入")

.setIcon(android.R.drawable.ic_dialog_info)

.setView(EditText(this))

.setPositiveButton("确定", nil)

.setNegativeButton("取消", nil)

.show();

--单选的

AlertDialog.Builder(this)

.setTitle("请选择")

.setIcon(android.R.drawable.ic_dialog_info)

.setSingleChoiceItems({"选项1","选项2","选项3","选项4"}, 0,

DialogInterface.OnClickListener() {

onClick(dialog,which) {

dialog.dismiss();

}

}

)

.setNegativeButton("取消", null)

.show();

--多选的

AlertDialog.Builder(this)

.setTitle("多选框")

.setMultiChoiceItems({"选项1","选项2","选项3","选项4"}, null, null)

.setPositiveButton("确定", null)

.setNegativeButton("取消", null)

.show();

--列表的

AlertDialog.Builder(this)

.setTitle("列表框")

.setItems({"列表项1","列表项2","列表项3"},nil)

.setNegativeButton("确定",nil)

.show();

--图片的

img = ImageView(this);

img.setImageResource(R.drawable.icon);

AlertDialog.Builder(this)

.setTitle("图片框")

.setView(img)

.setPositiveButton("确定",nil)

.show();
 ```

## 关于V4的圆形下拉刷新
 ```lua

--设置下拉刷新监听事件

swipeRefreshLayout.setOnRefreshListener(this);

--设置进度条的颜色

swipeRefreshLayout.setColorSchemeColors(Color.RED, Color.BLUE, Color.GREEN);

--设置圆形进度条大小

swipeRefreshLayout.setSize(SwipeRefreshLayout.LARGE);

--设置进度条背景颜色

swipeRefreshLayout.setProgressBackgroundColorSchemeColor(Color.DKGRAY);

--设置下拉多少距离之后开始刷新数据

swipeRefreshLayout.setDistanceToTriggerSync(50);
 ```



## 窗口回调事件
 ```lua

function onActivityResult()

--事件

end
 ```

## 列表下滑到最底事件
 ```lua

list.setOnScrollListener{

onScrollStateChanged=function(l,s)

if list.getLastVisiblePosition()==list.getCount()-1 then

--事件

end

end}
 ```


## 按两次返回键退出
 ```lua

参数=0

function onKeyDown(code,event)

if string.find(tostring(event),"KEYCODE_BACK") ~= nil then

if 参数+2 > tonumber(os.time()) then

activity.finish()

else

Toast.makeText(activity,"再按一次返回键退出" , Toast.LENGTH_SHORT )

.show()

参数=tonumber(os.time())

end

return true

end

end
 ```


## 延迟
 ```lua

--这个会卡进程，配合线程使用

Thread.sleep(延迟时间)

--这个不会卡进程

--500指延迟500毫秒

task(500,function()

--延迟之后执行的事件

end)
 ```


## 定时器
 ```lua

--timer定时器

t=timer(function()

--事件

end,延迟,间隔,初始化)

--暂停timer定时器

t.Enable=false

--启动timer定时器

t.Enable=true

--Ticker定时器

ti=Ticker()

ti.Period=间隔

ti.onTick=function()

--事件

end

--启动Ticker定时器

ti.start()

--停止Ticker定时器

ti.stop()
 ```

## 复制文本到剪贴板
 ```lua

--先导入包

import "android.content.*"

activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(文本)
 ```


## 保存图片到本地
 ```lua

function SavePicture(name,bm)

if bm then

import "java.io.FileOutputStream"

import "java.io.File"

import "android.graphics.Bitmap"

name=tostring(name)

f = File(name)

out = FileOutputStream(f)

bm.compress(Bitmap.CompressFormat.PNG,90, out)

out.flush()

out.close()

return true

else

return false

end

end
 ```




## 查询本地所有图片
 ```lua

function QueryAllImage()

import "android.provider.MediaStore"

cursor = activity.ContentResolver

mImageUri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;

mCursor = cursor.query(mImageUri,nil,nil,nil,MediaStore.Images.Media.DATE_TAKEN)

mCursor.moveToLast()

imageTable={}

while mCursor.moveToPrevious() do

path = mCursor.getString(mCursor.getColumnIndex(MediaStore.Images.Media.DATA))

table.insert(imageTable,tostring(path))

end

mCursor.close()

return imageTable

end

--返回一个表
 ```

## 递归查找文件
 ```lua

function outPath(ret)

for i,p in pairs(luajava.astable(ret)) do

print(p)

end

end

function find(catalog,name)

local n=0

local t=os.clock()

local ret={}

require "import"

import "java.io.File"

import "java.lang.String"

function FindFile(catalog,name)

local name=tostring(name)

local ls=catalog.listFiles() or File{}

for 次数=0,#ls-1 do

--local 目录=tostring(ls[次数])

local f=ls[次数]

if f.isDirectory() then--如果是文件夹则继续匹配

FindFile(f,name)

else--如果是文件则

n=n+1

if n%1000==0 then

print(n,os.clock()-t)

end

local nm=f.Name

if string.find(nm,name) then

--thread(insert,目录)

table.insert(ret,tostring(f))

end

end

luajava.clear(f)

end

end

FindFile(catalog,name)

call("outPath",ret)

end

import "java.io.File"

catalog=File("/sdcard/AndroLua")

name=".j?pn?g"

thread(find,catalog,name)
 ```




## 查询本地所有视频
 ```lua

function QueryAllVideo()

import "android.provider.MediaStore"

cursor = activity.ContentResolver

mImageUri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;

mCursor = cursor.query(mImageUri,nil,nil,nil,MediaStore.Video.Media.DATE_TAKEN)

mCursor.moveToLast()

VideoTable={}

while mCursor.moveToPrevious() do

path = mCursor.getString(mCursor.getColumnIndex(MediaStore.Video.Media.DATA))

table.insert(VideoTable,tostring(path))

end

mCursor.close()

return VideoTable

end

--返回一个表
 ```





## 播放音乐与视频
 ```lua

import "android.media.MediaPlayer"

mediaPlayer = MediaPlayer()

--初始化参数

mediaPlayer.reset()

--设置播放资源

mediaPlayer.setDataSource("storage/sdcard0/a.mp3")

--开始缓冲资源

mediaPlayer.prepare()

--是否循环播放该资源

mediaPlayer.setLooping(true)

--缓冲完成的监听

mediaPlayer.setOnPreparedListener(MediaPlayer.OnPreparedListener() {

onPrepared=function(mediaPlayer

mediaPlayer.start()

end});

--是否在播放

mediaPlayer.isPlaying()

--暂停播放

mediaPlayer.pause()

--从30位置开始播放

mediaPlayer.seekTo(30)

--停止播放

mediaPlayer.stop()

--播放视频

--视频的播放与音乐播放过程一样：

--先创建一个媒体对象

import "android.media.MediaPlayer"

mediaPlayer = MediaPlayer()

--初始化参数

mediaPlayer.reset()

--设置播放资源

mediaPlayer.setDataSource("storage/sdcard0/a.mp4")

--拿到显示的SurfaceView

sh = surfaceView.getHolder()

sh.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS)

--设置显示SurfaceView

mediaPlayer.setDisplay(sh)

--设置音频流格式

mediaPlayer.setAudioStreamType(AudioManager.Stream_Music)

--开始缓冲资源

mediaPlayer.prepare()

--缓冲完成的监听

mediaPlayer.setOnPreparedListener(MediaPlayer.OnPreparedListener{

onPrepared=function(mediaPlayer)

--开始播放

mediaPlayer.start()

end

});

--释放播放器

mediaPlayer.release()

--非原创
 ```

## 自定义默认弹窗标题,消息,按钮的颜色
 ```lua

dialog=AlertDialog.Builder(this)

.setTitle("标题")

.setMessage("消息")

.setPositiveButton("积极",{onClick=function(v) print"点击了积极按钮"end})

.setNeutralButton("中立",nil)

.setNegativeButton("否认",nil)

.show()

dialog.create()

--更改消息颜色

message=dialog.findViewById(android.R.id.message)

message.setTextColor(0xff1DA6DD)

--更改Button颜色

import "android.graphics.Color"

dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(0xff1DA6DD)

dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(0xff1DA6DD)

dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(0xff1DA6DD)

--更改Title颜色

import "android.text.SpannableString"

import "android.text.style.ForegroundColorSpan"

import "android.text.Spannable"

sp = SpannableString("标题")

sp.setSpan(ForegroundColorSpan(0xff1DA6DD),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)

dialog.setTitle(sp)
 ```


## 获取视频第一帧
 ```lua

function GetVideoFrame(path)

import "android.media.MediaMetadataRetriever"

media = MediaMetadataRetriever()

media.setDataSource(tostring(path))

return media.getFrameAtTime()

end
 ```


## 选择文件模块
 ```lua

import "android.widget.ArrayAdapter"

import "android.widget.LinearLayout"

import "android.widget.TextView"

import "java.io.File"

import "android.widget.ListView"

import "android.app.AlertDialog"

function ChoiceFile(StartPath,callback)

--创建ListView作为文件列表

lv=ListView(activity).setFastScrollEnabled(true)

--创建路径标签

cp=TextView(activity)

lay=LinearLayout(activity).setOrientation(1).addView(cp).addView(lv)

ChoiceFile_dialog=AlertDialog.Builder(activity)--创建对话框

.setTitle("选择文件")

.setView(lay)

.show()

adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1)

lv.setAdapter(adp)

function SetItem(path)

path=tostring(path)

adp.clear()--清空适配器

cp.Text=tostring(path)--设置当前路径

if path~="/" then--不是根目录则加上../

adp.add("../")

end

ls=File(path).listFiles()

if ls~=nil then

ls=luajava.astable(File(path).listFiles()) --全局文件列表变量

table.sort(ls,function(a,b)

return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)

end)

else

ls={}

end

for index,c in ipairs(ls) do

if c.isDirectory() then--如果是文件夹则

adp.add(c.Name.."/")

else--如果是文件则

adp.add(c.Name)

end

end

end

lv.onItemClick=function(l,v,p,s)--列表点击事件

项目=tostring(v.Text)

if tostring(cp.Text)=="/" then

路径=ls[p+1]

else

路径=ls[p]

end

if 项目=="../" then

SetItem(File(cp.Text).getParentFile())

elseif 路径.isDirectory() then

SetItem(路径)

elseif 路径.isFile() then

callback(tostring(路径))

ChoiceFile_dialog.hide()

end

end

SetItem(StartPath)

end

--ChoiceFile(StartPath,callback)

--第一个参数为初始化路径,第二个为回调函数

--原创
 ```

## 选择路径模块
 ```lua

require "import"

import "android.widget.ArrayAdapter"

import "android.widget.LinearLayout"

import "android.widget.TextView"

import "java.io.File"

import "android.widget.ListView"

import "android.app.AlertDialog"

function ChoicePath(StartPath,callback)

--创建ListView作为文件列表

lv=ListView(activity).setFastScrollEnabled(true)

--创建路径标签

cp=TextView(activity)

lay=LinearLayout(activity).setOrientation(1).addView(cp).addView(lv)

ChoiceFile_dialog=AlertDialog.Builder(activity)--创建对话框

.setTitle("选择路径")

.setPositiveButton("OK",{

onClick=function()

callback(tostring(cp.Text))

end})

.setNegativeButton("Canel",nil)

.setView(lay)

.show()

adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1)

lv.setAdapter(adp)

function SetItem(path)

path=tostring(path)

adp.clear()--清空适配器

cp.Text=tostring(path)--设置当前路径

if path~="/" then--不是根目录则加上../

adp.add("../")

end

ls=File(path).listFiles()

if ls~=nil then

ls=luajava.astable(File(path).listFiles()) --全局文件列表变量

table.sort(ls,function(a,b)

return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)

end)

else

ls={}

end

for index,c in ipairs(ls) do

if c.isDirectory() then--如果是文件夹则

adp.add(c.Name.."/")

end

end

end

lv.onItemClick=function(l,v,p,s)--列表点击事件

项目=tostring(v.Text)

if tostring(cp.Text)=="/" then

路径=ls[p+1]

else

路径=ls[p]

end

if 项目=="../" then

SetItem(File(cp.Text).getParentFile())

elseif 路径.isDirectory() then

SetItem(路径)

elseif 路径.isFile() then

callback(tostring(路径))

ChoiceFile_dialog.hide()

end

end

SetItem(StartPath)

end

import "android.os.*"

ChoicePath(Environment.getExternalStorageDirectory().toString(),

function(path)

print(path)

end)

--第一个参数为初始化路径,第二个为回调函数

--原创
 ```


## 获取视图中的所有文本
 ```lua

function GetAllText(view)

textTable={}

function GetText(Parent)

local number=Parent.getChildCount()

for i=0,number do

local view=Parent.getChildAt(i)

if pcall(function()view.addView(TextView(activity))end) then

GetText(view)

elseif pcall(function()view.getText()end) then

table.insert(textTable,tostring(view.Text))

end

end

end

GetText(view)

return textTable

end

print(table.unpack(GetAllText(Parent)))
 ```
