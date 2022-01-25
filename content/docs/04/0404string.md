---
weight: 1
bookFlatSection: true
title: "04-04 字符串"
---

# 字符串

------------------

{{< hint info >}}
**From MLUA**
{{< /hint >}}

## 字符串保留URL

------------------


```lua
string.gkeepUrl=function(str)

local strurltab={}

for i,v in string.gfind(str,"https?://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]") do

strurltab[#strurltab+1]=string.sub(str,i,v)

end

return strurltab

end

--返回的是table，该方式支持保留多个链接

--调用示例

str="MLuaForum https://www.mukapp.top/ Lua优化性能小结 https://www.mukapp.top/?thread-19.htm"

print(dump(str:gkeepUrl()))

local str1=""

for i,v in ipairs(string.gkeepUrl(str)) do

str1=str1..v.." "

end

print(str1)
```

## 字符串保留与过滤中文

------------------

```lua
--有中文符号会乱码

string.filterChinese=function(str)return string.gsub(str,"[\u4e00-\u9fa5]+","")end

string.keepChinese=function(str)return string.gsub(str,"[^\u4e00-\u9fa5]+","")end

--调用示例

str="MLua手册是一个全新的Androlua+的手册"

--过滤中文

print(string.filterChinese(str))

print(str:filterChinese())

--保留中文

print(string.keepChinese(str))

print(str:keepChinese())

```


## Json解析

------------------


```lua
--导入

JSON=import "json"

--json字符串

json_str=[==[

[

{

"title": "第一本书",

"bookId": "book_1"

},

{

"title": "第二本书",

"bookId": "book_2"

}

]

]==]

--解析json

json_o=JSON.decode(json_str)

--打印table

print(dump(json_o))

--遍历打印table

for i,v in ipairs(json_o) do

print(v.title,v.bookId)

end
```

## 匹配汉字
 ```lua

function filter_spec_chars(s)

local ss = {}

for k = 1, #s do

local c = string.byte(s,k)

if not c then break end

if (c>=48 and c<=57) or (c>= 65 and c<=90) or (c>=97 and c<=122) then

if not string.char(c):find("%w") then

table.insert(ss, string.char(c))

end

elseif c>=228 and c<=233 then

local c1 = string.byte(s,k+1)

local c2 = string.byte(s,k+2)

if c1 and c2 then

local a1,a2,a3,a4 = 128,191,128,191

if c == 228 then a1 = 184

elseif c == 233 then a2,a4 = 190,c1 ~= 190 and 191 or 165

end

if c1>=a1 and c1<=a2 and c2>=a3 and c2<=a4 then

k = k + 2

table.insert(ss, string.char(c,c1,c2))

end

end

end

end

return table.concat(ss)

end

print(filter_spec_chars("A1B2汉C3D4字E5F6,,,"))

--来源网络,加了个if过滤掉英文与数字,使其只捕获中文
 ```



## 判断数组中是否存在某个值
 ```lua

function Table_exists(tables,value)

for index,content in pairs(tables) do

if content:find(value) then

return true

end

end

end
 ```


## 字符串操作
 ```lua

strings="左中右"

--取字符串左边

左=strings:match("(.+)中")

--取字符串中间

中=strings:match("左(.-)右")

--取字符串右边

右=strings:match("(.+)右")

--替换

string.gsub(原字符串,替换的字符串,替换成的字符串)

--匹配子串位置

起始位置,结束位置=string.find(字符串,子串)

--按位置捕获字符串

string.sub(字符串,子串起始位置,子串结束位置)
 ```

## 剪切板操作
 ```lua

import "android.content.Context"

--导入类

a=activity.getSystemService(Context.CLIPBOARD_SERVICE).getText()

--获取剪贴板

activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(edit.Text)

--写入剪贴板
 ```


## 各种事件
 ```lua

function main(...)

--...是newActivity传递过来的参数。

print("入口函数",...)

end

function onCreate()

print("窗口创建")

end

function onStart()

print("活动开始")

end

function onResume()

print("返回程序")

end

function onPause()

print("活动暂停")

end

function onStop()

print("活动停止")

end

function onDestroy()

print("程序已退出")

end

function onResult(name,...)

--name：返回的活动名称

--...：返回的参数

print("返回活动",name,...)

end

function onCreateOptionsMenu(menu)

--menu：选项菜单。

menu.add("菜单")

end

function onOptionsItemSelected(item)

--item：选中的菜单项

print(item.Title)

end

function onConfigurationChanged(config)

--config：配置信息

print("屏幕方向关闭")

end

function onKeyDown(keycode,event)

--keycode：键值

--event：事件

print("按键按下",keycode)

end

function onKeyUp(keycode,event)

--keycode：键值

--event：事件

print("按键抬起",keycode)

end

function onKeyLongPress(keycode,event)

--keycode：键值

--event：事件

print("按键长按",keycode)

end

function onTouchEvent(event)

--event：事件

print("触摸事件",event)

end

function onKeyDown(c,e)

if c==4 then

--返回键事件

end

end

id.onClick=function()

--控件被单击

end

id.onLongClick=function()

--控件被长按

end

id.onItemClick=function(p,v,i,s)

--列表项目被单击

项目=v.Text

return true

end

id.onItemLongClick=function(p,v,i,s)

--列表项目被长按

项目=v.Text

return true

end

id.onItemLongClick=function(p,v,i,s)

--列表项目被长按

项目=v.Text

return true

end

--Spinner的项目单击事件

id.onItemSelected=function(l,v,p,i)

项目=v.Text

end

--ExpandableListView的父项目与子项目单击事件

id.onGroupClick=function(l,v,p,s)

print(v.Text..":GroupClick")

end

id.onChildClick=function(l,v,g,c)

print(v.Text..":ChildClick")

end
 ```



## 取随机数
 ```lua

math.random(最小值,最大值)
 ```

## 字符串操作
 ```lua

--字符串转大写

string.upper(字符串)

--字符串转小写

string.lower(字符串)

--字符串替换

string.gsub(字符串,被替换的字符,替换的字符,替换次数)
 ```

## 取字符串中间
 ```lua

string.match("左测试测试右","左(.-)右")
 ```
