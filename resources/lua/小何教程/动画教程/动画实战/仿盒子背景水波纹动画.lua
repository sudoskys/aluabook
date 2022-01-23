import 'android.animation.AnimatorSet'
import 'android.graphics.Paint'
import 'android.animation.ObjectAnimator'
import 'android.view.animation.AccelerateInterpolator'
import 'android.graphics.Color'
bd = LuaDrawable(function(canvas,paint,draw)
  paint.setColor(Color.WHITE)
  paint.setStyle(Paint.Style.STROKE)
  paint.setStrokeWidth(5)
  canvas.drawCircle(draw.getBounds().centerX(),draw.getBounds().centerY(),draw.getBounds().height()/2-50,paint)
end)

SorrowClover=
{
  FrameLayout;--帧布局
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#F17F42';--布局背景颜色(或图片路径)
  {
    LinearLayout;--线性布局
    id='anime1';
    layout_width='400';--布局宽度
    layout_height='400';--布局高度
    BackgroundDrawable=bd;--布局背景颜色(或图片路径)
  };
  {
    LinearLayout;--线性布局
    id='anime2';
    layout_width='400';--布局宽度
    layout_height='400';--布局高度
    BackgroundDrawable=bd;--布局背景颜色(或图片路径)
    layout_gravity='center';
  };
  {
    LinearLayout;--线性布局
    id='anime3';
    layout_width='400';--布局宽度
    layout_height='400';--布局高度
    BackgroundDrawable=bd;--布局背景颜色(或图片路径)
    layout_gravity='bottom|right';
  };
};
activity.setContentView(loadlayout(SorrowClover))

animatorSet = AnimatorSet()--设置组合动画
--对应参数分别是（id，需要改变的属性，{动画开始时需要改变的属性的值，动画结束时需要改变的属性的值}）
scaleX1 = ObjectAnimator.ofFloat(anime1, "scaleX", {0, 1})
scaleY1 = ObjectAnimator.ofFloat(anime1, "scaleY", {0, 1})
scaleX1.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
scaleX1.setRepeatMode(Animation.RESTART)--设置动画循环模式
scaleX1.setDuration(2000)--动画时间
scaleY1.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
scaleY1.setRepeatMode(Animation.RESTART)--设置动画循环模式
scaleY1.setDuration(2000)--动画时间
scaleX2 = ObjectAnimator.ofFloat(anime2, "scaleX", {0, 1})
scaleY2 = ObjectAnimator.ofFloat(anime2, "scaleY", {0, 1})
scaleX2.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
scaleX2.setRepeatMode(Animation.RESTART)--设置动画循环模式
scaleX2.setDuration(3000)--动画时间
scaleY2.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
scaleY2.setRepeatMode(Animation.RESTART)--设置动画循环模式
scaleY2.setDuration(3000)--动画时间
scaleX3 = ObjectAnimator.ofFloat(anime3, "scaleX", {0, 1})
scaleY3 = ObjectAnimator.ofFloat(anime3, "scaleY", {0, 1})
scaleX3.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
scaleX3.setRepeatMode(Animation.RESTART)--设置动画循环模式
scaleX3.setDuration(2500)--动画时间
scaleY3.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限
scaleY3.setRepeatMode(Animation.RESTART)--设置动画循环模式
scaleY3.setDuration(2500)--动画时间
animatorSet.setInterpolator(AccelerateInterpolator());--动画插值器
animatorSet.playTogether({scaleX1,scaleY1,scaleX2,scaleY2,scaleX3,scaleY3})--动画同时开始
animatorSet.start();--动画开始