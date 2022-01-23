--[[
适配器适用于有高度规律的列表，网格等视图。
想要动态为此类控件添加项目就必须得要依靠适配器
下面是LuaAdapter(Lua适配器)的用法
lua适配器可以自定义列表的布局。此适配器能完成大部分需求。
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

--创建自定义项目视图，也就是一个文字视图。
item={
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  {
    TextView,
    id="text",
    layout_margin="15dp",
    layout_width="fill"
  },
}
--创建数据表
data={}
--创建适配器，将数据表和自定义视图添加进适配器
adp=LuaAdapter(activity,data,item)
--为数据表添加数据
for n=1,100 do
  table.insert(data,{
--值得一提的是，这里可以直接设置布局属性
--这里就是设置文字视图的文字属性，后面会有更详细的实例。
    text={
      Text=tostring(n), 
    }, 
  })
end
--为list设置适配器
list.Adapter=adp