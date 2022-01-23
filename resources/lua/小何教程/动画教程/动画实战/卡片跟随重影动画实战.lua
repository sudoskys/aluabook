--创建布局，为教程提供良好的可视化
shamrock=
{
  --关于帧布局，也就是后创建的布局会直接堆叠在前面创建的布局之上
  FrameLayout;--帧布局
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  {
    LinearLayout;--线性布局
    Orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    background='';--布局背景颜色(或者图片路径)
    gravity='center';--设置居中
    {
      CardView;--卡片控件
      id='背景卡片';--绑定ID
      layout_margin='0';--卡片边距
      layout_gravity='center';--重力属性
      Elevation='0';--阴影属性
      layout_width='100';--卡片宽度
      layout_height='100';--卡片高度
      radius='20';--卡片圆角
      CardBackgroundColor='#8c7e5cf8';--卡片背景颜色
    };
  };
  {
    LinearLayout;--线性布局
    Orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    background='';--布局背景颜色(或者图片路径)
    gravity='center';
    {
      CardView;--卡片控件
      id='卡片';--绑定ID
      layout_margin='0';--卡片边距
      layout_gravity='center';--重力属性
      Elevation='0';--阴影属性
      layout_width='100';--卡片宽度
      layout_height='100';--卡片高度
      radius='20';--卡片圆角
      CardBackgroundColor='#ff7e5cf8';--卡片背景颜色
    };
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口
--封装动画函数，避免后面重复的动画代码
function 动画(view,x,y)
  --导入组合动画包
  import "android.animation.AnimatorSet"
  --设置属性动画
  animatorSet = AnimatorSet()--设置组合动画
  --对应参数分别是（id，需要改变的属性，{动画开始时需要改变的属性的值，动画结束时需要改变的属性的值}）
  scaleX = ObjectAnimator.ofFloat(view, "X", {view.getX(), x})
  scaleY = ObjectAnimator.ofFloat(view, "Y", {view.getY(), y})
  animatorSet.setDuration(1000)--动画时间
  animatorSet.setInterpolator(DecelerateInterpolator());--动画插值器
  animatorSet.play(scaleX).with(scaleY)--两个动画同时开始
  animatorSet.start();--动画开始
end
--监听屏幕触摸事件
function onTouchEvent(e)
  --获取到触摸的坐标
  X轴 = e.X
  Y轴 = e.Y
  --执行动画函数
  动画(卡片,X轴,Y轴)
  --延迟执行动画函数，实现重影效果
  task(20,function()
    动画(背景卡片,X轴,Y轴)
  end)
end
print("随意触摸屏幕查看效果")