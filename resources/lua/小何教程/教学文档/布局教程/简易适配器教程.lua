--[[
适配器适用于有高度规律的列表，网格等视图。
想要动态为此类控件添加项目就必须得要依靠适配器
下面�����rrayAdapter(简单适配器)的用法
]]
--写个布局，里面有个列表控件，设置id为list
SorrowClover=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或图片路径)
  {
    ListView;--列表视图
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    DividerHeight='1';--设置分隔线宽度,0表示无分隔
    id="list";--设置id
  };
};
activity.setContentView(loadlayout(SorrowClover))--显示布局

数据={}--定义一个表，用于适配器添加至列表的数据
--添�����位数进去表
for i=1,10 do
  table.insert(数据,tostring(i))
end
--创建适配器，将表添加进适配器。那些看不懂的英文可以不用管，当成固定语法就好。以后懂了可以再去了解。
适配器=ArrayAdapter(activity,android.R.layout.simple_list_item_1,数据)
--为列表设置适配器
list.setAdapter(适配器)

--这样最简单的适配器就完成了。可以手动更改一下添加进表的数字，看看效果。