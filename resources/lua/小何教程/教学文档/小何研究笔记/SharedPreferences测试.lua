--[==[
SharedPreferences简称Sp，
是一种轻量级的数据存储方式,采用Key/value的方式进行映射，
最终会在手机的/data/data/package_name/shared_prefs/目录下以xml的格式存在。 
Sp通常用于记录一些参数配置、行为标记等！
因为其使用简单，所以大多数开发者用起来很爽！但是 
请注意：千万不要使用Sp去存储量大的数据，
也千万不要去让你的Sp文件超级大，
否则会大大影响应用性能
]==]
SorrowClover=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或图片路径)
  gravity="center";
  {
    EditText;--编辑框控件
    id="edit";
    singleLine=true;--设置单行输入
    layout_width='80%w';--编辑框宽度
    layout_height='50dp';--编辑框高度
    textSize='18sp';--文本大小
    textColor='#000000';--输入文本的颜色
    Hint='请输入需要储存的数据';--编辑框为空时提示的文本
    HintTextColor='#333333';--编辑框内容为空的时候显示文本的颜色
  };
  {
    Button;--按钮控件
    id="save_btn";
    text='储存数据';--显示的文本
    textSize='18sp';--文本大小
    textColor='#000000';--文本颜色
    layout_width='100dp';--按钮宽度
    layout_height='50dp';--按钮高度
    BackgroundColor='#ffffff';--按钮背景颜色
  };
  {
    Button;--按钮控件
    text='读取数据';--显示的文本
    id="read_btn";
    textSize='18sp';--文本大小
    textColor='#000000';--文本颜色
    layout_width='100dp';--按钮宽度
    layout_height='50dp';--按钮高度
    BackgroundColor='#ffffff';--按钮背景颜色
  };
};
activity.setContentView(loadlayout(SorrowClover))

import 'android.content.Context'
save_btn.onClick=function()
  if (edit.text == "") then
    print("我才不存储空数据呢!")
   else
    储存数据(edit.text)
  end
end

read_btn.onClick=function()
  读取数据()
end

function 储存数据(str)
  --获取SharedPreferences文件，后面的第一个参数就是文件名，没有会自己创建，有就读取
  sp = activity.getSharedPreferences("mysp", Context.MODE_PRIVATE)
  --设置编辑
  sped = sp.edit()
  --设置键值对
  sped.putString("user",str)
  --提交保存数据
  sped.commit()
  print("储存成功")
end

function 读取数据()
  --获取SharedPreferences文件
  sp = activity.getSharedPreferences("mysp", Context.MODE_PRIVATE)
  --打印对应的值
  print(sp.getString("user",""))
end