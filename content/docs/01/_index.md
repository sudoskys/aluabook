---
weight: 1
bookFlatSection: true
title: "01 初步认识LUA"
---

# 初步认识LUA
-------------

标准文档看这里  [LUA 5.3 参考手册](https://www.runoob.com/manual/lua53doc/contents.html)

翻译版本（云风翻译）[LUA 5.3 中文手册](https://www.codingnow.com/2000/download/lua_manual.html)



## 快速认识一下普遍写法
LUA简洁优美，Androlua提供的自带包大大方便了我们的开发。

```lua
--simplely use import (for androlua aide)
import "android.net.Uri"


--str
_love = 100000
_love = love + 1
print(_love)

_me_=str(_love).."diana"
print(_me_)

--my love ,diana see you
--[[
opps!
can you bilibili 关注向晚？

]]


--function
function mes(strs)
print(strs);print(123)
end
you=function(strs)
print(strs);print(123)
end
you("hi")
mes("hello")

function top(str,sc)
print(str)
sc("function here")
end
top("can use function",you)

--if else
if me==1 then
nai0=0
else
nai0=1
end


```

## 解惑
{{< hint danger >}}
**我该不该学习Androlua**
{{< /hint >}}
如果你开始学习了Alua,那么代表着两件事情。
- 你将成为一名 **独立应用开发者**
- 你踏入了**E4A**领域

简而言之，你在使用安卓开发安卓应用。

--------
Q：*Alua的社区环境如何？*

A：社区支持很少，我目前了解到的基本都是马来西亚（某报）与国内开发社群（QQ群多数,葫芦侠，某猫，官方论坛，自建论坛，以及衍生的Fusion app论坛-酷安）

-----------

Q：*Alua的开源例子如何？*

A：GITHUB基本没有关于alua的项目，大部分人选择在论坛或QQ群，应用内开源，开源的应用代码质量参次不齐。少有的优秀项目（比如 Tumeng，哈兔box ，云储 ，MYluaapp Mlua手册 ，风车等等）。


--------
Q：*Alua的开发者都是怎样的人？*

A：真正有学识的开发者较少，有眼界的也很少。大佬看不上，很多才子又因为可怜的社区支持跳板到了其他语言领域。这种情况在好转，不过仍缺乏一个大的论坛中心和足够有力的支持。


-----------







