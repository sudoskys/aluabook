--为了方便学习理解，我会用中文变量进行命名，但真正的项目中不推荐用中文哦
--首先创建一个布局进行动画测试
--组合动画需要导入此包
import "android.animation.AnimatorSet"
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
animatorSet = AnimatorSet()--设置组合动画
--对应参数分别是（id，需要改变的属性，{动画开始时需要改变的属性的值，动画结束时需要改变的属性的值}）
scaleX = ObjectAnimator.ofFloat(卡片, "scaleX", {1, 0})
scaleY = ObjectAnimator.ofFloat(卡片, "scaleY", {1, 0})
--组合动画的循环需要挨个设置
scaleX.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
scaleX.setRepeatMode(Animation.REVERSE)--设置动画循环模式
scaleY.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
scaleY.setRepeatMode(Animation.REVERSE)--设置动画循环模式
animatorSet.setDuration(2000)--动画时间
animatorSet.setInterpolator(DecelerateInterpolator());--动画插值器
animatorSet.playTogether({scaleX,scaleY})--两个动画同时开始
--animatorSet.playSequentially({scaleX,scaleY})--先执行scaleX，再执行scaleY
animatorSet.start();--动画开始