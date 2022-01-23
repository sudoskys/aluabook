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
    Orientation='vertical';--布局方向
    layout_width='80%w';--布局宽度
    layout_height='80%h';--布局高度
    background='#ff7e5cf8';--布局背景颜色(或者图片路径)
    Gravity="center";--设置居中
    {
      LinearLayout;--线性布局
      id="框";--绑定id
      layout_margin="3";--设置边距
      Orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      background='#ffffff';--布局背景颜色(或者图片路径)
      gravity="center";--设置居中
    };
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口

function 添加圆(cardid)--封装添加函数
  大小=math.random(50,150)--随机大小
  圆={--定义布局表
    CardView;--卡片控件
    id=cardid;--绑定id
    Elevation='0';--阴影属性
    layout_width=大小;--卡片宽度
    layout_height=大小;--卡片高度
    radius=大小/2;--卡片圆角
    CardBackgroundColor='#ff7e5cf8';--卡片背景颜色
  };
  框.addView(loadlayout(圆))--添加布局至主布局
end

function 动画(view,x,y)--封装动画函数
  --导入组合动画包
  import "android.animation.AnimatorSet"
  --设置属性动画
  animatorSet = AnimatorSet()--设置组合动画
  --对应参数分别是（id，需要改变的属性，{动画开始时需要改变的属性的值，动画结束时需要改变的属性的值}）
  scaleX = ObjectAnimator.ofFloat(view, "X", {view.getX(), x})
  scaleY = ObjectAnimator.ofFloat(view, "Y", {view.getY(), y})
  animatorSet.setDuration(1000)--动画时间
  animatorSet.setInterpolator(DecelerateInterpolator());--动画插值器
  animatorSet.play(scaleX).with(scaleY)--两个动画同时开始
  animatorSet.start();--动画开始
end

function 随意坐标(cardid)--封装随意坐标函数
  x轴=math.random(tointeger(activity.Width*0.1+1.5),tointeger(activity.Width*0.9-1.5-200))--随机x轴
  y轴=math.random(tointeger(activity.Height*0.1+1.5),tointeger(activity.Height*0.9-1.5-200))--随机y轴
  动画(cardid,x轴,y轴)--调用动画函数
end

for i=1,20 do--循环添加圆
  添加圆("圆"..i)
end

--Ticker定时器
ti=Ticker()
ti.Period=500--间隔
ti.onTick=function()--定时器函数
  随意坐标(񗁡)
  task(100,function()
    随意坐标(񗁢)
    随意坐标(񗁣)
    随意坐标(񗁤)
  end)
  随意坐标(񗁥)
  随意坐标(񗁦)
  随意坐标(񗁧)
  task(100,function()
    随意坐标(񗁨)
    随意坐标(񗁩)
    随意坐标(�����)
  end)
  随意坐标(�����)
  task(100,function()
    随意坐标(�����)
    随意坐标(�����)
    随意坐标(�����)
  end)
  随意坐标(�����)
  随意坐标(�����)
  随意坐标(�����)
  task(100,function()
    随意坐标(�����)
    随意坐标(�����)
    随意坐标(�����)
  end)
end
--启动Ticker定时器
ti.start()

function onStop()--活动停止监听
  ti.stop()--停止定时器
end