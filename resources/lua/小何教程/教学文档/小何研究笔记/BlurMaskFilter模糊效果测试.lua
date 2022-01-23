import 'android.graphics.BlurMaskFilter'
import 'android.graphics.Color'
import 'android.graphics.Paint'
SorrowClover=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或图片路径)
  {
    LinearLayout;--线性布局
    id='text1';
    layout_width='fill';--布局宽度
    layout_weight='1';
  };
  {
    LinearLayout;--线性布局
    id='text2';
    layout_width='fill';--布局宽度
    layout_weight='1';
  };
  {
    LinearLayout;--线性布局
    id='text3';
    layout_width='fill';--布局宽度
    layout_weight='1';
  };
  {
    LinearLayout;--线性布局
    id='text4';
    layout_width='fill';--布局宽度
    layout_weight='1';
  };
};
activity.setContentView(loadlayout(SorrowClover))

function 模糊(控件,效果)
  控件.setBackgroundDrawable(LuaDrawable(function(画布,画笔,图像)
  画笔.setAntiAlias(true);
  画笔.setColor(Color.RED);
  画笔.setStyle(Paint.Style.FILL);
  画笔.setTextSize(50);
  画笔.setStrokeWidth(5);
  bmf = BlurMaskFilter(10,效果)
  画笔.setMaskFilter(bmf)
  画布.drawText("模糊测试", 100, 100, 画笔);
end))
end
模糊(text1,BlurMaskFilter.Blur.NORMAL)
模糊(text2,BlurMaskFilter.Blur.OUTER)
模糊(text3,BlurMaskFilter.Blur.INNER)
模糊(text4,BlurMaskFilter.Blur.SOLID)

--[==[
BlurMaskFilter.Blur.NORMAL：内外模糊
BlurMaskFilter.Blur.OUTER：外部模糊
BlurMaskFilter.Blur.INNER：内部模糊
BlurMaskFilter.Blur.SOLID：内部加粗，外部模糊
不止文字，只要是绘制的都可以模糊
]==]