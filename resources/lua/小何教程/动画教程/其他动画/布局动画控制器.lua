--为了方便学习理解，我会用中文变量进行命名，但真正的项目中不推荐用中文哦
--首先创建一个布局进行动画测试
shamrock=--创建一个布局表并将其赋给变量shamrock
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='';--布局背景颜色(或者图片路径)
  {
    ListView;--列表视图
    id='list';--绑定id
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    --dividerHeight='';--设置分隔线宽度,0表示无分隔线
    background='';--布局背景颜色(或者图片路径)
  };
};
activity.setContentView(loadlayout(shamrock))--将布局表添加至窗口

--使用适配器为list添加列表
数据={}
--添加项目数组
for i=1,10 do
  table.insert(数据,tostring(i))
end
--创建适配器
array_adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1,String(数据))
--设置适配器
list.setAdapter(array_adp)

--LayoutAnimationController可以控制一组控件按照规定显示 

--导入类
import "android.view.animation.AnimationUtils"
import "android.view.animation.LayoutAnimationController"


--创建一񎊪nimation对象
animation = AnimationUtils.loadAnimation(activity,android.R.anim.slide_in_left)

--得到对象
lac = LayoutAnimationController(animation)

--设置控件显示的顺序
lac.setOrder(LayoutAnimationController.ORDER_NORMAL)
--LayoutAnimationController.ORDER_NORMAL   顺序显示
--LayoutAnimationController.ORDER_REVERSE 反显示
--LayoutAnimationController.ORDER_RANDOM 随机显示

--设置控件显示间隔时间
lac.setDelay(1)--这里单位是秒

--设置组件应用
list.setLayoutAnimation(lac)