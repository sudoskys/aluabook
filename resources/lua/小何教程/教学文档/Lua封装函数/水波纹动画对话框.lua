function 水波纹动画对话框()
  import 'android.graphics.drawable.ShapeDrawable'
  import 'android.graphics.drawable.shapes.RoundRectShape'
  import 'android.graphics.Color'
  import 'android.graphics.Paint'
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

  function 绘制(i)
    dialog_anime.setBackgroundDrawable(LuaDrawable(function(canvas,paint,draw)
      paint.setColor(Color.BLUE)
      paint.setStyle(Paint.Style.STROKE)
      paint.setStrokeWidth(5)
      canvas.drawCircle(150,150,i,paint)
    end))
  end

  i=0
  ti=Ticker()
  ti.Period=20
  ti.onTick=function()
    --事件
    绘制(i)
    i=i+1
    if(i==50) then
      i=0
    end
  end
  --启动Ticker定时器
  ti.start()

  dl.onDismiss=function()
    ti.stop()
  end

  return dl
end
dl=水波纹动画对话框()
--dl.dismiss()关闭对话框