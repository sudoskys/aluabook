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

--设置动画的属性
缩放动画=ScaleAnimation(0,1,0,1,Animation.RELATIVE_TO_SELF,0.5,Animation.RELATIVE_TO_SELF,0.5)
缩放动画.setDuration(800)--设置动画时间
缩放动画.setFillAfter(true)--设置动画后停留位置
缩放动画.setRepeatCount(-1)--设置无限循环
--绑定动画
卡片.startAnimation(缩放动画)

--[[
缩放动画属性详解：
ScaleAnimation(float fromX, float toX, float fromY, float toY,int pivotXType, float pivotXValue, int pivotYType, float pivotYValue) 
float fromX 动画起始时 X坐标上的伸缩尺寸 
float toX 动画结束时 X坐标上的伸缩尺寸 
float fromY 动画起始时Y坐标上的伸缩尺寸 
float toY 动画结束时Y坐标上的伸缩尺寸 
int pivotXType 动画在X轴相对于物件位置类型 
float pivotXValue 动画相对于物件的X坐标的开始位置 
int pivotYType 动画在Y轴相对于物件位置类型 
float pivotYValue 动画相对于物件的Y坐标的开始位置 
pivotXType有三种默认值：

AnimAtion.RELATIVE_TO_PARENT 相对于父控件

AnimAtion.RELATIVE_TO_SELF 相对于符自己

AnimAtion.RELATIVE_TO_ABSOLUTE 绝对坐标
]]