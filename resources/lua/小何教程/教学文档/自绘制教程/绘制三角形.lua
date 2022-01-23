import 'android.graphics.Path'
import 'android.graphics.Paint'
SorrowClover=
{
LinearLayout;--线性布局
layout_width='fill';--布局宽度
layout_height='fill';--布局高度
BackgroundDrawable=LuaDrawable(function(canvas,paint,draw)
  paint.setColor(0xff333333)
  paint.setStyle(Paint.Style.STROKE)
  paint.setStrokeWidth(30)
  path = Path()
  path.moveTo(100,200)
  path.lineTo(200,100)
  path.lineTo(300,200)
  path.close()
  canvas.drawPath(path,paint)
end);--布局背景颜色(或图片路径)
};
activity.setContentView(loadlayout(SorrowClover))