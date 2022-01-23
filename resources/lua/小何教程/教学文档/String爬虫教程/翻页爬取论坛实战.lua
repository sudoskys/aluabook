--创建布局，用于显示爬取效果
--翻页爬取的思路是：
--获取网页的翻页所有链接，然后循环请求爬取
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
      text='正在爬取中';--显示的文本
      textSize='16sp';--文本大小
    };
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口
--定义爬取翻页链接的网址
url = 'https://yum5.cn'
--请求链接
Http.get(url,nil,'utf8',nil,function(状态码,网页源码)
  --判断网站状态
  if 状态码 == 200 then
    --获取所有页数链接
    页数迭代器 = 网页源码:gmatch('<a href="index.-htm" class="page.-">(.-)</a>')
    --新建表，存放爬取数据
    页数={}
    --迭代页数迭代器，将数据存入表
    for i in 页数迭代器 do
      --这里筛选数字，因为部分数据是杂乱的
      if i:find('%d') then
        table.insert(页数,i:match('(%d.*)'))
      end
    end
  --获取到页数
    末尾页数 = tointeger(页数[#页数])
    --新建表，存放帖子标题
    帖子标题 = {}
    --循环页数
    for i=1,末尾页数 do
      --将页数拼接进链接
      url = 'https://yum5.cn/index-'..i..'.htm'
      --请求网页
      Http.get(url,nil,'utf8',nil,function(状态码,网页源码)
        --判断网站状态
        if 状态码 == 200 then
          --显示当前爬取页数
          table.insert(帖子标题,'第'..i..'页:\n\n')
          --爬取帖子标题信息
          帖子标题迭代器 = 网页源码:gmatch('<a href="thread.-htm">(.-)</a>')
          --迭代帖子标题迭代器，将数据存入表
          for v in 帖子标题迭代器 do
            table.insert(帖子标题,v)
          end
        --定义空文本，用于显示数据
          文本=''
          --遍历表，取出数据
          for k,v in pairs(帖子标题) do
            --将数据文本累加
            文本=文本..k..'：'..v..'\n'
          end
        --展示数据
          显示文本.setText(文本)
         else
          显示文本.setText('无法访问')
        end
      end)
    end
   else
    显示文本.setText('无法访问')
  end
end)