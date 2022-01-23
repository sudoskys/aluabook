--[[
图像视图即用来展示图片的视图
常用属性：
src	图片路径

scaleType:
设置缩放类型
fitXY	对图像的横向与纵向进行独立缩放,使得该图片完全适应ImageView,但是图片的横纵比可能会发生改变
fitStart	保持纵横比缩放图片,知道较长的边与Image的编程相等,缩放完成后将图片放在ImageView的左上角
fitCenter	同上,缩放后放于中间;
fitEnd	同上,缩放后放于右下角;
center	保持原图的大小，显示在ImageView的中心。当原图的size大于ImageView的size，超过部分裁剪处理。
centerCrop	保持横纵比缩放图片,知道完全覆盖ImageView,可能会出现图片的显示不完全
centerInside	保持横纵比缩放图片,直到ImageView能够完全地显示图片
matrix	默认值，不改变原图的大小，从ImageView的左上角开始绘制原图， 原图超过ImageView的部分作裁剪处理
]]

shamrock=
--布局请写在这里
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  gravity='center';
  {
    ImageView;--图片控件
    src='icon.png';--图片路径
    layout_width='300';--图片宽度
    layout_height='300';--图片高度
    layout_gravity='center';--重力属性
    scaleType='fitXY';
  };
};
activity.setContentView(loadlayout(shamrock))