import "android.graphics.Path"--导入依赖包
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
  画笔.setColor(0xff7e5cf8)
  path = Path()
  path.moveTo(10, 10) --移动到 坐�����,10
  path.lineTo(100, 50)--绘制直线
  path.lineTo(200,40)--绘制直线
  path.lineTo(300, 20)--绘制直线
  path.lineTo(200, 10)--绘制直线
  path.lineTo(100, 70)--绘制直线
  path.lineTo(50, 40)--绘制直线
  path.close()--闭合路径
  画布.drawPath(path,画笔)--画布绘制
end))