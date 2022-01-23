--创建布局
shamrock=
--布局框架
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  {
    --登录总界面
    CardView;--卡片控件
    layout_margin="5%w";--设置边距
    layout_gravity='center';--重力属性
    Elevation='5';--阴影属性
    layout_width='fill';--卡片宽度
    layout_height='fill';--卡片高度
    radius='30';--卡片圆角
    CardBackgroundColor='#ffffff';--卡片背景颜色
    {
      --登陆总布局
      LinearLayout;--线性布局
      Orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      {
        --上半部分布局
        LinearLayout;--线性布局
        Orientation='vertical';--布局方向
        layout_width='fill';--布局宽度
        layout_weight='6';--布局权重
        background='#FF4FB3AE';--布局背景颜色(或者图片路径)
        Gravity="center";--设置居中
        {
          TextView;--文本控件
          layout_width='wrap';--文本宽度
          layout_height='wrap';--文本高度
          Gravity='center';--重力属性
          textColor='#ffffff';--文本颜色
          text='Welcome';--显示的文本
          textSize='50sp';--文本大小
          padding="5%w";--设置内边距
        };
        {
          TextView;--文本控件
          layout_width='wrap';--文本宽度
          layout_height='wrap';--文本高度
          Gravity='center';--重力属性
          textColor='#FFDCF0EF';--文本颜色
          text='这是一个登陆布局实战';--显示的文本
          textSize='26sp';--文本大小
          padding="5%w";--设置内边距
        };
        {
          CardView;--卡片控件
          layout_marginTop="5%w";
          layout_gravity='center';--重力属性
          Elevation='5';--阴影属性
          layout_width='50%w';--卡片宽度
          layout_height='8%w';--卡片高度
          radius='30';--卡片圆角
          CardBackgroundColor='#FF7CCCC8';--卡片背景颜色
          {
            TextView;--文本控件
            layout_width='fill';--文本宽度
            layout_height='fill';--文本高度
            Gravity='center';--重力属性
            textColor='#FFFEFFFF';--文本颜色
            text='About App →';--显示的文本
            textSize='16sp';--文本大小
          };
        };
      };
      {
        --下半部分布局
        LinearLayout;--线性布局
        Orientation='vertical';--布局方向
        layout_width='fill';--布局宽度
        layout_weight='4';--布局权重
        background='#ffffff';--布局背景颜色(或者图片路径)
        Gravity="center";--设置居中
        {
          CardView;--卡片控件
          layout_margin='5%w';--卡片边距
          layout_gravity='center';--重力属性
          Elevation='0';--阴影属性
          layout_width='fill';--卡片宽度
          layout_height='18%w';--卡片高度
          radius='20';--卡片圆角
          CardBackgroundColor='#FF55B9B4';--卡片背景颜色
          {
            TextView;--文本控件
            layout_width='fill';--文本宽度
            layout_height='fill';--文本高度
            Gravity='center';--重力属性
            textColor='#ffffff';--文本颜色
            text='登陆';--显示的文本
            textSize='22sp';--文本大小
          };
        };
        {
          LinearLayout;--线性布局
          Orientation='horizontal';--布局方向
          layout_width='fill';--布局宽度
          layout_height='wrap';--布局高度
          background='';--布局背景颜色(或者图片路径)
          {
            CardView;--卡片控件
            layout_margin='5%w';--卡片边距
            Elevation='0';--阴影属性
            layout_weight='1';--卡片权重
            layout_height='18%w';--卡片高度
            radius='20';--卡片圆角
            CardBackgroundColor='#FFD0D0D0';--卡片背景颜色
            {
              CardView;--卡片控件
              layout_margin='3';--卡片边距
              layout_gravity='center';--重力属性
              Elevation='0';--阴影属性
              layout_width='fill';--卡片宽度
              layout_height='fill';--卡片高度
              radius='20';--卡片圆角
              CardBackgroundColor='#ffffff';--卡片背景颜色
              {
                TextView;--文本控件
                layout_width='fill';--文本宽度
                layout_height='fill';--文本高度
                Gravity='center';--重力属性
                textColor='#FF5F5F5F';--文本颜色
                text='注册';--显示的文本
                textSize='22sp';--文本大小
              };
            };
          };
          {
            CardView;--卡片控件
            layout_margin='5%w';--卡片边距
            layout_marginLeft="0";
            Elevation='0';--阴影属性
            layout_weight='1';--卡片权重
            layout_height='18%w';--卡片高度
            radius='20';--卡片圆角
            CardBackgroundColor='#FFD0D0D0';--卡片背景颜色
            {
              CardView;--卡片控件
              layout_margin='3';--卡片边距
              layout_gravity='center';--重力属性
              Elevation='0';--阴影属性
              layout_width='fill';--卡片宽度
              layout_height='fill';--卡片高度
              radius='20';--卡片圆角
              CardBackgroundColor='#ffffff';--卡片背景颜色
              {
                TextView;--文本控件
                layout_width='fill';--文本宽度
                layout_height='fill';--文本高度
                Gravity='center';--重力属性
                textColor='#FF5F5F5F';--文本颜色
                text='协议';--显示的文本
                textSize='22sp';--文本大小
              };
            };
          };
        };
      };
    };
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加窗口