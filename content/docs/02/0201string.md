---
weight: 1
bookFlatSection: true
title: "02-01 String"
---

# 字符串

------------

{{< hint info >}}
**From 小何**
{{< /hint >}}


## 字符串操作

### 转义符

```lua
\n  换行(LF) ，将当前位置移到下一行开头
\r  回车(CR) ，将当前位置移到本行开头
\t  水平制表(HT) （跳到下一个TAB位置）
\\  代表一个反斜线字符\
\'  代表一个单引号（撇号）字符
\"  代表一个双引号字符
\0  空字符(NULL)

```



### 链接字符串只需要使用 ```..```
```lua
print("i"..'love')
```

### 计算字符串长度使用```#字符串``` 

```lua
miao = "https://lua.dianas.cyou/"
print(#miao)

```

### 正则操作字符串

我们使用正则表达式来截取字符串，简单的截取请看示例

```lua

str="左中右"
--取左
左=str:match("(.+)中")
--取字符串中间
中=str:match("左(.-)右")
--取字符串右边
右=str:match("中(.+)")

```

常用正则如下
{{< expand "详细内容" "..." >}}

```lua
常用正则(Lua中需要将\换成%)：
非负整数：^\d+$
正整数：^[0-9]*[1-9][0-9]*$
非正整数：^((-\d+)|(0+))$
负整数：^-[0-9]*[1-9][0-9]*$
整数：^-?\d+$
非负浮点数：^\d+(\.\d+)?$
正浮点数 : ^((0-9)+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)$
非正浮点数：^((-\d+\.\d+)?)|(0+(\.0+)?))$
负浮点数：^(-((正浮点数正则式)))$
英文字符串：^[A-Za-z]+$
英文大写串：^[A-Z]+$
英文小写串：^[a-z]+$
英文字符数字串：^[A-Za-z0-9]+$
英数字加下划线串：^\w+$
E-mail地址：^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$
URL：^[a-zA-Z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\s*)?$ 
 或：^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$
邮政编码：^[1-9]\d{5}$
中文：^[\u0391-\uFFE5]+$
电话号码：^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$
手机号码：^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$
双字节字符(包括汉字在内)：^\x00-\xff
匹配首尾空格：(^\s*)|(\s*$)（像vbscript那样的trim函数）
匹配HTML标记：<(.*)>.*<\/\1>|<(.*) \/>
匹配空行：\n[\s| ]*\r
提取信息中的网络链接：(h|H)(r|R)(e|E)(f|F)  *=  *('|")?(\w|\\|\/|\.)+('|"|  *|>)?
提取信息中的邮件地址：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
提取信息中的图片链接：(s|S)(r|R)(c|C)  *=  *('|")?(\w|\\|\/|\.)+('|"|  *|>)?
提取信息中的IP地址：(\d+)\.(\d+)\.(\d+)\.(\d+)
提取信息中的中国手机号码：(86)*0*13\d{9}
提取信息中的中国固定电话号码：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}
提取信息中的中国电话号码（包括移动和固定电话）：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}
提取信息中的中国邮政编码：[1-9]{1}(\d+){5}
提取信息中的浮点数（即小数）：(-?\d*)\.?\d+
提取信息中的任何数字 ：(-?\d*)(\.\d+)? 
IP：(\d+)\.(\d+)\.(\d+)\.(\d+)
电话区号：/^0\d{2,3}$/
腾讯QQ号：^[1-9]*[1-9][0-9]*$
帐号(字母开头，允򋮅-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
中文、英文、数字及下划线：^[\u4e00-\u9fa5_a-zA-Z0-9]+$
匹配中文字符的正则表达式： [\u4e00-\u9fa5]
匹配双字节字符(包括汉字在内)：[^\x00-\xff]
匹配空行的正则表达式：\n[\s| ]*\r
匹配HTML标记的正则表达式：/<(.*)>.*<\/\1>|<(.*) \/>/
sql语句：^(select|drop|delete|create|update|insert).*$
匹配首尾空格的正则表达式：(^\s*)|(\s*$)
匹򑓞mail地址的正则表达式：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*

```

{{< /expand >}}


### 替换与捕获

```lua
--替换
string.gsub(str,appla,apple)
--原字符，替换目标，替换为

--定位并捕获
start,ends=string.find(字符串,子串)

target=string.sub(字符串,start,ends)

```


## 其他API

```lua
string.upper(argument)  字符串全部转为大写字母。
string.lower(argument)  字符串全部转为小写字母。

string.gsub(mainString,findString,replaceString,num)  在字符串中替换,mainString为要替换的字符串， findString 为被替换的字符，replaceString 要替换的字符，num 替换次数（可以忽略，则全部替换）
string.find (str, substr, [init, [end]])  在一个指定的目标字符串中搜索指定的内容(第三个参数为索引),返回其具体位置。不存在则返回 nil。
string.reverse(arg)  字符串反转
string.format(...)  返回一个类似printf的格式化字符串
string.char(arg) 和 string.byte(arg[,int])  char 将整型数字转成字符并连接， byte 转换字符为整数值(可以指定某个字符，默认第一个字符)。
string.len(arg)  计算字符串长度。
string.rep(string, n)  返回字符串string的n个拷贝
..  链接两个字符串
string.gmatch(str, pattern)  回一个迭代器函数，每一次调用这个函数，返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。如果参数 pattern 描述的字符串没有找到，迭代函数返回nil。
string.match(str, pattern, init)  string.match()只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认񎎡。 
在成功配对时, 函数将返回配对表达式中的所有捕获结果; 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil。

```

其中的```string.format()``` 的转义码如下

```markdown

%c - 接受一个数字, 并将其转化񎎪SCII码表中对应的字符
%d, %i - 接受一个数字并将其转化为有符号的整数格式
%o - 接受一个数字并将其转化为八进制数格式
%u - 接受一个数字并将其转化为无符号整数格式
%x - 接受一个数字并将其转化为十六进制数格式, 使用小写字母
%X - 接受一个数字并将其转化为十六进制数格式, 使用大写字母
%e - 接受一个数字并将其转化为科学记数法格式, 使用小写字񫳞
%E - 接受一个数字并将其转化为科学记数法格式, 使用大写字񫳞
%f - 接受一个数字并将其转化为浮点数格式
%g(%G) - 接受一个数字并将其转化为%e(%E, 对应%G)及%f中较短的一种格式
%q - 接受一个字符串并将其转化为可安全被Lua编译器读入的格式
%s - 接受一个字符串并按照给定的参数格式化该字符串

```


### LUA匹配模式

```lua
Lua的匹配模式：
.(点): 与任何字符配对
%a: 与任何字母配对
%c: 与任何控制符配对(例如\n)
%d: 与任何数字配对
%l: 与任何小写字母配对
%p: 与任何标点(punctuation)配对
%s: 与空白字符配对
%u: 与任何大写字母配对
%w: 与任何字母/数字配对
%x: 与任何十六进制数配对
%z: 与任何代򈚀的字符配对
%x(此处x是非字母非数字字符): 与字符x配对. 主要用来处理表达式中有功能的字符(^$()%.[]*+-?)的配对问题, 例如%%与%配对
[数个字符类]: 与任何[]中包含的字符类配对. 例如[%w_]与任何字母/数字, 或下划线符号(_)配对
[^数个字符类]: 与任何不包含在[]中的字符类配对. 例如[^%s]与任何非空白字符配对
单个字符类匹配该类别中任意单个字符；
单个字符类跟一个 '*'， 将匹配零或多个该类的字符。 这个条目总是匹配尽可能长的串；
单个字符类跟一个 '+'， 将匹配一或更多个该类的字符。 这个条目总是匹配尽可能长的串；
单个字符类跟一个 '-'， 将匹配零或更多个该类的字符。 和 '*' 不同， 这个条目总是匹配尽可能短的串；
单个字符类跟一个 '?'， 将匹配零或一个该类的字符。 只要有可能，它会匹配一个；
%n， 这里的 n 可以从 1 到 9； 这个条目匹配一个等于 n 号捕获物（后面有描述）的子串。
%bxy， 这里的 x 和 y 是两个明确的字符； 这个条目匹配以 x 开始 y 结束， 且其中 x 和 y 保持 平衡 的字符串。 意思是，如果从左到右读这个字符串，对每次读到一个 x 就 +1 ，读到一个 y 就 -1， 最终结束处的那个 y 是第一个记数到 0 的 y。 举个例子，条目 %b() 可以匹配到括号平衡的表达式。
%f[set]， 指 边境模式； 这个条目会匹配到一个位于 set 内某个字符之前的一个空串， 且这个位置的前一个字符不属于 set 。 集合 set 的含义如前面所述。 匹配出的那个空串之开始和结束点的计算就看成该处有个字符 '\0' 一样。

```