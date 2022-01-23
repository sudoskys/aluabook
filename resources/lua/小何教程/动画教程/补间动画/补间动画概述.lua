一，作用对象：
    视图控件（View）
    如TextView𰀛utton等等
    不可作用于View组件的属性，如：颜色、背景、长度等等

二，原理：
    通过确定开始的视图样式 & 结束的视图样式、中间动画变化过程由系统补全来确定一个动画
    结束的视图样式：平移、缩放、旋转 & 透明度样式
    即补间动画的动画效果就是：平移、缩放、旋转 & 透明度动画

三，分类：
    根据不同的动画效果，补间动画分񎎤种动画：
    平移动画（Translate）
    缩放动画（scale）
    旋转动画（rotate）
    透明度动画󿂊lpha）

四，共有属性：
    Duration --属性为动画持续时间 时间以毫秒为单位
    fillAfter --当设置为true,该动画转化在动画结束后被应用
    fillBefore --当设置为true,该动画转化在动画开始前被应用
    repeatCount--动画的重复次数 
    repeatMode --定义重复的行为 可取值:(Animation.RESTART从头开始)(Animation.REVERSE从结束开始)
    startOffset --动画之间的时间间隔，从上次动画停多少时间开始执行下个动画
    id.startAnimation(Animation)--设置控件开始应用这个动画

五，动画监听：
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