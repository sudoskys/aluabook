--[[
相对布局就是相对于其父组件或者兄弟组件进行布局
基本属性：
gravity	设置容器内组件的对齐方式
ignoreGravity	设置了该属性为true的属性的组件，将不受gravity属性的影响

根据父容器定位：
layout_alignParentLeft	左对齐
layout_alignParentRight	右对齐
layout_alignParentTop	顶部对齐
layout_alignParentBottom	底部对齐
layout_centerHorizontal	水平居中
layout_centerVertical	垂直居中
layout_centerParent	中间位置

根据兄弟组件定位：
layout_toLeftOf	参考组件的左边
layout_toRightOf	参考组件的右边
layout_above	参考组件的上方
layout_below	参考组件的下方
layout_alignTop	对齐参考组件的上边界
layout_alignBottom	对齐参考组件的下边界
layout_alignLeft	对齐参考组件的左边界
layout_alignRight	对齐参考组件的右边界

margin(偏移)：
设置组件与父容器的边距，又叫偏移
layout_margin	设置组件上下左右的偏移量
layout_marginLeft	设置组件离左边的偏移量
layout_marginRight	设置组件离右边的偏移量
layout_marginTop	设置组件离上面的偏移量
layout_marginBottom	设置组件离下面的偏移量

padding(填充)：
设置组件内部元素间的边距(比如TextView里的字体位置)
padding	往内部元素的上下左右填充一定边距
paddingLeft	往内部元素的左边填充一定边距
paddingRight	往内部元素的右边填充一定边距
paddingTop	往内部元素的上方填充一定边距
paddingBottom	往内部元素的下方填充一定边距
]]

--创建一个梅花布局进行示例
shamrock=
{
  RelativeLayout;--相对布局
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  {
    CardView;--卡片控件
    id="卡片";--绑定id
    Elevation='0';--阴影属性
    layout_width='100';--卡片宽度
    layout_height='100';--卡片高度
    radius='20';--卡片圆角
    layout_centerInParent="true";--设置居中
    CardBackgroundColor='#ff7e5cf8';--卡片背景颜色
  };
  {
    CardView;--卡片控件
    Elevation='0';--阴影属性
    layout_width='100';--卡片宽度
    layout_height='100';--卡片高度
    radius='20';--卡片圆角
    layout_toLeftOf="卡片";--位于卡片左边
    layout_centerVertical="true";--垂直居中
    CardBackgroundColor='#ffb95cf8';--卡片背景颜色
  };
  {
    CardView;--卡片控件
    Elevation='0';--阴影属性
    layout_width='100';--卡片宽度
    layout_height='100';--卡片高度
    radius='20';--卡片圆角
    layout_toRightOf="卡片";--位于卡片右边
    layout_centerVertical="true";--垂直居中
    CardBackgroundColor='#ffef5cf8';--卡片背景颜色
  };
  {
    CardView;--卡片控件
    Elevation='0';--阴影属性
    layout_width='100';--卡片宽度
    layout_height='100';--卡片高度
    radius='20';--卡片圆角
    layout_above="卡片";--位于卡片顶部
    layout_centerHorizontal="true";--水平居中
    CardBackgroundColor='#ff7ec3f8';--卡片背景颜色
  };
  {
    CardView;--卡片控件
    Elevation='0';--阴影属性
    layout_width='100';--卡片宽度
    layout_height='100';--卡片高度
    radius='20';--卡片圆角
    layout_below="卡片";--位于卡片底部
    layout_centerHorizontal="true";--水平居中
    CardBackgroundColor='#ff7e0ff8';--卡片背景颜色
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口