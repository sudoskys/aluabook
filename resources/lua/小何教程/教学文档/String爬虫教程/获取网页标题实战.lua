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
    text='查询网站标题中';--显示的文本
    textSize='18sp';--文本大小
  };
};
activity.setContentView(loadlayout(shamrock))
--设置需要爬取的网站，可以随意更换
url = 'http://dh.hfybbs.vip'

--使用Http访问该网站，获取网页源码
Http.get(url,nil,'utf8',nil,function(状态码,网页源码)
  --判断返回状态码，确定网站的正常运行
  if 状态码 ==200 then
    --分析网页结构，发现标题在title标签内，所以进行截取
    title = 网页源码:match('<title>(.-)</title>')
    --将截取到的标题设置至文本显示
    文本.setText(title)
   else
    文本.setText('该网站无法访问')
  end
end)