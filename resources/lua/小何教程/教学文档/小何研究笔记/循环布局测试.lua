shamrock=
--布局请写在这里
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  {
    ScrollView;--纵向滚动
    layout_width='fill';--宽
    layout_height='fill';--高
    --隐藏竖向滚动滑条
    VerticalScrollBarEnabled=false;
    {
      LinearLayout;--线性布局
      Orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      id="list",
    };
  };
};
activity.setContentView(loadlayout(shamrock))

function 添加布局(i)
  布局={
    LinearLayout;--线性布局
    Orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='100dp';--布局高度
    Gravity="center",
    {
      CardView;--卡片控件
      Elevation='3';--阴影属性
      layout_width='80%w';--卡片宽度
      layout_height='80dp';--卡片高度
      radius='20';--卡片圆角
      CardBackgroundColor='#ff7e5cf8';--卡片背景颜色
      onClick=function()
        print(i)
      end
    };
  };
  return 布局
end

for i=1,10 do
  布局=添加布局(i)
  list.addView(loadlayout(布局))
end