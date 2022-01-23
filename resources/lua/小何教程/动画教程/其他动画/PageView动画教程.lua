--为了方便学习理解，我会用中文变量进行命名，但真正的项目中不推荐用中文哦
--首先创建一个布局进行动画测试
shamrock=
--布局请写在这里
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='';--布局背景颜色(或者图片路径)
  {
    PageView;--滑动窗体
    layout_weight='1';--剩余属性
    id='滑动窗体';--绑定ID
  };
};

activity.setContentView(loadlayout(shamrock))--将布局添加至窗口

--这里将用适配器为Pageview添加布局
adp = ArrayPageAdapter()--设置适配器
滑动窗体.setAdapter(adp)--绑定适配器
--新建一个布局，将其添加至Pageview
卡片 = {
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  Gravity='center';
  {
    CardView;--卡片控件
    layout_margin='0';--卡片边距
    layout_gravity='center';--重力属性
    Elevation='0';--阴影属性
    layout_width='200';--卡片宽度
    layout_height='200';--卡片高度
    radius='20';--卡片圆角
    CardBackgroundColor='0xff7e5cf8';--卡片背景颜色
  };
};
adp.add(loadlayout(卡片))--利用适配器将布局添加至Pageview
adp.add(loadlayout(卡片))
--Pageview动画需要导入此包
import'android.widget.PageView$PageTransformer'

默认参数 = 0.75--设置默认参数，后面计算动画参数
--Pageview官方动画函数
滑动窗体.setPageTransformer(true,PageTransformer{--获取到Pageview的位置
  transformPage = function(view,position)
    pageWidth = view.getWidth()
    if position<-1 then
      view.setAlpha(0)--设置透明度
     elseif position<=0 then
      view.setAlpha(1)
      view.setTranslationX(0)--设置偏移量(X轴平移)
      view.setScaleX(1)--设置X轴缩放
      view.setScaleY(1)--设置Y轴缩放

     elseif position<=1 then
      view.setAlpha(1-position)
      view.setTranslationX(pageWidth*-position)
      动画参数 = 默认参数+(1-默认参数)*(1-Math.abs(position))--动态计算动画参数
      view.setScaleX(动画参数)
      view.setScaleY(动画参数)

     else
      view.setAlpha(0)
    end
  end
})
--这个为谷歌官方开源的动画函数，类似的还有很多很多
--开源链接：https://github.com/ToxicBakery/ViewPagerTransforms