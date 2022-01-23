SorrowClover=
{
LinearLayout;--线性布局
Orientation='vertical';--布局方向
layout_width='fill';--布局宽度
layout_height='fill';--布局高度
background='#ffffff';--布局背景颜色(或图片路径)
gravity="center";
{
LinearLayout;--线性布局
id='btn_ele';
layout_width='200dp';--布局宽度
layout_height='100dp';--布局高度
{
Button;--按钮控件
layout_marginRight='3dp';--布局外边右距
layout_marginBottom='3dp';--布局外边底距
text='自定义阴影按钮';--显示的文本
textSize='18sp';--文本大小
textColor='#ffffff';--文本颜色
layout_width='fill';--按钮宽度
layout_height='fill';--按钮高度
id='btn';
};
};
};
activity.setContentView(loadlayout(SorrowClover))
import 'android.graphics.drawable.shapes.RoundRectShape'
import 'android.graphics.drawable.ShapeDrawable'
import 'android.graphics.Color'
import 'android.graphics.RectF'
btn_shape=ShapeDrawable(RoundRectShape({10,10,10,10,10,10,10,10},RectF(),{20,20,20,20,20,20,20,20}))
btn_shape.getPaint().setColor(Color.BLUE)
btn.setBackgroundDrawable(btn_shape)

btn_ele_shape=ShapeDrawable(RoundRectShape({20,20,20,20,20,20,20,20},RectF(),{20,20,20,20,20,20,20,20}))
btn_ele_shape.getPaint().setColor(Color.BLUE)
btn_ele_shape.setAlpha(300)
btn_ele.setBackgroundDrawable(btn_ele_shape)