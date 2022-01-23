--[[
线性布局即按水平或者垂直方向布局
常用属性：
Orientation	布局中组件的排列方式，有horizontal(水平)，vertical(垂直，默认)，两种方式
gravity	控制组件所包含的子元素的对齐方式，可多个组合，如(left|buttom)
layout_gravity	控制该组件在父容器里的对其方式
layout_width	布局的宽度，通常不直接写数字，用wrap,fill或者match填满父容器
layout_height	布局的高度，参数同上
id	为该组件设置一个资源id,用作事件触发
background	为该组件设置一个背景图片，或者直接用颜色覆盖

Weight(权重)讲解：
该属性是用来等比例划分区域
最简单的用法：要等比例划分，按比例即可

divider分割线：
该属性用于为LinearLayout设置分割线图片，通过showDivider来设置分割线
的所在位置，有四个可选值none,middle,begining,end。
divider	为LinearLayout设置分割线图片
showDividers	设置分割线所在的位置，有四个可选值none,middle,begining,end。
dividerPadding	设置分割线的padding
]]
--接下来创建一个布局，用作实例
shamrock=
{
  LinearLayout;--线性布局
  id='主布局';
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  {
    LinearLayout;--线性布局
    Orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='30%h';--布局高度
    background='#ff7e5cf8';--布局背景颜色(或者图片路径)
  };
  {
    LinearLayout;--线性布局
    Orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='30%h';--布局高度
    background='#ffc45cf8';--布局背景颜色(或者图片路径)
  };
  {
    LinearLayout;--线性布局
    Orientation='horizontal';--布局方向
    layout_width='fill';--布局宽度
    layout_height='30%h';--布局高度
    background='#ffffff';--布局背景颜色(或者图片路径)
    {
      LinearLayout;--线性布局
      Orientation='vertical';--布局方向
      layout_width='40%w';--布局宽度
      layout_height='fill';--布局高度
      background='#ff7e5cf8';--布局背景颜色(或者图片路径)
    };
    {
      LinearLayout;--线性布局
      Orientation='vertical';--布局方向
      layout_width='40%w';--布局宽度
      layout_height='fill';--布局高度
      background='#ff7e0ff8';--布局背景颜色(或者图片路径)
    };
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口