--创建布局，提供良好的示例
import "android.animation.AnimatorSet"
shamrock=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  Gravity="center";--设置居中
  {
    LinearLayout;--线性布局
    id="卡񲑱";--绑定id
    Orientation='vertical';--布局方向
    layout_width='200';--布局宽度
    layout_height='200';--布局高度
    background='';--布局背景颜色(或者图片路径)
    Gravity="center";--设置居中
    {
      CardView;--卡片控件
      layout_margin='0';--卡片边距
      layout_gravity='center';--重力属性
      Elevation='10';--阴影属性
      layout_width='100';--卡片宽度
      layout_height='100';--卡片高度
      radius='50';--卡片圆角
      CardBackgroundColor='#ff7e5cf8';--卡片背景颜色
    };
  };
  {
    LinearLayout;--线性布局
    id="卡񲑲";--绑定id
    Orientation='vertical';--布局方向
    layout_width='200';--布局宽度
    layout_height='500';--布局高度
    background='';--布局背景颜色(或者图片路径)
    Gravity="center";--设置居中
    {
      CardView;--卡片控件
      layout_margin='0';--卡片边距
      layout_gravity='center';--重力属性
      Elevation='10';--阴影属性
      layout_width='100';--卡片宽度
      layout_height='400';--卡片高度
      radius='20';--卡片圆角
      CardBackgroundColor='#ff7e5cf8';--卡片背景颜色
    };
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口

平移动񵎱 = ObjectAnimator.ofFloat(卡񲑱, "X",{-200, activity.Width/2-100})--设置属性动画
平移动񵎱.setInterpolator(OvershootInterpolator())--设置插值器
平移动񵎱.setDuration(1300)--设置动画时间
平移动񵎱.start()--开始动画

--设置属性动画
animatorSet = AnimatorSet()--设置组合动画
平移动񵎲 = ObjectAnimator.ofFloat(卡񲑲, "X", {-200, activity.Width/2-100})
旋转动画 = ObjectAnimator.ofFloat(卡񲑲, "rotation", {0, 15})
animatorSet.setDuration(400)--动画时间
animatorSet.setInterpolator(DecelerateInterpolator());--动画插值器
旋转动画.setRepeatCount(1)--设置动画重复次数
旋转动画.setRepeatMode(Animation.REVERSE)--设置动画循环模式
animatorSet.play(平移动񵎲).before(旋转动画)--先执行平移动񵎲，再执行旋转动画
animatorSet.start();--动画开始