--[[
输入框即可进行输入的组件
常用属性：
hint	默认提示文本
textColorHint	默认提示文本颜色
selectAllOnFocus	设置为true则获得焦点后自动全选文本
minLines	最小行数
maxLines	最大行数
textScaleX	水平间隔
textScaleY	垂直间隔
padding	组件内文字和组件边框的距离
CursorVisible	设置�����lse则光标不显示
getSelectionStart()	获得光标前的位置
getSelectionEnd()	获得光标后的位置
background	设置为#00000000则隐藏下划线

inputType:
限制输入类型，可选值如下
文本类型：
none
text
textCapCharacters
textCapWords
textCapSentences
textAutoCorrect
textAutoComplete
textMultiLine
textImeMultiLine
textNoSuggestions
textUri
textEmailAddress
textEmailSubject
textShortMessage
textLongMessage
textPersonName
textPostalAddress
textPassword
textVisiblePassword
textWebEditText
textFilter
textPhonetic
数值类型：
number
numberSigned
numberDecimal
phone
datetime
date
time
]]

--创建示例布局
shamrock=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background='#ffffff';--布局背景颜色(或者图片路径)
  gravity='center';--设置居中
  {
    EditText;--编辑框控件
    id='编辑';--绑定ID
    singleLine=true;--设置单行输入
    layout_width='80%w';--编辑框宽度
    layout_height='100';--编辑框高度
    textSize='16sp';--文本大小
    textColor='#000000';--输入文本的颜色
    Hint='提示文本';--设置编辑框为空时的提示文本
    HintTextColor='#757575';--设置编辑框内容为空的时候显示的文本颜色
  };
  {
    Button;--按钮控件
    text='获取坐标位置';--显示的文本
    textSize='16sp';--文字大小
    textColor='#000000';--文本颜色
    backgroundColor='#ffffff';--按钮背景颜色
    layout_width='80%w';--按钮宽度
    layout_height='100';--按钮高度
    onClick=function(v)--设置点击事件
      print(编辑.getSelectionStart())
    end
  };
};
activity.setContentView(loadlayout(shamrock))--将布局添加至窗口