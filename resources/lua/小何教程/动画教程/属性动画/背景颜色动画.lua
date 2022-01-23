--为了方便学习理解，我会用中文变量进行命名，但真正的项目中不推荐用中文哦
--首先创建一个布局进行动画测试
--背景颜色动画需要导入此包
import "android.animation.ArgbEvaluator"
import "android.graphics.Color"
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
--对应参数分别是（id，需要改变的属性，{此处可以是多个值，分别表示每次的颜色}）
背景动画 = ObjectAnimator.ofInt(卡片,"backgroundColor",{Color.RED, Color.BLUE, Color.GRAY})
背景动画.setInterpolator(DecelerateInterpolator())--动画插值器
背景动画.setDuration(1500)--动画时间
背景动画.setRepeatCount(-1)--动画循环
背景动画.setRepeatMode(Animation.REVERSE)--循环模式
背景动画.setEvaluator(ArgbEvaluator())
--[[
ArgbEvaluator：这种评估者可以用来执行类型之间的插值整数值代򈚊RGB颜色。
FloatEvaluator：这种评估者可以用来执行浮点值之间的插值。
IntEvaluator：这种评估者可以用来执行类型int值之间的插值。
RectEvaluator：这种评估者可以用来执行类型之间的插值矩形值。

由于本例是改变View�����ckgroundColor属性的背景颜色所以此处使񵊊rgbEvaluator
]]
背景动画.start()--动画开始