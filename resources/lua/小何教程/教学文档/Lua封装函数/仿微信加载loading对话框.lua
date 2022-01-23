function 仿微信加载loading()
  import 'android.graphics.drawable.shapes.RoundRectShape'
  import 'android.graphics.drawable.ShapeDrawable'
  import 'android.graphics.Paint'
  import 'android.graphics.Color'
  import 'android.graphics.RectF'
  import 'android.graphics.drawable.shapes.RoundRectShape'
  dialog_layout={
    LinearLayout;--线性布局
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    background='#ffffff';--布局背景颜色(或图片路径)
    gravity='center';
    {
      LinearLayout;--线性布局
      id='dialog_anime';
      layout_width='300';--布局宽度
      layout_height='300';--布局高度
    };
  };
  dl = LuaDialog(this)
  dl.setCancelable(true)
  dl.setView(loadlayout(dialog_layout))
  dl.getWindow().setBackgroundDrawable(ShapeDrawable(RoundRectShape({12,12,12,12,12,12,12,12},nil,nil)))
  dl.show()
  function 绘制(角度)
    dialog_anime.setBackgroundDrawable(LuaDrawable(function(canvs,paint,draw)
      paint.setAntiAlias(true)
      paint.setColor(Color.BLUE)
      canvs.drawArc(RectF(100,100,200,200),180,角度,true,paint)
      paint2 = Paint()
      paint2.setStyle(Paint.Style.STROKE)
      paint2.setColor(Color.BLUE)
      canvs.drawCircle(150,150,60,paint2)
      draw.invalidateSelf()
    end))
  end
  i=0
  ti=Ticker()
  ti.Period=10
  ti.onTick=function()
    --事件
    绘制(i)
    i=i+1
    if(i==360) then
      i=0
    end
  end
  ti.start()
  dl.onDismiss=function()
    ti.stop()
  end
  return dl
end

dl = 仿微信加载loading()
--对话框消失󿆭l.dismiss()