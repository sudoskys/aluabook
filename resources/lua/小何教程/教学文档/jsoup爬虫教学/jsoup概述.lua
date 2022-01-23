此篇教程必须最新版盒子才能正常运行！
jsoup概述：
jsoup是java里的一个普遍使用的html解析器，其的逻辑简单，语法容易，且功能强大。
(此篇教程我不会再用中文变量，中文太别扭。。。。。。)

񏑪ndrolua中并没有自带这个模块，我们需要将其导入
dex库下载链接：http://47.107.34.109:8000/d/c8f7ecb09db940de9725/
使用方法：工程目录下创建libs目录，将jsoup开头�����x文件放入,在程序开头加入 import'org.jsoup.*'即可

jsoup API：
从String解析文档
html = "<html><head><title>First parse</title></head>"
  + "<body><p>Parsed HTML into a doc.</p></body></html>"
doc = Jsoup.parse(html)

解析一个网页碎片
html = "<div><p>Lorem ipsum.</p>"
doc = Jsoup.parseBodyFragment(html)
body = doc.body()

从URL加载文档
doc = Jsoup.connect("http://example.com/").get()
title = doc.title()

高级url请求
doc = Jsoup.connect("http://example.com")
  .data("query", "Java")
  .userAgent("Mozilla")
  .cookie("auth", "token")
  .timeout(3000)
  .post()
  
从文件加载文档
input = new File("/tmp/input.html")
doc = Jsoup.parse(input, "UTF-8", "http://example.com/")

使񵊍OM方法导航文档
寻找元素
getElementById(String id)
getElementsByTag(String tag)
getElementsByClass(String className)
getElementsByAttribute(String key) （及相关方法）
元素的兄弟姐妹：siblingElements()󿃏irstElementSibling()，lastElementSibling()，nextElementSibling()，previousElementSibling()
图：parent()󿃌hildren()󿃌hild(int index)
元素数据
attr(String key)获取񔣊ttr(String key, String value)设置属性
attributes() 获得所有属性
id()󿃌lassName()񔣌lassNames()
text()获取和text(String value)设置文本内容
html()获取和html(String value)设置内部HTML内容
outerHtml() 获取外部HTML值
data()获取数据内容（例如script和style标签）
tag() 和 tagName()
处理HTML和文本
append(String html)， prepend(String html)
appendText(String text)， prependText(String text)
appendElement(String tagName)， prependElement(String tagName)
html(String value)

使用selector-syntax查找元素
选择器概述
tagname：按标签查找元素，例如 a
ns|tag：在命名空间中按标�����|name查找<fb:name>元素，例如查找元素
#id：按ID查找元素，例如 #logo
.class：按类名查找元素，例如 .masthead
[attribute]：具有属性的元素，例如 [href]
[^attr]：具有属性名称前缀的[^data-]元素，例如查找具有HTML5数据集属性的元素
[attr=value]：具有属性值的元素，例如[width=500]（也是可引用的[data-name='launch sequence']）
[attr^=value]，[attr$=value]，[attr*=value]：用与启动属性，以结束，或包含所述的值，例如元素[href*=/path/]
[attr~=regex]：具有与正则表达式匹配的属性值的元素; 例如img[src~=(?i)\.(png|jpe?g)]
*：所有元素，例如 *
选择器组合
el#id：具有ID的元素，例如 div#logo
el.class：带有类的元素，例如 div.masthead
el[attr]：具有属性的元素，例如 a[href]
任何组合，例如 a[href].highlight
ancestor child：从祖先下降的子元素，例如在类𠇋ody”的块下的任何位置.body p查找p元素
parent > child：直接从父级下降的子元素，例񙠭iv.content > p查找p元素; 񞝫ody > *找񒌋ody标签的直接子节点
siblingA + siblingB：找到兄񟇻元素之后紧接着兄񟇺，例如 div.head + div
siblingA ~ siblingX：找到兄񟇺前面的兄弟X元素，例如 h1 ~ p
el, el, el：对多个选择器进行分组，找到与任何选择器匹配的唯一元素; 例񙠭iv.masthead, div.logo
伪选择器
:lt(n)：找到其兄弟索引（即它񗊍OM树中相对于其父节点的位置）小于的元素n; 例如td:lt(3)
:gt(n)：查找兄弟索引大于的元素n; 例񙠭iv p:gt(2)
:eq(n)：查找兄弟索引等于的元素n; 例񙠯orm input:eq(1)
:has(selector)：查找包含与选择器匹配的元素的元素; 例񙠭iv:has(p)
:not(selector)：查找与选择器不匹配的元素; 例񙠭iv:not(.logo)
:contains(text)：查找包含给定文本的元素。搜索不区分大小写; 例如p:contains(jsoup)
:containsOwn(text)：查找直接包含给定文本的元素
:matches(regex)：查找文本与指定正则表达式匹配的元素; 例񙠭iv:matches((?i)login)
:matchesOwn(regex)：查找自己的文本与指定正则表达式匹配的元素
注意，上面的索引伪选择器是基񎣠的，即第一个元素是索񟅐，第二个元素񦋱

从元素中提取属性，文本和HTML
要获取属性的值，请使用该Node.attr(String key)方法
对于元素（及其组合子元素）上的文本，请使用 Element.text()
对于HTML，使񵊎lement.html()或Node.outerHtml()
上述方法是元素数据访问方法的核心。还有其他人：
Element.id()
Element.tagName()
Element.className() 和 Element.hasClass(String className)
所有这些访问器方法都有相应的setter方法来更改数据。

设置属性值
使用属性setter方񬵞lement.attr(String key, String value)，񔣎lements.attr(String key, String value)。
如果需要修񥎜lass元素的属性，请使񵊎lement.addClass(String className)񔣎lement.removeClass(String className)方法。

设置元素的HTML
div = doc.select("div").first()
div.html("<p>lorem ipsum</p>")
div.prepend("<p>First</p>")
div.append("<p>Last</p>")

Element span = doc.select("span").first()
span.wrap("<li><a href='http://example.com/'></a></li>")

设置元素的文本内容
Element div = doc.select("div").first()
div.text("five > four")
div.prepend("First ")
div.append(" Last")