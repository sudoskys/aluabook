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
--对应参数分别是（id，需要改变的属性，{动画开始时需要改变的属性的值，动画结束时需要改变的属性的值}）
平移动画 = ObjectAnimator.ofFloat(卡片, "X",{0, activity.Width})
平移动画.setInterpolator(DecelerateInterpolator())--动画插值器,具体取值看下方
平移动画.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
平移动画.setRepeatMode(Animation.REVERSE)--设置动画循环模式
平移动画.setDuration(1500)--动画时间
平移动画.start()--动画开始

--[[
Interpolatort通常在动画中使用，主要来改变动画变化率。

AccelerateDecelerateInterpolator()开始与结束的地方速率改变比较慢，在中间的时候加速

AccelerateInterpolator()开始的地方速率改变比较慢，然后开始加速

AnticipateInterpolator（）开始的时候向后然后向前甩

AnticipateOvershootInterpolator（）开始的时候向后然后向前甩一定值后返回最后的值

BounceInterpolator（）动画结束的时候弹起

CycleInterpolator（）循环播放特定的次数，速率改变沿着正弦曲线

DecelerateInterpolator（）在开始的地方快然后慢，实例经常使用它

LinearInterpolator（）以常量速率改变

OvershootInterpolator（）向前甩一定值后再回到原来位置
]]