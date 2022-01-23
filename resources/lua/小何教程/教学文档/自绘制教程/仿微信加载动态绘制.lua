import 'android.graphics.Color'
import 'android.graphics.RectF'
SorrowClover=
{
LinearLayout;--线性布局
Orientation='vertical';--布局方向
layout_width='fill';--布局宽度
layout_height='fill';--布局高度
background='#ffffff';--布局背景颜色(或图片路径)
gravity='center';
{
LinearLayout;--线性布局
layout_width='100dp';--布局宽度
layout_height='100dp';--布局高度
id='dra';
};
};
activity.setContentView(loadlayout(SorrowClover))
function 绘制(角度)
dra.setBackgroundDrawable(LuaDrawable(function(canvs,paint,draw)
  paint.setAntiAlias(true)
  paint.setColor(Color.BLUE)
  canvs.drawArc(RectF(10,10,100,100),180,角度,true,paint)
  draw.invalidateSelf()
end))
end

for i=0,360 do
  task(10,function()
    绘制(i)
  end)
end