import "android.graphics.Path"
import "android.graphics.Paint"
import "android.graphics.Color"
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
  --绘制表盘
  画笔.setColor(0xff7e5cf8)--设置画笔颜色
  画笔.setStyle(Paint.Style.STROKE)--设置画笔样式
  画布.translate(画布.getWidth()/2, 200)--移动画布
  画布.drawCircle(0, 0, 100, 画笔)--绘制圆
  画布.save()--保存画布
  画布.translate(-75, -75)--移动画布
  --绘制文字
  path = Path()--初始化路径
  path.addArc(RectF(0,0,150,150), -180, 180)--绘制弧
  citePaint = Paint(画笔)--定义新画笔
  citePaint.setTextSize(14)--绘制文字的大小
  citePaint.setStrokeWidth(1)--绘制文字的粗细
  画布.drawTextOnPath("绘制表盘~", path, 28, 0, citePaint)--绘制文字
  画布.restore()--恢复画布
  tmpPaint = Paint(画笔)--定义新画笔
  tmpPaint.setStrokeWidth(1)--设置粗细
  --绘制刻度
  y=100--定义变量
  count = 60--定义变量
  for i=0,count do--循环
    if i%5==0 then--判断
      画布.drawLine(0, y, 0, y+12, 画笔)--绘制直线
      画布.drawText(tostring(i/5+1), -4, y+25, tmpPaint)--绘制文字
     else
      画布.drawLine(0, y, 0, y +5, tmpPaint)--绘制直线
    end
    画布.rotate(360/count,0,0)--选择画布
  end
  --绘制指针
  tmpPaint.setColor(Color.GRAY)--设置画笔颜色
  tmpPaint.setStrokeWidth(4)--设置粗细
  画布.drawCircle(0, 0, 7, tmpPaint)--绘制圆
  tmpPaint.setStyle(Paint.Style.FILL)--设置画笔样式
  tmpPaint.setColor(Color.YELLOW)--设置画笔颜色
  画布.drawCircle(0, 0, 5, tmpPaint)--绘制圆
  画布.drawLine(0, 10, 0, -65, 画笔)--绘制直线
end))