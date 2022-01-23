--导入jsoup库
import'org.jsoup.*'
--定义链接
url = 'http://dh.hfybbs.vip/cn/index.html'
--这里使用Http方法先获取到网页源码再解析。
--因为jsoup自带񶡌onnect方法是同步加载，会影响程序加载速度
Http.get(url,function(code,content)
  if code==200 then--判断网站状态
      doc = Jsoup.parse(content)--使用jsoup解析网页
      classification = doc.getElementsByClass('text-gray')--查找到所񧂜lass为text-gray的网页元素
      classification = luajava.astable(classification)--将其转换成table表
      for k,v in pairs(classification) do--循环打印输出
        print(v.text())
      end
   else
      print('无法访问')
   end
end)