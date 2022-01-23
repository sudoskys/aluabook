--为了方便学习理解，我会用中文变量进行命名，但真正的项目中不推荐用中文哦
--首先创建一个布局进行动画测试
shamrock=--创建一个布局表并将其赋给变量shamrock
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='';--布局背景颜色(或者图片路径)
  Gravity='center';--设置居中
  {
    CardView;--卡片控件
    id='卡片';--设置ID
    layout_margin='0';--卡片边距
    layout_gravity='center';--重力属性
    Elevation='1';--阴影属性
    layout_width='200';--卡片宽度
    layout_height='200';--卡片高度
    radius='10';--卡片圆角
    CardBackgroundColor='#ff7e5cf8';--卡片背景颜色
  };
};
activity.setContentView(loadlayout(shamrock))--将布局表添加至窗口

--设置属性动画
--第一个参数为id,第二个参数为 动画改变的类型,第三,第四个参数依次是开始透明度和结束透明度,注意用table表的形式（大括号括起来）。
透明动画 = ObjectAnimator.ofFloat(卡片, "alpha", {0, 1})
透明动画.setDuration(2000)--设置动画时间
透明动画.setInterpolator(DecelerateInterpolator())--设置动画插值器，减速
透明动画.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
透明动画.setRepeatMode(Animation.REVERSE)--设置动画循环模式。
透明动画.start()--启动动画。