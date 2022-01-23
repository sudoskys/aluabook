--首先创建一个布局，为教程提供良好的可视化
shamrock=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  Gravity='center';--设置居中
  {
    TextView;--文本控件
    id='文本';--绑定ID
    layout_margin='5%w';--布局外边距
    layout_width='wrap';--文本宽度
    layout_height='wrap';--文本高度
    Gravity='center';--重力属性
    textColor='#000000';--文本颜色
    text='爬取内容中';--显示的文本
    textSize='18sp';--文本大小
  };
};
activity.setContentView(loadlayout(shamrock))
--设置需要爬取的网站，可以随意更换
url = 'http://dh.hfybbs.vip/cn/index.html'

--使用Http访问该网站，获取网页源码
Http.get(url,nil,'utf8',nil,function(状态码,网页源码)
  --判断返回状态码，确定网站的正常运行
  if 状态码 ==200 then
    --分析网页源码，使用gmatch筛选出所有符合条件的内容，gamtch返回的是迭代器
    网页框架 = 网页源码:gmatch('<ul.->(.-)</ul>')
    --定义一个空表，用来存储获取的网页数据
    网页框架表 = {}
    --将gmatch函数返回的迭代器进行遍历，取出数据，然后存进网页框架表表
    for i in 网页框架 do
      --判断是否可以筛选需要爬取的内容，可以才存放进网页框架表
      if i:match('<span.->(.-)</span>') then
        table.insert(网页框架表,i:match('<span.->(.-)</span>'))
      end
    end
  --定义一个空字符串，用于显示效果
  显示文本 = ''
  --遍历表，将爬取到的数据取出
  for k,v in pairs(网页框架表) do
    --累加文本，将表内数据形成可视化
    显示文本=显示文本..'\n'..string.format('分类%d：%s',k,v)
  end
--设置文本显示，显示爬取效果
    文本.setText(显示文本)
   else
    文本.setText('获取内容失败')
  end
end)