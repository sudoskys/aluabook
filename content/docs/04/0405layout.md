---
weight: 1
bookFlatSection: true
title: "04-05 界面&布局"
---

# 布局

------------------

{{< hint info >}}
**From MLUA**
{{< /hint >}}

## 布局基础
-----


## 获取ListView垂直坐标
 ```lua

function getScrollY()

c = ls.getChildAt(0);

local firstVisiblePosition = ls.getFirstVisiblePosition();

local top = c.getTop();

return -top + firstVisiblePosition * c.getHeight() ;

end
 ```



## 设置控件图片
 ```lua

--设置的图片也可以输入路径

ID.setImageBitmap(loadbitmap("图片.png"))
 ```

## 获取控件宽高
 ```lua

--导入包

import "android.content.Context"

function getwh(view)

view.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));

height =view.getMeasuredHeight();

width =view.getMeasuredWidth();

return width,height

end

print(getwh(控件ID))
 ```

## 隐藏滚动条
 ```lua

--横向

horizontalScrollBarEnabled=false;

--竖向

VerticalScrollBarEnabled=false;
 ```

## 禁用编辑框
 ```lua

--代码中设置

editText.setFocusable(false);

--布局表中设置

Focusable=false;
 ```

## 标题栏返回按钮
 ```lua

activity.getActionBar().setDisplayHomeAsUpEnabled(true)
 ```

## 列表长按事件
 ```lua

ID.setOnItemLongClickListener(AdapterView.OnItemLongClickListener{

onItemLongClick=function(parent, v, pos,id)

--事件

end

})
 ```

## 列表点击事件
 ```lua

ID.setOnItemClickListener(AdapterView.OnItemClickListener{

onItemClick=function(parent, v, pos,id)

--事件

end

})
 ```

## 隐藏标题栏
 ```lua

activity.ActionBar.hide()
 ```



## 设置控件大小
 ```lua

--设置宽度

linearParams = 控件ID.getLayoutParams()

linearParams.width =宽度

控件ID.setLayoutParams(linearParams)

--同理设置高度

linearParams = 控件ID.getLayoutParams()

linearParams.height =高度

控件ID.setLayoutParams(linearParams)
 ```

## 载入窗口传参
 ```lua

activity.newActivity("窗口名",{参数})

--渐变动画效果的，中间是安卓跳转动画代码

activity.newActivity("窗口名",android.R.anim.fade_in,android.R.anim.fade_out,{参数})
 ```

## EditText只能输数字
 ```lua

import "android.text.InputType"

import "android.text.method.DigitsKeyListener"

控件ID.setInputType(InputType.TYPE_CLASS_NUMBER)

控件ID.setKeyListener(DigitsKeyListener.getInstance("0123456789"))
 ```

## 窗口全屏
 ```lua

activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
 ```

## 关闭当前窗口
 ```lua

activity.finish()
 ```


## TextView文本可选择复制
 ```lua

--代码中设置

t.TextIsSelectable=true

--布局表中设置

textIsSelectable=true
 ```


## EditText文本被改变事件
 ```

控件ID.addTextChangedListener{

onTextChanged=function(s)

--事件

end

}
 ```



## 标题栏菜单按钮
 ```lua

tittle={"分享","帮助","皮肤","退出"}

function onCreateOptionsMenu(menu)

for k,v in ipairs(tittle) do

if tittle[v] then

local m=menu.addSubMenu(v)

for k,v in ipairs(tittle[v]) do

m.add(v)

end

else

local m=menu.add(v)

m.setShowAsActionFlags(1)

end

end

end

function onMenuItemSelected(id,tittle)

if y[tittle.getTitle()] then

y[tittle.getTitle()]()

end

end

y={}

y["帮助"]=function()

--事件

end

--菜单

function onCreateOptionsMenu(menu)

menu.add("打开").onMenuItemClick=function(a)

end

menu.add("新建").onMenuItemClick=function(a)

end

end
 ```


## 标题栏(ActionBar)
 ```lua

--部分常用API

show:显示

hide:隐藏

Elevation:设置阴影

BgroundDrawable:设置背景

DisplayHomeAsUpEnabled(boolean):设置是否显示返回图标

--设置标题

activity.ActionBar.setTitle('大标题')

activity.ActionBar.setSubTitle("小标题")

--设置ActionBar背景颜色

import "android.graphics.drawable.ColorDrawable"

activity.ActionBar.setBackgroundDrawable(ColorDrawable(Color))

--自定义ActionBar标题颜色

import "android.text.SpannableString"

import "android.text.style.ForegroundColorSpan"

import "android.text.Spannable"

sp = SpannableString("标题")

sp.setSpan(ForegroundColorSpan(0xff1DA6DD),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)

activity.ActionBar.setTitle(sp)

--自定义ActionBar布局

DisplayShowCustomEnabled(true)

CustomView(loadlayout(layout))

--ActionBar返回按钮

activity.ActionBar.setDisplayHomeAsUpEnabled(true)

--自定义返回按钮图标

activity.ActionBar.setHomeAsUpIndicator(drawable)

--菜单

function onCreateOptionsMenu(menu)

menu.add("菜单1")

menu.add("菜单2")

menu.add("菜单3")

end

function onOptionsItemSelected(item)

print("你选择了:"..item.Title)

end

--Tab导航使用

import "android.app.ActionBar$TabListener"

actionBar=activity.ActionBar

actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);

tab = actionBar.newTab().setText("Tab1").setTabListener(TabListener({

onTabSelected=function()

print"Tab1"

end}))

tab2=actionBar.newTab().setText("Tab2").setTabListener(TabListener({

onTabSelected=function()

print"Tab2"

end}))

actionBar.addTab(tab)

actionBar.addTab(tab2)
 ```


## 五大布局
 ```lua

--Android中常用的5大布局方式有以下几种：

--线性布局（LinearLayout）：按照垂直或者水平方向布局的组件。

--帧布局（FrameLayout）：组件从屏幕左上方布局组件。

--表格布局（TableLayout）：按照行列方式布局组件。

--相对布局（RelativeLayout）：相对其它组件的布局方式。

--绝对布局（AbsoluteLayout）：按照绝对坐标来布局组件。

1.线性布局(LinearLayout)

线性布局是Android开发中最常见的一种布局方式，它是按照垂直或者水平方向来布局，通过orientation属性可以设置线性布局的方向。属性值有垂直（vertical）和水平（horizontal）两种。

常用的属性：

orientation：可以设置布局的方向

gravity:用来控制组件的对齐方式

layout_weight控制各个控件在布局中的相对大小,layout_weight的属性是一个非负整数值。

线性布局会根据该控件layout_weight值与其所处布局中所有控件layout_weight值之和的比值为该控件分配占用的区域

--[[例如，在水平布局的LinearLayout中有两个Button，这两个Button的layout_weight属性值都为1,那么这两个按钮都会被拉伸到整个屏幕宽度的一半。如果layout_weight指为0，控件会按原大小显示，不会被拉伸.

对于其余layout_weight属性值大于0的控件，系统将会减去layout_weight属性值为0的控件的宽度或者高度,再用剩余的宽度或高度按相应的比例来分配每一个控件显示的宽度或高度]]

2.帧布局(FrameLayout)

帧布局是从屏幕的左上角（0,0）坐标开始布局，多个组件层叠排列，第一个添加的组件放到最底层，最后添加到框架中的视图显示在最上面。上一层的会覆盖下一层的控件。

3.表格布局（TableLayout）

表格布局是一个ViewGroup以表格显示它的子视图（view）元素，即行和列标识一个视图的位置。

表格布局常用的属性如下：

collapseColumns：隐藏指定的列

shrinkColumns：收缩指定的列以适合屏幕，不会挤出屏幕

stretchColumns：尽量把指定的列填充空白部分

layout_column:控件放在指定的列

layout_span:该控件所跨越的列数

4.相对布局（RelativeLayout）

相对布局是按照组件之间的相对位置来布局，比如在某个组件的左边，右边，上面和下面等。

5.绝对布局(AbsoluteLayout)

采用坐标轴的方式定位组件，左上角是（0，0）点，往右x轴递增，往下Y轴递增,组件定位属性为layout_x 和layout_y来确定坐标。
 ```

## Widget(普通控件)
 ```lua

--Button(按钮控件)、TextView(文本控件)、EditText(编辑框控件)

常用API:

id.setText("文本")--设置控件文本

id.getText()--获取控件文本

id.setWidth(300)--设置控件宽度

id.setHeight(300)--设置控件高度

--点击事件

id.onClick=function()

print"你触发了点击事件"

end

--长按事件

id.onLongClick=function()

print"你触发了长按事件"

end

--图片控件(ImageView与ImageButton)

--设置图片

--布局表中用src属性就可以，如:src=图片路径,

--动态设置

id.setImageBitmap(loadbitmap(图片路径))

--设置Drawable对象

import "android.graphics.drawable.BitmapDrawable"

id.setImageDrawable(BitmapDrawable(loadbitmap(图片路径)))

--缩放，scaleType

--字段

CENTER� --按原来size居中显示，长/宽超过View的长/宽，截取图片的居中部分显示�

CENTER_CROP --按比例扩大图片的size居中显示，使图片长(宽)等于或大于View的长(宽)�

CENTER_INSIDE --完整居中显示，按比例缩小使图片长/宽等于或小于View的长/宽�

FIT_CENTER --按比例扩大/缩小到View的宽度，居中显示�

FIT_END --按比例扩大/缩小到View的宽度，显示在View的下部分位置�

FIT_START --按比例扩大/缩小到View的宽度，显示在View的上部分位置�

FIT_XY --不按比例扩大/缩小到View的大小显示�

MATRIX --用矩阵来绘制，动态缩小放大图片来显示。�

--点击与长按事件同上
 ```

## Check View(检查控件)
 ```lua

--CheckBox(复选框),Switch(开关控件),ToggleButton(切换按钮)

--直接判断是否选中然后执行相应事件即可

--判断API

check.isChecked()--返回是否勾选、布尔值

check.isSelected()--返回是否选中、布尔值

--RadioButton(单选按钮)与RadioGroup

--将RadioButton的父布局设定为RadioGroup然后绑定下面的监听即可

rp.setOnCheckedChangeListener{

onCheckedChanged=function(g,c)

l=g.findViewById(c)

print(l.Text)

end}
 ```

## SeekBar(拖动条)
 ```lua

--绑定监听

seekbar.setOnSeekBarChangeListener{

onStartTrackingTouch=function()

--开始拖动

end,

onStopTrackingTouch=function()

--停止拖动

end,

onProgressChanged=function()

--状态改变

end}

--部分API

Progress--当前进度

Max--最大进度
 ```

## ProgressBar(进度条)
 ```lua

--超大号圆形风格

style="?android:attr/progressBarStyleLarge"

--小号风格

style="?android:attr/progressBarStyleSmall"

--标题型风格

style="?android:attr/progressBarStyleSmallTitle"

--长形进度条

style="?android:attr/progressBarStyleHorizontal"

--部分API

max --最大进度值

progress --设置进度值

secondaryProgress="70" --初始化的底层第二个进度值

id.incrementProgressBy(5)

--ProgressBar进度值增加5

id.incrementProgressBy(-5)

--ProgressBar进度值减少5

id.incrementSecondaryProgressBy(5)

--ProgressBar背后的第二个进度条 进度值增加5

id.incrementSecondaryProgressBy(-5)

--ProgressBar背后的第二个进度条 进度值减少5
 ```

## Adapter View(适配器控件)
 ```lua

--适配器控件主要包括(ListView,GridView,Spinner,ExpandableList等)

--想要动态为此类控件添加项目就必须得要依靠适配器！

--适配器使用

--AarrayAdapter(简单适配器)

--创建项目数组

数据={}

--添加项目数组

for i=1,100 do

table.insert(数据,tostring(i))

end

--创建适配器

array_adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1,String(数据))

--设置适配器

lv.setAdapter(array_adp)

--LuaAdapter(Lua适配器)

--创建自定义项目视图

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

--创建项目数组

data={}

--创建适配器

adp=LuaAdapter(activity,data,item)

--添加数据

for n=1,100 do

table.insert(data,{

text={

Text=tostring(n),

},

})

end

--设置适配器

lv.Adapter=adp

--以上的适配器ListView、Spinner与GridView等控件通用

--那么ExpandableListView(折叠列表)怎么办呢？

--别怕，安卓系统还提供了一个ArrayExpandableListAdapter来给我们使用，可以简单的适配ExpandableListView，下面给出实例

ns={

"Widget","Check view","Adapter view","Advanced Widget","Layout","Advanced Layout",

}

wds={

{"Button","EditText","TextView",

"ImageButton","ImageView"},

{"CheckBox","RadioButton","ToggleButton","Switch"},

{"ListView","ExpandableListView","Spinner"},

{"SeekBar","ProgressBar","RatingBar",

"DatePicker","TimePicker","NumberPicker"},

{"LinearLayout","AbsoluteLayout","FrameLayout"},

{"RadioGroup","GridLayout",

"ScrollView","HorizontalScrollView"},

}

mAdapter=ArrayExpandableListAdapter(activity)

for k,v in ipairs(ns) do

mAdapter.add(v,wds[k])

end

el.setAdapter(mAdapter)

--这样就实现ExpandableListView项目的适配了

--当然AdapterView的事件响应也是与普通控件不同的。

--ListView与GridView的单击与长按事件

--项目被单击

id.onItemClick=function(l,v,p,i)

print(v.Text)

return true

end

--项目被长按

id.onItemLongClick=function(l,v,p,i)

print(v.Text)

return true

end

--Spinner的项目单击事件

id.onItemSelected=function(l,v,p,i)

print(v.Text)

end

--ExpandableListView的父项目与子项目单击事件

id.onGroupClick=function(l,v,p,s)

print(v.Text..":GroupClick")

end

id.onChildClick=function(l,v,g,c)

print(v.Text..":ChildClick")

end
 ```

## LuaWebView(浏览器控件)
 ```lua

--常用API

id.loadUrl("http://www.androlua.cn")--加载网页

id.loadUrl("file:///storage/sdcard0/index.html")--加载本地文件

id.getTitle()--获取网页标题

id.getUrl()--获取当前Url

id.requestFocusFromTouch()--设置支持获取手势焦点

id.getSettings().setJavaScriptEnabled(true)--设置支持JS

id.setPluginsEnabled(true)--支持插件

id.setUseWideViewPort(false)--调整图片自适应

id.getSettings().setSupportZoom(true)--支持缩放

id.getSettings().setLayoutAlgorithm(LayoutAlgorithm.SINGLE_COLUMN)--支持重新布局

id.supportMultipleWindows()--设置多窗口

id.stopLoading()--停止加载网页

--状态监听

id.setWebViewClient{

shouldOverrideUrlLoading=function(view,url)

--Url即将跳转

end,

onPageStarted=function(view,url,favicon)

--网页加载

end,

onPageFinished=function(view,url)

--网页加载完成

end}
 ```

## AutoCompleteTextView(自动补全文本框)
 ```lua

--适配数据

arr={"Rain","Rain1","Rain2"};

arrayAdapter=LuaArrayAdapter(activity,{TextView,padding="10dp",textSize="18sp",layout_width="fill",textColor="#ff000000"}, String(arr))

actw.setAdapter(arrayAdapter)

Threshold=1--设置输入几个字符后才能出现提示
 ```

## TimePicker(时间选择器)
 ```lua

--时间改变监听器

import "android.widget.TimePicker$OnTimeChangedListener"

id.setOnTimeChangedListener{

onTimeChanged=function(view,时,分)

print(时,分)

end}

--部分API

时=id.getCurrentHour()--获取小时

分=id.getCurrentMinute()--获取分钟

id.setIs24HourView(Boolean(true))--设置24小时制
 ```

## DatePicker(日期选择器)
 ```lua

id=dp

日=id.getDayOfMonth()--获取选择的天数

月=id.getMonth ()--获取选择的月份

年=id.getYear()--获取选择的年份

id.updateDate(2016,1,1)--更新日期

print(年,月,日)
 ```

## NemberPicker(数值选择器)
 ```lua

setMinValue(0)--设置最小值

setMaxValue(100)--设置最大值

setValue(50)--设置当前值

getValue()--获取选择的值

OnValueChangedListener--数值改变监听器
 ```

## AlertDialog(对话框)
 ```lua

--常用API

.setTitle("标题")--设置标题

.setMessage("设置消息")--设置消息

.setView(loadlayout(layout))--设置自定义视图

.setPositiveButton("积极",{onClick=function() end})--设置积极按钮

.setNeutralButton("中立",nil)--设置中立按钮

.setNegativeButton("否认",nil)--设置否认按钮

--普通对话框

AlertDialog.Builder(this)

.setTitle("标题")

.setMessage("消息")

.setPositiveButton("积极",{onClick=function(v) print"点击了积极按钮"end})

.setNeutralButton("中立",nil)

.setNegativeButton("否认",nil)

.show()

--输入对话框

InputLayout={

LinearLayout;

orientation="vertical";

Focusable=true,

FocusableInTouchMode=true,

{

TextView;

id="Prompt",

textSize="15sp",

layout_marginTop="10dp";

layout_marginLeft="3dp",

layout_width="80%w";

layout_gravity="center",

text="输入:";

};

{

EditText;

hint="输入";

layout_marginTop="5dp";

layout_width="80%w";

layout_gravity="center",

id="edit";

};

};

AlertDialog.Builder(this)

.setTitle("标题")

.setView(loadlayout(InputLayout))

.setPositiveButton("确定",{onClick=function(v) print(edit.Text)end})

.setNegativeButton("取消",nil)

.show()

import "android.view.View$OnFocusChangeListener"

edit.setOnFocusChangeListener(OnFocusChangeListener{

onFocusChange=function(v,hasFocus)

if hasFocus then

Prompt.setTextColor(0xFD009688)

end

end})

--下载文件对话框

Download_layout={

LinearLayout;

orientation="vertical";

id="Download_father_layout",

{

TextView;

id="linkhint",

layout_marginTop="10dp";

text="下载链接",

layout_width="80%w";

textColor=WidgetColors,

layout_gravity="center";

};

{

EditText;

id="linkedit",

layout_width="80%w";

layout_gravity="center";

};

{

TextView;

id="pathhint",

text="下载路径",

layout_width="80%w";

textColor=WidgetColors,

layout_marginTop="10dp";

layout_gravity="center";

};

{

EditText;

id="pathedit",

layout_width="80%w";

layout_gravity="center";

};

};

AlertDialog.Builder(this)

.setTitle("下载文件")

.setView(loadlayout(Download_layout))

.setPositiveButton("下载",{onClick=function(v)

end})

.setNegativeButton("取消",nil)

.show()

--列表对话框

items={}

for i=1,5 do

table.insert(items,"项目"..tostring(i))

end

AlertDialog.Builder(this)

.setTitle("列表对话框")

.setItems(items,{onClick=function(l,v) print(items[v+1])end})

.show()

--单选对话框

单选列表={}

for i=1,5 do

table.insert(单选列表,"单选项目"..tostring(i))

end

local 单选对话框=AlertDialog.Builder(this)

.setTitle("列表对话框")

.setSingleChoiceItems(单选列表,-1,{onClick=function(v,p)print(单选列表[p+1])end})

单选对话框.show();

--多选对话框

items={}

for i=1,5 do

table.insert(items,"多选项目"..tostring(i))

end

多选对话框=AlertDialog.Builder(this)

.setTitle("多选框")

.setMultiChoiceItems(items, nil,{ onClick=function(v,p)print(items[p+1])end})

多选对话框.show();
 ```

## ProgressDialog(进度对话框)
 ```lua

--ProgressDialog__进度条对话框

dialog = ProgressDialog.show(this, "提示", "正在登陆中").hide()

--最简单便捷的方式

dialog2 = ProgressDialog.show(this, "提示", "正在登陆中", false).hide()

--最后一个boolean设置是否是不明确的状态

dialog3 = ProgressDialog.show(this, "提示", "正在登陆中",false, true).hide()

--最后一个boolean设置可以不可以点击取消

dialog4 = ProgressDialog.show(this, "提示", "正在登陆中",false, true, DialogInterface.OnCancelListener{

onCancel=function()

print("对话框取消")

end

}).hide()

--最后一个参数监听对话框取消，并执行事件

--圆形旋转样式

dialog5= ProgressDialog(this)

dialog5.setProgressStyle(ProgressDialog.STYLE_SPINNER)

dialog5.setTitle("Loading...")

--设置进度条的形式为圆形转动的进度条

dialog5.setMessage("ProgressDialog")

dialog5.setCancelable(true)--设置是否可以通过点击Back键取消

dialog5.setCanceledOnTouchOutside(false)--设置在点击Dialog外是否取消Dialog进度条

dialog5.setOnCancelListener{

onCancel=function(l)

print("取消Dialog5")

end}

--取消对话框监听事件

dialog5.show().hide()

--水平样式

dialog6= ProgressDialog(this)

dialog6.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);

--设置进度条的形式为水平进度条

dialog6.setTitle("ProgressDialog_HORIZONTAL")

dialog6.setCancelable(true)--设置是否可以通过点击Back键取消

dialog6.setCanceledOnTouchOutside(false)--设置在点击Dialog外是否取消Dialog进度条

dialog6.setOnCancelListener{

onCancel=function(l)

print("取消Dialog6")

end}

--取消对话框监听事件

dialog6.setMax(100)

--设置最大进度值

dialog6.show().hide()

function 增加(i)

dialog6.incrementProgressBy(10)

dialog6.incrementSecondaryProgressBy(10)

if i=="10" then

dialog6.dismiss()

print("加载完成")

end

--当进度走完时销毁对话框

end

function 加载()

require "import"

for i=1,10 do

Thread.sleep(300)

call("增加",tostring(i))

end

end

--thread(加载)
 ```

## InputMethodManager(输入法管理器)
 ```lua

在Android的开发中，有时候会遇到软键盘弹出时挡住输入框的情况。

这时候可以设置下软键盘的模式就可以了。

activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE|WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN)

有时候需要软键盘不要把我们的布局整体推上去，这时候可以这样：

activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN)

模式常量：

软输入区域是否可见。

SOFT_INPUT_MASK_STATE = 0x0f

未指定状态。

SOFT_INPUT_STATE_UNSPECIFIED = 0

不要修改软输入法区域的状态

SOFT_INPUT_STATE_UNCHANGED = 1

隐藏输入法区域（当用户进入窗口时

SOFT_INPUT_STATE_HIDDEN = 2

当窗口获得焦点时，隐藏输入法区域

SOFT_INPUT_STATE_ALWAYS_HIDDEN = 3

显示输入法区域（当用户进入窗口时）

SOFT_INPUT_STATE_VISIBLE = 4

当窗口获得焦点时，显示输入法区域

SOFT_INPUT_STATE_ALWAYS_VISIBLE = 5

窗口应当主动调整，以适应软输入窗口。

SOFT_INPUT_MASK_ADJUST = 0

窗口应当主动调整，以适应软输入窗口。

SOFT_INPUT_MASK_ADJUST = 0xf0

未指定状态，系统将根据窗口内容尝试选择一个输入法样式。

SOFT_INPUT_ADJUST_UNSPECIFIED = 0x00

当输入法显示时，允许窗口重新计算尺寸，使内容不被输入法所覆盖。

不可与SOFT_INPUT_ADJUSP_PAN混合使用；如果两个都没有设置，系统将根据窗口内容自动设置一个选项。

SOFT_INPUT_ADJUST_RESIZE = 0x10

输入法显示时平移窗口。它不需要处理尺寸变化，框架能够移动窗口以确保输入焦点可见。

不可与SOFT_INPUT_ADJUST_RESIZE混合使用；如果两个都没有设置，系统将根据窗口内容自动设置一个选项。

SOFT_INPUT_ADJUST_PAN = 0x20

当用户转至此窗口时，由系统自动设置，所以你不要设置它。

当窗口显示之后该标志自动清除。

SOFT_INPUT_IS_FORWARD_NAVIGATION = 0x100

其它Api参考:

import "android.view.inputmethod.InputMethodManager"

调用显示系统默认的输入法

imm = activity.getSystemService(Context.INPUT_METHOD_SERVICE)

imm.showSoftInput(m_receiverView(接受软键盘输入的视图(View)),InputMethodManager.SHOW_FORCED(提供当前操作的标记，SHOW_FORCED表示强制显示))

如果输入法关闭则打开，如果输入法打开则关闭

imm = activity.getSystemService(Context.INPUT_METHOD_SERVICE)

imm.toggleSoftInput(0,InputMethodManager.HIDE_NOT_ALWAYS)

获取软键盘是否打开

imm = activity.getSystemService(Context.INPUT_METHOD_SERVICE)

isOpen=imm.isActive()

--返回一个布尔值

隐藏软键盘

activity.getSystemService(INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(WidgetSearchActivity.this.getCurrentFocus().getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS)

显示软键盘

activity.getSystemService(INPUT_METHOD_SERVICE)).showSoftInput(控件ID, 0)
 ```

## PopMenu(弹出式菜单)
 ```lua

pop=PopupMenu(activity,view)

menu=pop.Menu

menu.add("项目1").onMenuItemClick=function(a)

end

menu.add("项目2").onMenuItemClick=function(a)

end

pop.show()--显示
 ```

## PopWindow(弹出式窗口)
 ```lua

pop=PopWindow(activity)--创建PopWindow

pop.setContentView(loadlayout(布局))--设置布局

pop.setWidth(activity.Width*0.3)--设置宽度

pop.setHeight(activity.Width*0.3)--设置高度

pop.setFocusable(true)--设置可获得焦点

window.setTouchable(true)--设置可触摸

--设置点击外部区域是否可以消失

pop.setOutsideTouchable(false)

--显示

pop.showAtLocation(view,0,0,0)
 ```

## Toast(提示)
 ```lua

--默认Toast

Toast.makeText(activity, "Toast",Toast.LENGTH_SHORT).show()

--自定义位置Toast

Toast.makeText(activity,"自定义位置Toast", Toast.LENGTH_LONG).setGravity(Gravity.CENTER, 0, 0).show()

--带图片Toast

图片=loadbitmap("/sdcard/a.png")

toast = Toast.makeText(activity,"带图片的Toast", Toast.LENGTH_LONG)

toastView = toast.getView()

imageCodeProject = ImageView(activity)

imageCodeProject.setImageBitmap(图片)

toastView.addView(imageCodeProject, 0)

toast.show()

--自定义布局Toast

布局=loadlayout(layout)

local toast=Toast.makeText(activity,"提示",Toast.LENGTH_SHORT).setView(布局).show()
 ```

## 控件常用属性
 ```lua

--EditText(输入框)

singleLine=true--设置单行输入

Error="错误的输入"--设置用户输入了错误的信息时的提醒

MaxLines=5--设置最大输入行数

MaxEms=5--设置每行最大宽度为五个字符的宽度

InputType="number"--设置只可输入数字

Hint="请输入"--设置编辑框为空时的提示文字

--ImageView(图片视图)

src="a.png"--设置控件图片资源

scaleType="fitXY"--设置图片缩放显示

ColorFilter=Color.BLUE--设置图片着色

--ListView(列表视图)

Items={"item1","item2","item3"}--设置列表项目,但只能在布局表设置,动态添加项目请看Adapter View详解。

DividerHeight=0--设置无隔断线

fastScrollEnabled=true--设置是否显示快速滑块

layout_marginBottom--离某元素底边缘的距离

layout_marginLeft--离某元素左边缘的距离

layout_marginRight--离某元素右边缘的距离

layout_marginTop--离某元素上边缘的距离

gravity--属性是对该view 内容的限定．比如一个button 上面的text. 你可以设置该text 在view的靠左，靠右等位置．以button为例，gravity="right"则button上面的文字靠右

layout_gravity--是用来设置该view相对与起父view 的位置．比如一个button 在linearlayout里，你想把该button放在靠左、靠右等位置就可以通过该属性设置．以button为例，layout_gravity="right"则button靠右

scaleType

--[[是控制图片如何resized/moved来匹对ImageView的size。ImageView.ScaleType / scaleType值的意义区别：

CENTER /center 按图片的原来size居中显示，当图片长/宽超过View的长/宽，则截取图片的居中部分显示

CENTER_CROP / centerCrop 按比例扩大图片的size居中显示，使得图片长(宽)等于或大于View的长(宽)

CENTER_INSIDE / centerInside 将图片的内容完整居中显示，通过按比例缩小或原来的size使得图片长/宽等于或小于View的长/宽

FIT_CENTER / fitCenter 把图片按比例扩大/缩小到View的宽度，居中显示

FIT_END / fitEnd 把图片按比例扩大/缩小到View的宽度，显示在View的下部分位置

FIT_START / fitStart 把图片按比例扩大/缩小到View的宽度，显示在View的上部分位置

FIT_XY / fitXY 把图片不按比例扩大/缩小到View的大小显示

MATRIX / matrix 用矩阵来绘制，动态缩小放大图片来显示。

]]

id--为控件指定相应的ID

text--指定控件当中显示的文字

textSize--指定控件当中字体的大小

background--指定该控件所使用的背景色

width--指定控件的宽度

height--指定控件的高度

layout_width--指定Container组件的宽度

layout_height--指定Container组件的高度

layout_weight--View中很重要的属性，按比例划分空间

padding--指定控件的内边距，也就是说控件当中的内容

sigleLine--如果设置为真的话，则控件的内容在同一行中进行显示
 ```



## 关于侧滑
 ```lua

--侧滑布局是 DrawerLayout;

--关闭侧滑

ID.closeDrawer(3)

--打开侧滑

ID.openDrawer(3)
 ```



## 关于输入法影响布局的问题
 ```lua

--使弹出的输入法不影响布局

activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN);

--使弹出的输入法影响布局

activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
 ```








## 布局效果实现
------------
## TextView设置字体样式
 ```lua

--首先要导入包

import "android.graphics.*"

--设置中划线

控件id.getPaint().setFlags(Paint. STRIKE_THRU_TEXT_FLAG)

--下划线

控件id.getPaint().setFlags(Paint. UNDERLINE_TEXT_FLAG )

--加粗

控件id.getPaint().setFakeBoldText(true)

--斜体

控件id.getPaint().setTextSkewX(0.2)

--设置TypeFace

import "android.graphics.Typeface"

id.getPaint().setTypeface(字体)

--字体可以为以下

Typeface.DEFAULT --默认字体

Typeface.DEFAULT_BOLD --加粗字体

Typeface.MONOSPACE --monospace字体

Typeface.SANS_SERIF --sans字体

Typeface.SERIF --serif字体
 ```


## 布局设置点击效果
 ```lua

--5.0或以上可以实现点击水波纹效果

--在布局加入：

style="?android:attr/buttonBarButtonStyle";
 ```

## 图片着色
 ```lua

--代码中设置

ID.setColorFilter(0xffff0000)

--布局表中设置

ColorFilter="#ffff0000"；
 ```

## 沉浸状态栏
 ```lua

--这个需要系统SDK21以上才能用

if Build.VERSION.SDK_INT >= 21 then

activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);

end

--这个需要系统SDK19以上才能用

if Build.VERSION.SDK_INT >= 19 then

activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);

end
 ```



## Drawable着色
 ```lua

function ToColor(path,color)

local aa=BitmapDrawable(loadbitmap(tostring(path)))

aa.setColorFilter(PorterDuffColorFilter(color,PorterDuff.Mode.SRC_ATOP))

return aa

end
 ```


## 设置TextView字体风格
 ```lua

import "android.graphics.Paint"

--设置中划线

id.getPaint().setFlags(Paint. STRIKE_THRU_TEXT_FLAG)

--设置下划线

id.getPaint().setFlags(Paint. UNDERLINE_TEXT_FLAG )

--设置加粗

id.getPaint().setFakeBoldText(true)

--设置斜体

id.getPaint().setTextSkewX(0.2)

--设置TypeFace

import "android.graphics.Typeface"

id.getPaint().setTypeface()

--参数列表

Typeface.DEFAULT 默认字体

Typeface.DEFAULT_BOLD 加粗字体

Typeface.MONOSPACE monospace字体

Typeface.SANS_SERIF sans字体

Typeface.SERIF serif字体
 ```

## 修改对话框按钮颜色
 ```lua

function DialogButtonFilter(dialog,button,WidgetColor)

if Build.VERSION.SDK_INT >= 21 then

import "android.graphics.PorterDuffColorFilter"

import "android.graphics.PorterDuff"

if button==1 then

dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(WidgetColor)

elseif button==2 then

dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(WidgetColor)

elseif button==3 then

dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(WidgetColor)

end

end

end

--第一个参数为对话框的变量

--第二个参数为1时，则修改POSITIVE按钮颜色,为二则修改NEGATIVE按钮颜色,为三则修改NEUTRAL按钮颜色

--第三个参数为要修改成的颜色
 ```





## 控件颜色修改
 ```lua

import "android.graphics.PorterDuffColorFilter"

import "android.graphics.PorterDuff"

--修改按钮颜色

button.getBackground().setColorFilter(PorterDuffColorFilter(0xFFFB7299,PorterDuff.Mode.SRC_ATOP))

--修改编辑框颜色

edittext.getBackground().setColorFilter(PorterDuffColorFilter(0xFFFB7299,PorterDuff.Mode.SRC_ATOP));

--修改Switch颜色

switch.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFFFB7299,PorterDuff.Mode.SRC_ATOP));

switch.TrackDrawable.setColorFilter(PorterDuffColorFilter(0xFFFB7299,PorterDuff.Mode.SRC_ATOP))

--修改ProgressBar颜色

progressbar.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(0xFFFB7299,PorterDuff.Mode.SRC_ATOP))

--修改SeekBar滑条颜色

seekbar.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFFFB7299,PorterDuff.Mode.SRC_ATOP))

--修改SeekBar滑块颜色

seekbar.Thumb.setColorFilter(PorterDuffColorFilter(0xFFFB7299,PorterDuff.Mode.SRC_ATOP))
 ```


## 控件圆角
 ```lua

function CircleButton(view,InsideColor,radiu)

import "android.graphics.drawable.GradientDrawable"

drawable = GradientDrawable()

drawable.setShape(GradientDrawable.RECTANGLE)

drawable.setColor(InsideColor)

drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});

view.setBackgroundDrawable(drawable)

end

角度=50

控件id=ed

控件颜色=0xFF09639C

CircleButton(控件id,控件颜色,角度)
 ```






## 控件背景渐变动画
 ```lua

view=控件id

color1 = 0xffFF8080;

color2 = 0xff8080FF;

color3 = 0xff80ffff;

color4 = 0xff80ff80;

import "android.animation.ObjectAnimator"

import "android.animation.ArgbEvaluator"

import "android.animation.ValueAnimator"

import "android.graphics.Color"

colorAnim = ObjectAnimator.ofInt(view,"backgroundColor",{color1, color2, color3,color4})

colorAnim.setDuration(3000)

colorAnim.setEvaluator(ArgbEvaluator())

colorAnim.setRepeatCount(ValueAnimator.INFINITE)

colorAnim.setRepeatMode(ValueAnimator.REVERSE)

colorAnim.start()
 ```


### dp、px、sp之间的转换
```lua

function dp2px(dpValue)

local scale = activity.getResources().getDisplayMetrics().scaledDensity

return dpValue * scale + 0.5

end

function px2dp(pxValue)

local scale = activity.getResources().getDisplayMetrics().scaledDensity

return pxValue / scale + 0.5

end

function px2sp(pxValue)

local scale = activity.getResources().getDisplayMetrics().scaledDensity;

return pxValue / scale + 0.5

end

function sp2px(spValue)

local scale = activity.getResources().getDisplayMetrics().scaledDensity

return spValue * scale + 0.5

end

--调用例子

print(dp2px(64))

```


### 设置activity背景颜色

```lua

function activity背景颜色(color)

_window = activity.getWindow();

_window.setBackgroundDrawable(ColorDrawable(color));

_wlp = _window.getAttributes();

_wlp.gravity = Gravity.BOTTOM;

_wlp.width = WindowManager.LayoutParams.MATCH_PARENT;

_wlp.height = WindowManager.LayoutParams.MATCH_PARENT;--WRAP_CONTENT

_window.setAttributes(_wlp);

end

--该函数需设置布局后使用

--调用例子

activity.setContentView(LinearLayout(activity))

activity背景颜色(0xff424242)
```

### 控件点击波纹背景
```lua
import "android.content.res.ColorStateList"

function 波纹(id,lx,color)

xpcall(function()

ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)

ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)

for index,content in ipairs(id) do

if lx=="圆" then

content.setBackgroundDrawable(activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color})))

end

if lx=="方" then

content.setBackgroundDrawable(activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{color})))

end

end

end,function(e)end)

end

--[[

波纹(id,lx,color)

id：控件id,table

lx：波纹类型,圆或方,string

color 波纹颜色,number

安卓5及以上可用。

该代码需要MD主题。

]]

--调用例子

layout={

LinearLayout;

onClick=function()print("MLua手册")end;

layout_width="-1";

layout_height="-1";

id="lay";

}

activity.setContentView(loadlayout(layout))

activity.setTheme(android.R.style.Theme_DeviceDefault_Light)

波纹({lay},"圆",0x21000000)

```

### MLua手册底栏贝塞尔曲线

{{< expand "代码详情" "..." >}}

```lua

import "com.androlua.LuaDrawable"

import "android.graphics.Path"

import "android.graphics.Paint"

function dp2px(dpValue)

local scale = activity.getResources().getDisplayMetrics().scaledDensity

return dpValue * scale + 0.5

end

function px2dp(pxValue)

local scale = activity.getResources().getDisplayMetrics().scaledDensity

return pxValue / scale + 0.5

end

function px2sp(pxValue)

local scale = activity.getResources().getDisplayMetrics().scaledDensity;

return pxValue / scale + 0.5

end

function sp2px(spValue)

local scale = activity.getResources().getDisplayMetrics().scaledDensity

return spValue * scale + 0.5

end

layout={

RelativeLayout;

layout_width="-1";

background=backgroundc;

layout_height="-1";

{

RelativeLayout,

layout_width="-1",

layout_height="-1",

id="llb",

gravity="bottom";

{

RelativeLayout,

layout_width="fill",

layout_height="56dp",

clickable="true",

id="ll",

{

LinearLayout;

layout_width="-1";

layout_height="-1";

gravity="left|center";

paddingLeft="8dp";

paddingRight="8dp";

{

LinearLayout;

layout_height="-1";

layout_width="-2";

layout_weight="1";

};

{

TextView;

layout_height="-1";

layout_width="56dp";

layout_marginRight="20dp";

layout_marginLeft="8dp";

--background=grayc;

};

};

};

},

{

LinearLayout;

layout_width="-1";

layout_height="-1";

orientation="vertical";

gravity="right|bottom";

{

CardView;

layout_width="56dp",

layout_height="56dp",

radius="28dp";

layout_margin="28dp";

CardBackgroundColor="0xffffffff";

elevation="6dp";

alpha=1;

};

};

}

activity.setContentView(loadlayout(layout))

myLuaDrawable=LuaDrawable(function(mCanvas,mPaint,mDrawable)

mPaint.setColor(0xffffffff)

mPaint.setAntiAlias(true)

mPaint.setStrokeWidth(20)

mPaint.setStyle(Paint.Style.FILL)

mPaint.setStrokeCap(Paint.Cap.ROUND)

w=mDrawable.getBounds().right

h=mDrawable.getBounds().bottom

mPath=Path()

mPath.moveTo(w, h);

mPath.lineTo(0, h);

mPath.lineTo(0, h-dp2px(56));

mPath.lineTo(w-dp2px(56+16+16+8), h-dp2px(56));

mPath.rQuadTo(dp2px(8), dp2px(0),dp2px(8+1), dp2px(8))

mPath.rCubicTo(dp2px(8-1), dp2px(28+4),dp2px(56-1), dp2px(28+4),dp2px(56+8-2), dp2px(0))

mPath.rQuadTo(dp2px(1), dp2px(-8),dp2px(8+1), dp2px(-8))

mPath.rLineTo(w, 0);

mCanvas.drawColor(0x00000000)

mCanvas.drawPath(mPath, mPaint);

mPath.close();

end)

ll.background=myLuaDrawable

myLuaDrawable=LuaDrawable(function(mCanvas,mPaint,mDrawable)

mPaint.setColor(0x21000000)

mPaint.setAntiAlias(true)

mPaint.setStrokeWidth(dp2px(4))

mPaint.setStyle(Paint.Style.FILL)

mPaint.setStrokeCap(Paint.Cap.ROUND)

w=mDrawable.getBounds().right

h=mDrawable.getBounds().bottom

mPath=Path()

mPath.moveTo(w, h);

mPath.lineTo(0, h);

mPath.lineTo(0, h-dp2px(56));

mPath.lineTo(w-dp2px(56+16+16+8), h-dp2px(56));

mPath.rQuadTo(dp2px(8), dp2px(0),dp2px(8+1), dp2px(8))

mPath.rCubicTo(dp2px(8-1), dp2px(28+4),dp2px(56-1), dp2px(28+4),dp2px(56+8-2), dp2px(0))

mPath.rQuadTo(dp2px(1), dp2px(-8),dp2px(8+1), dp2px(-8))

mPath.rLineTo(w, 0);

mCanvas.drawColor(0x00000000)

mPaint.setShadowLayer(dp2px(1), 0, dp2px(-1), 0x70FFFFFF);

mCanvas.drawPath(mPath, mPaint);

mPath.close();

end)

llb.background=myLuaDrawable
```

{{< /expand >}}



### 带颜色的字体

```lua

import "android.text.SpannableString"

import "android.text.style.ForegroundColorSpan"

import "android.text.Spannable"

function 颜色字体(t,c)

local sp = SpannableString(t)

sp.setSpan(ForegroundColorSpan(c),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)

return sp

end

--调用示例

activity.setTitle(颜色字体("MLua手册 qwq",0xff2196f3))--设置标题为0xff2196f3颜色的 MLua手册 qwq

```


### 适配异形屏的全屏

```lua
function 全屏()

window = activity.getWindow();

window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN|View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);

window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)

xpcall(function()

lp = window.getAttributes();

lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;

window.setAttributes(lp);

end,

function(e)

end)

end

--使用该代码可能需要隐藏ActionBar

--调用示例

全屏()

```


## 图片处理

------------------


### 高斯模糊

```lua
import "android.renderscript.Element"

import "android.renderscript.Allocation"

import "android.renderscript.RenderScript"

import "android.graphics.Bitmap"

import "android.renderscript.ScriptIntrinsicBlur"

import "android.graphics.Matrix"

function 高斯模糊(id,tp,radius1,radius2)

function blur( context, bitmap, blurRadius)

renderScript = RenderScript.create(context);

blurScript = ScriptIntrinsicBlur.create(renderScript, Element.U8_4(renderScript));

inAllocation = Allocation.createFromBitmap(renderScript, bitmap);

outputBitmap = bitmap;

outAllocation = Allocation.createTyped(renderScript, inAllocation.getType());

blurScript.setRadius(blurRadius);

blurScript.setInput(inAllocation);

blurScript.forEach(outAllocation);

outAllocation.copyTo(outputBitmap);

inAllocation.destroy();

outAllocation.destroy();

renderScript.destroy();

blurScript.destroy();

return outputBitmap;

end

function zoomBitmap(bitmap,scale)

w = bitmap.getWidth();

h = bitmap.getHeight();

matrix = Matrix();

matrix.postScale(scale, scale);

bitmap = Bitmap.createBitmap(bitmap, 0, 0, w, h, matrix, true);

return bitmap;

end

function blurAndZoom(context,bitmap,blurRadius,scale)

return zoomBitmap(blur(context,zoomBitmap(bitmap, 1 / scale), blurRadius), scale);

end

id.setImageBitmap(blurAndZoom(activity,tp,radius1,radius2))

end

--[[

高斯模糊(id,tp,radius1,radius2)

radius1 范围：1-25

radius2 范围：1-？(据图片而定太大报错)

]]

--调用例子

img=ImageView(activity)

activity.setContentView(img)

高斯模糊(img,loadbitmap("https://image.uisdc.com/wp-content/uploads/2019/06/uisdc-banner-20190614-2.jpg"),4,2)

```




### 圆形图片
```lua
function 圆形图片(bitmap)

import "android.graphics.PorterDuffXfermode"

import "android.graphics.Paint"

import "android.graphics.RectF"

import "android.graphics.Bitmap"

import "android.graphics.PorterDuff$Mode"

import "android.graphics.Rect"

import "android.graphics.Canvas"

import "android.util.Config"

width = bitmap.getWidth()

output = Bitmap.createBitmap(width, bitmap.getHeight(),Bitmap.Config.ARGB_8888)

canvas = Canvas(output);

color = 0xff424242;

paint = Paint()

rect = Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());

rectF = RectF(rect);

paint.setAntiAlias(true);

canvas.drawARGB(0, 0, 0, 0);

paint.setColor(color);

canvas.drawRoundRect(rectF, width/2, bitmap.getHeight()/2, paint);

paint.setXfermode(PorterDuffXfermode(Mode.SRC_IN));

canvas.drawBitmap(bitmap, rect, rect, paint);

return output;

end

--调用示例

img=ImageView(activity)

activity.setContentView(img)

img.setImageBitmap(圆形图片(loadbitmap("https://api.yimian.xyz/img/?path=head/img_19_212x210_96_acg-head_normal.png")))
```


### 获取控件图片

```lua
import "android.graphics.Bitmap"

function 获取控件图片(view)
local linearParams = view.getLayoutParams()
local vw=linearParams.width
local linearParams = view.getLayoutParams()
local vh=linearParams.height

view.setDrawingCacheEnabled(true)
view.layout(0,0,vw,vh)
return Bitmap.createBitmap(view.getDrawingCache())
end

--调用示例
layout={
LinearLayout,
layout_width="-1",
layout_height="-1",
orientation="vertical";
{
TextView,
textSize="14sp";
layout_width="56dp",
layout_height="42dp",
text="TextView1",
textColor="#FFFFFFFF";
background="#212121",
id="tv";
},
{
ImageView,
layout_width="-1",
layout_height="-1",
id="img";
},
}

--设置布局
activity.setContentView(loadlayout(layout))
--获取tv的图片设置给img
img.setImageBitmap(获取控件图片(tv))

```

## 图片圆角
 ```lua

function GetRoundedCornerBitmap(bitmap,roundPx)

import "android.graphics.PorterDuffXfermode"

import "android.graphics.Paint"

import "android.graphics.RectF"

import "android.graphics.Bitmap"

import "android.graphics.PorterDuff$Mode"

import "android.graphics.Rect"

import "android.graphics.Canvas"

import "android.util.Config"

width = bitmap.getWidth()

output = Bitmap.createBitmap(width, width,Bitmap.Config.ARGB_8888)

canvas = Canvas(output);

color = 0xff424242;

paint = Paint()

rect = Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());

rectF = RectF(rect);

paint.setAntiAlias(true);

canvas.drawARGB(0, 0, 0, 0);

paint.setColor(color);

canvas.drawRoundRect(rectF, roundPx, roundPx, paint);

paint.setXfermode(PorterDuffXfermode(Mode.SRC_IN));

canvas.drawBitmap(bitmap, rect, rect, paint);

return output;

end

import "android.graphics.drawable.BitmapDrawable"

圆角弧度=50

bitmap=loadbitmap(picturePath)

RoundPic=GetRoundedCornerBitmap(bitmap)
 ```


## 缩放图片
 ```lua

function rotateToFit(bm,degrees)

import "android.graphics.Matrix"

import "android.graphics.Bitmap"

width = bm.getWidth()

height = bm.getHeight()

matrix = Matrix()

matrix.postRotate(degrees)

bmResult = Bitmap.createBitmap(bm, 0, 0, width, height, matrix, true)

return bmResult

end

bm=loadbitmap(图片路径)

缩放级别=2

rotateToFit(bm,degrees)

--非原创
 ```



## 自定义布局对话框
 ```lua

local dl=AlertDialog.Builder(activity)

.setTitle("自定义布局对话框")

.setView(loadlayout(layout))

dl.show()
 ```
