--导入组合动画类
import "android.animation.AnimatorSet"
--创建布局
shamrock=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  Gravity="center";--设置居中
  {
    LinearLayout;--线性布局
    id="按钮布局";--绑定id
    Orientation='vertical';--布局方向
    layout_width='400';--布局宽度
    layout_height='200';--布局高度
    background='';--布局背景颜色(或者图片路径)
    Gravity="center";--设置居中
    {
      CardView;--卡片控件
      id="按钮";--绑定id
      layout_margin='0';--卡片边距
      layout_gravity='center';--重力属性
      Elevation='0';--阴影属性
      layout_width='100';--卡片宽度
      layout_height='100';--卡片高度
      radius='50';--卡片圆角
      CardBackgroundColor='#ff7e5cf8';--卡片背景颜色
    };
    {
      TextView;--文本控件
      id="显示文字";--绑定id
      layout_width='wrap';--文本宽度
      layout_height='wrap';--文本高度
      Gravity='center';--重力属性
      textColor='#000000';--文本颜色
      text='来点我呀';--显示的文本
      textSize='16sp';--文本大小
    };
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口
显示文字列表={"点不到我吧~","来抓我呀~","略略略~","你好笨哦~","来呀来呀~"}--创建一个显示文字的表

按钮.onClick=function()--按钮点击事件

  x轴=math.random(0,activity.Width-400)--获取x轴随机数
  y轴=math.random(0,tointeger(activity.Height*0.8))--获取y轴随机数
  显示文字键=math.random(1,4)--获取显示文字随机数

  --设置属性动画
  animatorSet = AnimatorSet()--设置组合动画
  --对应参数分别是（id，需要改变的属性，{动画开始时需要改变的属性的值，动画结束时需要改变的属性的值}）
  scaleX = ObjectAnimator.ofFloat(按钮布局, "X", {按钮布局.getX(), x轴})
  scaleY = ObjectAnimator.ofFloat(按钮布局, "Y", {按钮布局.getY(), y轴})
  animatorSet.setDuration(1000)--动画时间
  animatorSet.setInterpolator(DecelerateInterpolator());--动画插值器
  animatorSet.play(scaleX).with(scaleY)--两个动画同时开始
  --animatorSet.play(scaleX).before(scaleY)--先执行scaleX，再执行scaleY
  animatorSet.start();--动画开始
  显示文字.Text=显示文字列表[显示文字键]--随机显示文字

end