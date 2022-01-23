import "android.graphics.RectF"--导入依赖包
--创建示例布局
shamrock=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  id='布局画布';--绑定id
};
activity.setContentView(loadlayout(shamrock))--显示布局
布局画布.setBackground(--设置背景
LuaDrawable(--设置自绘制
function(画布,画笔)--绘制函数
  画笔.setColor(0xff7e5cf8)--设置画笔
  画布.drawArc(RectF(0,0,100,100),0,90,true,画笔)--画布绘制弧
end))