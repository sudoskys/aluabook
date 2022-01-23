--导入jsoup库
import'org.jsoup.*'
--定义链接
url = 'http://dh.hfybbs.vip'
--这里使用Http方法先获取到网页源码再解析。
--因为jsoup自带񶡌onnect方法是同步加载，会影响程序加载速度
Http.get(url,function(code,content)
  if code==200 then--判断网站状态
      doc = Jsoup.parse(content)--使用jsoup解析网页
      print(doc.title())--使用jsoup方法获取到网页标题
   else
      print('无法访问')
   end
end)