import 'android.graphics.Color'
SorrowClover=
{
LinearLayout;--线性布局
layout_width='fill';--布局宽度
layout_height='fill';--布局高度
background='#ffffff';--布局背景颜色(或图片路径)
id='test';
};
activity.setContentView(loadlayout(SorrowClover))

test.setBackgroundDrawable(LuaDrawable(function(canvas,paint,view_drawable)
  paint.setAntiAlias(true)
  paint.setColor(Color.BLUE)
  paint.setShadowLayer(45,10,10,Color.BLUE)
  canvas.drawCircle(200,200,100,paint)
  paint.setColor(Color.RED)
  paint.setShadowLayer(45,10,10,Color.RED)
  canvas.drawCircle(200,500,100,paint)
  paint.setColor(Color.GREEN)
  paint.setShadowLayer(45,10,10,Color.GREEN)
  canvas.drawCircle(200,800,100,paint)
end))
--[==[
setShadowLayer(
float radius ,
float dx,
float dy,
int color
)
在图形下面设置阴影层，产生阴影效果， 
radius为阴影的角度，
dx񔣍y为阴影在x轴和y轴上的距离，
color为阴影的颜色
部分机型不兼容。。。。原因不明。
]==]