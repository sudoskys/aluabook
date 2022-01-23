function loading文字动画对话框()
  import 'android.graphics.drawable.ShapeDrawable'
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

  function 绘制(str)
    dialog_anime.setBackgroundDrawable(LuaDrawable(function(canvas,paint,draw)
      paint.setTextSize(50)
      canvas.drawText(str,60,180,paint)
    end))
  end

  str="loading..."
  i=0
  ti=Ticker()
  ti.Period=200
  ti.onTick=function()
    --事件
    绘制(str:sub(0,i))
    i=i+1
    if(i==11) then
      i=0
    end
  end
  --启动Ticker定时器
  ti.start()
  --停止Ticker定时器
  dl.onDismiss=function()
    ti.stop()
  end
  return dl
end
dl=loading文字动画对话框()
--dl.dismiss()关闭对话框