--[[
文本组件即用于显示文本的组件
常用属性：
id	为组件绑定id，用于触发事件
layout_width	组件宽度
layout_height	组件高度
gravity	组件中内容对齐方向
text	显示的文本内容
textColor	字体颜色
textSize	字体大小
background	组件背景颜色
]]
--创建简单示例
shamrock=
{
  LinearLayout;--线性布局
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  gravity='center';--设置居中
  {
    TextView;--文本控件
    layout_width='fill';--文本宽度
    layout_height='fill';--文本高度
    Gravity='center';--重力属性
    textColor='#000000';--文本颜色
    text='Welcome AndroLuaBox';--显示的文本
    textSize='50sp';--文本大小
  };
};
activity.setContentView(loadlayout(shamrock))--添加布局至窗口