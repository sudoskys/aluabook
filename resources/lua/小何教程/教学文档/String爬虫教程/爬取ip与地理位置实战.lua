--创建布局，显示爬取效果
shamrock=
--布局请写在这里
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  Gravity="center";--设置居中
  {
    TextView;--文本控件
    id="显示文本";--绑定id
    layout_width='wrap';--文本宽度
    layout_height='wrap';--文本高度
    Gravity='center';--重力属性
    textColor='#000000';--文本颜色
    text='正在查询中';--显示的文本
    textSize='16sp';--文本大小
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口
url="https://ip.cn/"--设置爬取链接
--设置爬取请求头
header={
  ["User-Agent"]= "Mozilla/5.0 (Linux; U; Android 2.3.7; en-us; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1",
}
--请求网页源码
Http.get(url,nil,"utf8",header,function(状态码,网页源码)
  --判断网站状态
  if 状态码==200 then
    --根据网页，分析出筛选规则
    ip地址=网页源码:match('您现在的 IP：<code>(.-)</code>')
    地理位置=网页源码:match('所在地理位置：<code>(.-)</code>')
    --设置文本进行显示
    文本=string.format("您现在的 IP：%s\n您所在地理位置：%s",ip地址,地理位置)
    显示文本.setText(文本)
   else
    显示文本.setText("网站无法访问")
  end
end)