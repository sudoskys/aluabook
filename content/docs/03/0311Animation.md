---
weight: 1
bookFlatSection: true
title: "03-11 动画"
---

## 控件旋转
 ```lua

--Z轴上的旋转角度

View.getRotation()

--X轴上的旋转角度

View.getRotationX()

--Y轴上的旋转角度

View.getRotationY()

--设置Z轴上的旋转角度

View.setRotation(r)

--设置X轴上的旋转角度

View.setRotationX(r)

--设置Y轴上的旋转角度

View.setRotationY(r)

--设置旋转中心点的X坐标

View.setPivotX(p)

--设置旋转中心点的Y坐标

View.setPivotX(p)

--设置摄像机的与旋转目标在Z轴上距离

View.setCameraDistance(d)
 ```


## 动画结束回调
 ```lua

--导入包

import "android.view.animation.*"

import "android.view.animation.Animation$AnimationListener"

--控件动画

控件.startAnimation(AlphaAnimation(1,0).setDuration(400).setFillAfter(true).setAnimationListener(AnimationListener{

onAnimationEnd=function()

print"动画结束")

end}))
 ```


## 安卓跳转动画
 ```lua

android.R.anim.accelerate_decelerate_interpolator

android.R.anim.accelerate_interpolator

android.R.anim.anticipate_interpolator

android.R.anim.anticipate_overshoot_interpolator

android.R.anim.bounce_interpolator

android.R.anim.cycle_interpolator

android.R.anim.decelerate_interpolatoandroid.R.anim.r

android.R.anim.fade_in

android.R.anim.fade_out

android.R.anim.linear_interpolator

android.R.anim.overshoot_interpolator

android.R.anim.slide_in_left

android.R.anim.slide_out_right
 ```


## Animation(动画)
 ```lua

--动画主要包括以下几种

Alpha:渐变透明度动画效果

Scale:渐变尺寸伸缩动画效果

Translate:画面转换位置移动动画效果

Rotate:画面转换位置移动动画效果

--共有的属性有

Duration --属性为动画持续时间 时间以毫秒为单位

fillAfter --当设置为true,该动画转化在动画结束后被应用

fillBefore --当设置为true,该动画转化在动画开始前被应用

repeatCount--动画的重复次数

repeatMode --定义重复的行为

startOffset --动画之间的时间间隔，从上次动画停多少时间开始执行下个动画

id.startAnimation(Animation)--设置控件开始应用这个动画

--动画状态监听

import "android.view.animation.Animation$AnimationListener"

动画.setAnimationListener(AnimationListener{

onAnimationStart=function()

print"动画开始"

end,

onAnimationEnd=function()

print"动画结束"

end,

onAnimationRepeat=function()

print"动画重复"

end})

--实例

--控件向右旋转180度

Rotate_right=RotateAnimation(180, 0,

Animation.RELATIVE_TO_SELF, 0.5,

Animation.RELATIVE_TO_SELF, 0.5)

Rotate_right.setDuration(440)

Rotate_right.setFillAfter(true)

--控件向左旋转180度

Rotate_left=RotateAnimation(0, 180,

Animation.RELATIVE_TO_SELF, 0.5,

Animation.RELATIVE_TO_SELF, 0.5)

Rotate_left.setDuration(440)

Rotate_left.setFillAfter(true)

--动画设置___从上往下平移动画

Translate_up_down=TranslateAnimation(0, 0, 55, 0)

Translate_up_down.setDuration(800)

Translate_up_down.setFillAfter(true)

--动画设置___透明动画

Alpha=AlphaAnimation(0,1)

Alpha.setDuration(800)

--动画参数值

--AlphaAnimation(透明动画)

AlphaAnimation(float fromStart,float fromEnd)

float fromStart 动画起始透明值

float fromEnd 动画结束透明值

--ScaleAnimation(缩放动画)

ScaleAnimation(float fromX, float toX, float fromY, float toY,int pivotXType, float pivotXValue, int pivotYType, float pivotYValue)

float fromX 动画起始时 X坐标上的伸缩尺寸

float toX 动画结束时 X坐标上的伸缩尺寸

float fromY 动画起始时Y坐标上的伸缩尺寸

float toY 动画结束时Y坐标上的伸缩尺寸

int pivotXType 动画在X轴相对于物件位置类型

float pivotXValue 动画相对于物件的X坐标的开始位置

int pivotYType 动画在Y轴相对于物件位置类型

float pivotYValue 动画相对于物件的Y坐标的开始位置

--TranslateAnimation(位移动画)

TranslateAnimation(float fromXDelta, float toXDelta, float fromYDelta, float toYDelta)

float fromXDelta 动画开始的点离当前View X坐标上的差值

float toXDelta 动画结束的点离当前View X坐标上的差值

float fromYDelta 动画开始的点离当前View Y坐标上的差值

float toYDelta 动画结束的点离当前View Y坐标上的差值

--RotateAnimation(旋转动画)

RotateAnimation(float fromDegrees, float toDegrees, int pivotXType, float pivotXValue, int pivotYType, float pivotYValue)

float fromDegrees：旋转的开始角度.

float toDegrees：旋转的结束角度.

int pivotXType：X轴的伸缩模式，可以取值为ABSOLUTE、RELATIVE_TO_SELF、RELATIVE_TO_PARENT.

float pivotXValue：X坐标的伸缩值

int pivotYType：Y轴的伸缩模式，可以取值为ABSOLUTE、RELATIVE_TO_SELF、RELATIVE_TO_PARENT.

float pivotYValue：Y坐标的伸缩值.
 ```

## LayoutAnimationController(布局动画控制器)
 ```lua

--LayoutAnimationController可以控制一组控件按照规定显示

--导入类

import "android.view.animation.AnimationUtils"

import "android.view.animation.LayoutAnimationController"

--创建一个Animation对象

animation = AnimationUtils.loadAnimation(activity,android.R.anim.slide_in_left)

--得到对象

lac = LayoutAnimationController(animation)

--设置控件显示的顺序

lac.setOrder(LayoutAnimationController.ORDER_NORMAL)

--LayoutAnimationController.ORDER_NORMAL 顺序显示

--LayoutAnimationController.ORDER_REVERSE 反显示

--LayoutAnimationController.ORDER_RANDOM 随机显示

--设置控件显示间隔时间

lac.setDelay(time)

--设置组件应用

view.setLayoutAnimation(lac)
 ```

## ObjectAnimator(属性动画)
 ```lua

ObjectAnimator(对象动画)

--属性动画概念：

所谓属性动画：

改变一切能改变的对象的属性值，不同于补间动画

只能改变 alpha，scale，rotate，translate

听着有点抽象，举例子说明。

补间动画能实现的:

1.alpha(透明)

--第一个参数为 view对象,第二个参数为 动画改变的类型,第三,第四个参数依次是开始透明度和结束透明度。

alpha = ObjectAnimator.ofFloat(text, "alpha", 0, 1)

alpha.setDuration(2000)--设置动画时间

alpha.setInterpolator(DecelerateInterpolator())--设置动画插入器，减速

alpha.setRepeatCount(-1)--设置动画重复次数，这里-1代表无限

alpha.setRepeatMode(Animation.REVERSE)--设置动画循环模式。

alpha.start()--启动动画。

2.scale(缩放)

animatorSet = AnimatorSet()--组合动画

scaleX = ObjectAnimator.ofFloat(text, "scaleX", 1, 0)

scaleY = ObjectAnimator.ofFloat(text, "scaleY", 1, 0)

animatorSet.setDuration(2000)

animatorSet.setInterpolator(DecelerateInterpolator());

animatorSet.play(scaleX).with(scaleY)--两个动画同时开始

animatorSet.start();

3.translate(平移)

translationUp = ObjectAnimator.ofFloat(button, "Y",button.getY(), 0)

translationUp.setInterpolator(DecelerateInterpolator())

translationUp.setDuration(1500)

translationUp.start()

4. rotate(旋转)

set = AnimatorSet()

anim = ObjectAnimator .ofFloat(phone, "rotationX", 0, 180)

anim.setDuration(2000)

anim2 = ObjectAnimator .ofFloat(phone, "rotationX", 180, 0)

anim2.setDuration(2000)

anim3 = ObjectAnimator .ofFloat(phone, "rotationY", 0, 180)

anim3.setDuration(2000)

anim4 = ObjectAnimator .ofFloat(phone, "rotationY", 180, 0)

anim4.setDuration(2000)

set.play(anim).before(anim2)--先执行anim动画之后在执行anim2

set.play(anim3).before(anim4)

set.start()

补间动画不能实现的:

5.android 改变背景颜色的动画实现如下

translationUp = ObjectAnimator.ofInt(button,"backgroundColor",{Color.RED, Color.BLUE, Color.GRAY,Color.GREEN})

translationUp.setInterpolator(DecelerateInterpolator())

translationUp.setDuration(1500)

translationUp.setRepeatCount(-1)

translationUp.setRepeatMode(Animation.REVERSE)

translationUp.setEvaluator(ArgbEvaluator())

translationUp.start()

--[[

ArgbEvaluator：这种评估者可以用来执行类型之间的插值整数值代表ARGB颜色。

FloatEvaluator：这种评估者可以用来执行浮点值之间的插值。

IntEvaluator：这种评估者可以用来执行类型int值之间的插值。

RectEvaluator：这种评估者可以用来执行类型之间的插值矩形值。

由于本例是改变View的backgroundColor属性的背景颜色所以此处使用ArgbEvaluator

]]
 ```

## overridePendingTransition(设置窗口动画)
 ```lua

activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
 ```
