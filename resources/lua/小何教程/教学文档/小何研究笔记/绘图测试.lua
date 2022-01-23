--绘图测试
import 'android.graphics.Color'
SorrowClover=
{
  LinearLayout;--线性布局
  id='main_canvas';
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
};
activity.setContentView(loadlayout(SorrowClover))
e_table = {}
function onTouchEvent(e)
  code = e.getAction()
  if(code==0) then
    table.insert(e_table,e.getX())
    table.insert(e_table,e.getY())
  elseif(code==2) then
    table.insert(e_table,e.getX())
    table.insert(e_table,e.getY())
  else
    table.insert(e_table,e.getX())
    table.insert(e_table,e.getY())
    main_canvas.setBackgroundDrawable(LuaDrawable(function(canvas,paint,draw)
      paint.setColor(Color.BLUE)
      canvas.drawLines(e_table,paint)
    end))
  end
end