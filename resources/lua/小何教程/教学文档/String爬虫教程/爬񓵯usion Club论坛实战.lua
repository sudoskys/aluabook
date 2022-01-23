--创建一个布局，为教程提供良好的可视化
--做一个爬虫，前期的分析网页工作需要做好
--明确目标，明白只需要哪些数据，以及如何处理数据
shamrock=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  {
    ScrollView;--纵向滚动
    layout_width='fill';--宽
    layout_height='fill';--高
    {
      TextView;--文本控件
      id='显示文本';--绑定ID
      layout_width='fill';--文本宽度
      layout_height='fill';--文本高度
      Gravity='center';--重力属性
      textColor='#000000';--文本颜色
      text='爬取中...';--显示的文本
      textSize='16sp';--文本大小
    };
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口

url="https://yum5.cn"--论坛网址
--HTTP请求网页源码
Http.get(url,nil,'utf8',nil,function(状态码,网页源码)
  --判断网站的访问情况
  if 状态码 == 200 then
    --获取到帖子标题数据
    帖子标题迭代器 = 网页源码:gmatch('<a href="thread.-htm">(.-)</a>')
    --创建帖子标题表
    帖子标题 = {}
    --遍历帖子标题数据，将数据存入表
    for i in 帖子标题迭代器 do
      table.insert(帖子标题,i)
    end
    --获取帖子链接数据
    帖子链接迭代器 = 网页源码:gmatch('<a href="(thread.-htm)">.-</a>')
    --创建帖子链接表
    帖子链接 = {}
    --遍历帖子链接数据，将其存入表
    for i in 帖子链接迭代器 do
      table.insert(帖子链接,i)
    end
    --定义一个空字符串，后面将数据展示到布局
    爬取内容 = ''
    --遍历所有数据
    for i=1,#帖子标题 do
      --累加字符串，使显示效果良好
      爬取内容 = 爬取内容..string.format('帖子标题：%s\n帖子链接：https://yum5.cn/%s\n',帖子标题[i],帖子链接[i])
    end
    --将数据显示
    显示文本.setText(爬取内容)
   else
    显示文本.setText('网站无法访问')
  end
end)