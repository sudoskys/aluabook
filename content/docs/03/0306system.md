---
weight: 1
bookFlatSection: true
title: "03-06 系统调用"
---

# 系统

------------------

{{< hint info >}}
**From MLUA**
{{< /hint >}}

## 申请root权限
 ```lua

--shell命令的方法

os.execute("su")
 ```



## 分享文字
 ```lua

import "android.content.*"

text="分享的内容"

intent=Intent(Intent.ACTION_SEND);

intent.setType("text/plain");

intent.putExtra(Intent.EXTRA_SUBJECT, "分享");

intent.putExtra(Intent.EXTRA_TEXT, text);

intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

activity.startActivity(Intent.createChooser(intent,"分享到:"));
 ```



## 设置横屏竖屏
 ```lua

--横屏

activity.setRequestedOrientation(0);

--竖屏

activity.setRequestedOrientation(1);
 ```


## Shell执行
 ```lua

function exec(cmd)

local p=io.popen(string.format('%s',cmd))

local s=p:read("*a")

p:close()

return s

end

print(exec("echo ...."))

部分常用命令:

--删除文件或文件夹

rm -r /路径

--复制文件或文件夹

cp -r inpath outpath

--移动文件或文件夹

mv -r inpath outpath

--挂载系统目录

mount -o remount,rw path

--修改系统文件权限

chmod 755 /system/build.prop

--重启

reboot�

--关机

reboot -p

--重启至recovery

reboot recovery
 ```


## 震动
 ```lua

import "android.content.Context"

--导入包

vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)

vibrator.vibrate( long{100,800} ,-1)

--{等待时间,振动时间,等待时间,振动时间,…}

--{0,1000,500,1000,500,1000}

--别忘了申明权限
 ```


## 发送短信
 ```lua

--后台发送短信

require "import"

import "android.telephony.*"

SmsManager.getDefault().sendTextMessage(tostring(号码), nil, tostring(内容), nil, nil)

--调用系统发送短信

import "android.content.Intent"

import "android.net.Uri"

uri = Uri.parse("smsto:"..号码)

intent = Intent(Intent.ACTION_SENDTO, uri)

intent.putExtra("sms_body",内容)

intent.setAction("android.intent.action.VIEW")

activity.startActivity(intent)
 ```


## 分享
 ```lua

--分享文件

function Sharing(path)

import "android.webkit.MimeTypeMap"

import "android.content.Intent"

import "android.net.Uri"

import "java.io.File"

FileName=tostring(File(path).Name)

ExtensionName=FileName:match("%.(.+)")

Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)

intent = Intent();

intent.setAction(Intent.ACTION_SEND);

intent.setType(Mime);

file = File(path);

uri = Uri.fromFile(file);

intent.putExtra(Intent.EXTRA_STREAM,uri);

intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

activity.startActivity(Intent.createChooser(intent, "分享到:"));

end

--分享文字

text="分享的内容"

intent=Intent(Intent.ACTION_SEND);

intent.setType("text/plain");

intent.putExtra(Intent.EXTRA_SUBJECT, "分享");

intent.putExtra(Intent.EXTRA_TEXT, text);

intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

activity.startActivity(Intent.createChooser(intent,"分享到:"));
 ```

## 传感器
 ```lua

传感器 = activity.getSystemService(Context.SENSOR_SERVICE)

local 加速度传感器 = 传感器.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)

传感器.registerListener(SensorEventListener({

onSensorChanged=function(event)

x轴 = event.values[0]

y轴 = event.values[1]

z轴 = event.values[2]

end,nil}), 加速度传感器, SensorManager.SENSOR_DELAY_NORMAL)

local 光线传感器 = 传感器.getDefaultSensor(Sensor.TYPE_LIGHT)

传感器.registerListener(SensorEventListener({

onSensorChanged=function(event)

光线 = event.values[0]

end,nil}), 光线传感器, SensorManager.SENSOR_DELAY_NORMAL)

local 距离传感器 = 传感器.getDefaultSensor(Sensor.TYPE_PROXIMITY)

传感器.registerListener(SensorEventListener({

onSensorChanged=function(event)

距离 = event.values[0]

end,nil}), 距离传感器, SensorManager.SENSOR_DELAY_NORMAL)

local 磁场传感器 = 传感器.getDefaultSensor(Sensor.TYPE_ORIENTATION)

传感器.registerListener(SensorEventListener({

onSensorChanged=function(event)

磁场 = event.values[0]

end,nil}), 磁场传感器, SensorManager.SENSOR_DELAY_NORMAL)

local 温度传感器 = 传感器.getDefaultSensor(Sensor.TYPE_TEMPERATURE)

传感器.registerListener(SensorEventListener({

onSensorChanged=function(event)

温度 = event.values[0]

end,nil}), 温度传感器, SensorManager.SENSOR_DELAY_NORMAL)

local 陀螺仪传感器 = 传感器.getDefaultSensor(Sensor.TYPE_GYROSCOPE)

传感器.registerListener(SensorEventListener({

onSensorChanged=function(event)

陀螺仪 = event.values[0]

end,nil}), 陀螺仪传感器, SensorManager.SENSOR_DELAY_NORMAL)

local 重力传感器 = 传感器.getDefaultSensor(Sensor.TYPE_GRAVITY)

传感器.registerListener(SensorEventListener({

onSensorChanged=function(event)

重力 = event.values[0]

end,nil}), 重力传感器, SensorManager.SENSOR_DELAY_NORMAL)

local 压力传感器 = 传感器.getDefaultSensor(Sensor.TYPE_PRESSURE)

传感器.registerListener(SensorEventListener({

onSensorChanged=function(event)

压力 = event.values[0]

end,nil}), 压力传感器, SensorManager.SENSOR_DELAY_NORMAL)
 ```


## 使用系统TTS播报语音

```lua

import "android.speech.tts.*"

mTextSpeech = TextToSpeech(activity, TextToSpeech.OnInitListener{

onInit=function(status)

--如果装载TTS成功

if (status == TextToSpeech.SUCCESS)

result = mTextSpeech.setLanguage(Locale.CHINESE);

--[[LANG_MISSING_DATA-->语言的数据丢失

LANG_NOT_SUPPORTED-->语言不支持]]

if (result == TextToSpeech.LANG_MISSING_DATA or result == TextToSpeech.LANG_NOT_SUPPORTED)

--不支持中文

print("您的手机不支持中文语音播报功能。");

result = mTextSpeech.setLanguage(Locale.ENGLISH);

if (result == TextToSpeech.LANG_MISSING_DATA or result == TextToSpeech.LANG_NOT_SUPPORTED)

--不支持中文和英文

print("您的手机不支持语音播报功能。");

else

--不支持中文但支持英文

--语调,1.0默认

mTextSpeech.setPitch(1);

--语速,1.0默认

mTextSpeech.setSpeechRate(1);

mTextSpeech.speak("hello,MLua Manual.Hello,World!", TextToSpeech.QUEUE_FLUSH, nil);

end

else

--支持中文

--语调,1.0默认

mTextSpeech.setPitch(1);

--语速,1.0默认

mTextSpeech.setSpeechRate(1);

mTextSpeech.speak("你好，MLua手册。你好，世界！", TextToSpeech.QUEUE_FLUSH, nil);

end

end

end

})

```


------------------

## 返回桌面
```LUA
import "android.content.Intent"

home=Intent(Intent.ACTION_MAIN);

home.addCategory(Intent.CATEGORY_HOME);

activity.startActivity(home);

```


------------------


## 模拟按键

````lua
function sendKeyCode(keyCode)

xpcall(function()

Runtime.getRuntime().exec("input keyevent " .. keyCode)

end,function(e)

print(e)

end)

end

sendKeyCode(KeyEvent.KEYCODE_VOLUME_DOWN)--音量-


````


{{< expand "参数" "..." >}}

```MARKDOWN

--[[

KEYCODE_0 '0' key. 7

KEYCODE_1 '1' key. 8

KEYCODE_2 '2' key. 9

KEYCODE_3 '3' key. 10

KEYCODE_4 '4' key. 11

KEYCODE_5 '5' key. 12

KEYCODE_6 '6' key. 13

KEYCODE_7 '7' key. 14

KEYCODE_8 '8' key. 15

KEYCODE_9 '9' key. 16

KEYCODE_A 'A' key. 29

KEYCODE_B 'B' key. 30

KEYCODE_C 'C' key. 31

KEYCODE_D 'D' key. 32

KEYCODE_E 'E' key. 33

KEYCODE_F 'F' key. 34

KEYCODE_G 'G' key. 35

KEYCODE_H 'H' key. 36

KEYCODE_I 'I' key. 37

KEYCODE_J 'J' key. 38

KEYCODE_K 'K' key. 39

KEYCODE_L 'L' key. 40

KEYCODE_M 'M' key. 41

KEYCODE_N 'N' key. 42

KEYCODE_O 'O' key. 43

KEYCODE_P 'P' key. 44

KEYCODE_Q 'Q' key. 45

KEYCODE_R 'R' key. 46

KEYCODE_S 'S' key. 47

KEYCODE_T 'T' key. 48

KEYCODE_U 'U' key. 49

KEYCODE_V 'V' key. 50

KEYCODE_W 'W' key. 51

KEYCODE_X 'X' key. 52

KEYCODE_Y 'Y' key. 53

KEYCODE_Z 'Z' key. 54

META_ALT_LEFT_ON This mask is used to check whether the left ALT meta key is pressed. 16

META_ALT_MASK This mask is a combination of META_ALT_ON, META_ALT_LEFT_ON and META_ALT_RIGHT_ON. 50

META_ALT_ON This mask is used to check whether one of the ALT meta keys is pressed. 2

META_ALT_RIGHT_ON This mask is used to check whether the right the ALT meta key is pressed. 32

META_CAPS_LOCK_ON This mask is used to check whether the CAPS LOCK meta key is on. 1048576

META_CTRL_LEFT_ON This mask is used to check whether the left CTRL meta key is pressed. 8192

META_CTRL_MASK This mask is a combination of META_CTRL_ON, META_CTRL_LEFT_ON and META_CTRL_RIGHT_ON. 28672

META_CTRL_ON This mask is used to check whether one of the CTRL meta keys is pressed. 4096

META_CTRL_RIGHT_ON This mask is used to check whether the right CTRL meta key is pressed. 16384

META_FUNCTION_ON This mask is used to check whether the FUNCTION meta key is pressed. 8

META_META_LEFT_ON This mask is used to check whether the left META meta key is pressed. 131072

META_META_MASK This mask is a combination of META_META_ON, META_META_LEFT_ON and META_META_RIGHT_ON. 458752

META_META_ON This mask is used to check whether one of the META meta keys is pressed. 65536

META_META_RIGHT_ON This mask is used to check whether the right META meta key is pressed. 262144

META_NUM_LOCK_ON This mask is used to check whether the NUM LOCK meta key is on. 2097152

META_SCROLL_LOCK_ON This mask is used to check whether the SCROLL LOCK meta key is on. 4194304

META_SHIFT_LEFT_ON This mask is used to check whether the left SHIFT meta key is pressed. 64

META_SHIFT_MASK This mask is a combination of META_SHIFT_ON, META_SHIFT_LEFT_ON and META_SHIFT_RIGHT_ON. 193

META_SHIFT_ON This mask is used to check whether one of the SHIFT meta keys is pressed. 1

META_SHIFT_RIGHT_ON This mask is used to check whether the right SHIFT meta key is pressed. 128

META_SYM_ON This mask is used to check whether the SYM meta key is pressed. 4

KEYCODE_APOSTROPHE ''' key. 75

KEYCODE_AT '@' key. 77

KEYCODE_BACKSLASH '\' key. 73

KEYCODE_COMMA ',' key. 55

KEYCODE_EQUALS '=' key. 70

KEYCODE_GRAVE '`' key. 68

KEYCODE_LEFT_BRACKET '[' key. 71

KEYCODE_MINUS '-' key. 69

KEYCODE_PERIOD '.' key. 56

KEYCODE_PLUS '+' key. 81

KEYCODE_POUND '#' key. 18

KEYCODE_RIGHT_BRACKET ']' key. 72

KEYCODE_SEMICOLON ';' key. 74

KEYCODE_SLASH '/' key. 76

KEYCODE_STAR '*' key. 17

KEYCODE_SPACE Space key. 62

KEYCODE_TAB Tab key. 61

KEYCODE_ENTER Enter key. 66

KEYCODE_ESCAPE Escape key. 111

KEYCODE_CAPS_LOCK Caps Lock key. 115

KEYCODE_CLEAR Clear key. 28

KEYCODE_PAGE_DOWN Page Down key. 93

KEYCODE_PAGE_UP Page Up key. 92

KEYCODE_SCROLL_LOCK Scroll Lock key. 116

KEYCODE_MOVE_END End. 123

KEYCODE_MOVE_HOME Home. 122

KEYCODE_INSERT Insert key. 124

KEYCODE_SHIFT_LEFT Left Shift. 59

KEYCODE_SHIFT_RIGHT Right Shift. 60

KEYCODE_F1 F1 key. 131

KEYCODE_F2 F2 key. 132

KEYCODE_F3 F3 key. 133

KEYCODE_F4 F4 key. 134

KEYCODE_F5 F5 key. 135

KEYCODE_F6 F6 key. 136

KEYCODE_F7 F7 key. 137

KEYCODE_F8 F8 key. 138

KEYCODE_F9 F9 key. 139

KEYCODE_F10 F10 key. 140

KEYCODE_F11 F11 key. 141

KEYCODE_F12 F12 key. 142

KEYCODE_BACK Back key. 4

KEYCODE_CALL Call key. 5

KEYCODE_ENDCALL End Call key. 6

KEYCODE_CAMERA Camera key. 27

KEYCODE_FOCUS Camera Focus key. 80

KEYCODE_VOLUME_UP Volume Up key. 24

KEYCODE_VOLUME_DOWN Volume Down key. 25

KEYCODE_VOLUME_MUTE Volume Mute key. 164

KEYCODE_MENU Menu key. 82

KEYCODE_HOME Home key. 3

KEYCODE_POWER Power key. 26

KEYCODE_SEARCH Search key. 84

KEYCODE_NOTIFICATION Notification key. 83

KEYCODE_NUM Number modifier key. 78

KEYCODE_SYM Symbol modifier key. 63

KEYCODE_SETTINGS Settings key. 176

KEYCODE_DEL Backspace key. Deletes characters before the insertion point, unlike KEYCODE_FORWARD_DEL. 67

KEYCODE_FORWARD_DEL Forward Delete key. Deletes characters ahead of the insertion point, unlike KEYCODE_DEL. 112

KEYCODE_NUMPAD_0 Numeric keypad '0' key. 144

KEYCODE_NUMPAD_1 Numeric keypad '1' key. 145

KEYCODE_NUMPAD_2 Numeric keypad '2' key. 146

KEYCODE_NUMPAD_3 Numeric keypad '3' key. 147

KEYCODE_NUMPAD_4 Numeric keypad '4' key. 148

KEYCODE_NUMPAD_5 Numeric keypad '5' key. 149

KEYCODE_NUMPAD_6 Numeric keypad '6' key. 150

KEYCODE_NUMPAD_7 Numeric keypad '7' key. 151

KEYCODE_NUMPAD_8 Numeric keypad '8' key. 152

KEYCODE_NUMPAD_9 Numeric keypad '9' key. 153

KEYCODE_NUMPAD_ADD Numeric keypad '+' key 157

KEYCODE_NUMPAD_COMMA Numeric keypad ',' key 159

KEYCODE_NUMPAD_DIVIDE Numeric keypad '/' key 154

KEYCODE_NUMPAD_DOT Numeric keypad '.' key 158

KEYCODE_NUMPAD_EQUALS Numeric keypad '=' key. 161

KEYCODE_NUMPAD_LEFT_PAREN Numeric keypad '(' key. 162

KEYCODE_NUMPAD_MULTIPLY Numeric keypad '*' key 155

KEYCODE_NUMPAD_RIGHT_PAREN Numeric keypad ')' key. 163

KEYCODE_NUMPAD_SUBTRACT Numeric keypad '-' key 156

KEYCODE_NUMPAD_ENTER Numeric keypad Enter key. 160

KEYCODE_NUM_LOCK Numeric keypad Num Lock key. 143

KEYCODE_MEDIA_FAST_FORWARD Fast Forward media key. 90

KEYCODE_MEDIA_NEXT Play Next media key. 87

KEYCODE_MEDIA_PAUSE Pause media key. 127

KEYCODE_MEDIA_PLAY Play media key. 126

KEYCODE_MEDIA_PLAY_PAUSE Play/Pause media key. 85

KEYCODE_MEDIA_PREVIOUS Play Previous media key. 88

KEYCODE_MEDIA_RECORD Record media key. 130

KEYCODE_MEDIA_REWIND Rewind media key. 89

KEYCODE_MEDIA_STOP Stop media key. 86

]]
```

{{< /expand >}}

------------------

## 权限

### 判断有无悬浮窗权限
```lua
import "android.provider.Settings"

function 判断悬浮窗权限()

if (Build.VERSION.SDK_INT >= 23 and not Settings.canDrawOverlays(this)) then

return false

elseif Build.VERSION.SDK_INT < 23 then

return nil

else

return true

end

end
```

Build.VERSION.SDK_INT >= 23 是因为安卓6.0以下没有统一判断悬浮窗权限的方法

当安卓版本大于6.0且有悬浮窗权限时返回true，当安卓版本大于6.0且无悬浮窗权限时返回false，当安卓版本小于6.0时无法判断返回nil

```lua
--调用例子
print(判断悬浮窗权限())

```

### 获取悬浮窗权限

```lua
import "android.net.Uri"

import "android.content.Intent"

import "android.provider.Settings"

function 获取悬浮窗权限()

intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);

intent.setData(Uri.parse("package:" .. activity.getPackageName()));

activity.startActivityForResult(intent, 100);

end

--调用示例

获取悬浮窗权限()
```


------------------

## 应用交互

## 调用其它程序打开文件
 ```lua

function OpenFile(path)

import "android.webkit.MimeTypeMap"

import "android.content.Intent"

import "android.net.Uri"

import "java.io.File"

FileName=tostring(File(path).Name)

ExtensionName=FileName:match("%.(.+)")

Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)

if Mime then

intent = Intent();

intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

intent.setAction(Intent.ACTION_VIEW);

intent.setDataAndType(Uri.fromFile(File(path)), Mime);

activity.startActivity(intent);

else

Toastc("找不到可以用来打开此文件的程序")

end

end
 ```



### QQ名片

```lua
import "android.net.Uri"

import "android.content.Intent"

function QQ群(h)

url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin="..h.."&card_type=group&source=qrcode"

activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))

end

function QQ(h)

url="mqqapi://card/show_pslcard?src_type=internal&source=sharecard&version=1&uin="..h

activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))

end

--调用

QQ群("686976850")

QQ("1773798610")

```

### 浏览器
##### 搜索关键字

```lua

--搜索关键字

import "android.content.Intent"

import "android.app.SearchManager"

intent = Intent()

intent.setAction(Intent.ACTION_WEB_SEARCH)

intent.putExtra(SearchManager.QUERY,"Alua开发手册")

activity.startActivity(intent)

```

#### 打开网页
```lua
import "android.content.Intent"

import "android.net.Uri"

url="http://www.androlua.cn"

viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))

activity.startActivity(viewIntent)

```

### 打开其它程序
```lua
packageName=程序包名

import "android.content.Intent"

import "android.content.pm.PackageManager"

manager = activity.getPackageManager()

open = manager.getLaunchIntentForPackage(packageName)

this.startActivity(open)

```

### 安装其他程序

```lua

import "android.content.Intent"

import "android.net.Uri"

intent = Intent(Intent.ACTION_VIEW)

安装包路径="/sdcard/a.apk"

intent.setDataAndType(Uri.parse("file://"..安装包路径), "application/vnd.android.package-archive")

intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)

activity.startActivity(intent)
```

### 卸载其他程序
```lua
import "android.net.Uri"

import "android.content.Intent"

包名="com.huluxia.gametools"

uri = Uri.parse("package:"..包名)

intent = Intent(Intent.ACTION_DELETE,uri)

activity.startActivity(intent)
```


------------------

## 系统交互

### 播放Mp4
```lua
import "android.content.Intent"

import "android.net.Uri"

intent = Intent(Intent.ACTION_VIEW)

uri = Uri.parse("file:///sdcard/a.mp4")

intent.setDataAndType(uri, "video/mp4")

activity.startActivity(intent)
```
### 播放Mp3
```lua
import "android.content.Intent"

import "android.net.Uri"

intent = Intent(Intent.ACTION_VIEW)

uri = Uri.parse("file:///sdcard/song.mp3")

intent.setDataAndType(uri, "audio/mp3")

this.startActivity(intent)

```

### 搜索应用


```lua

import "android.content.Intent"

import "android.net.Uri"

intent = Intent("android.intent.action.VIEW")

intent .setData(Uri.parse( "market://details?id="..activity.getPackageName()))

this.startActivity(intent)
```

### 调用系统设置

```lua

import "android.content.Intent"

import "android.provider.Settings"

intent = Intent(Settings.ACTION_BLUETOOTH_SETTINGS)

this.startActivity(intent)

--[[

原代码：

intent = Intent(android.provider.Settings.ACTION_SETTINGS)

this.startActivity(intent)

19-10-03修正错误]]
```
{{< expand "字段补充" "..." >}}

#### 设置
```lua

ACTION_SETTINGS 系统设置

CTION_APN_SETTINGS APN设置

ACTION_LOCATION_SOURCE_SETTINGS 位置和访问信息

ACTION_WIRELESS_SETTINGS 网络设置

ACTION_AIRPLANE_MODE_SETTINGS 无线和网络热点设置

ACTION_SECURITY_SETTINGS 位置和安全设置

ACTION_WIFI_SETTINGS 无线网WIFI设置

ACTION_WIFI_IP_SETTINGS 无线网IP设置

ACTION_BLUETOOTH_SETTINGS 蓝牙设置

ACTION_DATE_SETTINGS 时间和日期设置

ACTION_SOUND_SETTINGS 声音设置

ACTION_DISPLAY_SETTINGS 显示设置——字体大小等

ACTION_LOCALE_SETTINGS 语言设置

ACTION_INPUT_METHOD_SETTINGS 输入法设置

ACTION_USER_DICTIONARY_SETTINGS 用户词典

ACTION_APPLICATION_SETTINGS 应用程序设置

ACTION_APPLICATION_DEVELOPMENT_SETTINGS 应用程序设置

ACTION_QUICK_LAUNCH_SETTINGS 快速启动设置

ACTION_MANAGE_APPLICATIONS_SETTINGS 已下载（安装）软件列表

ACTION_SYNC_SETTINGS 应用程序数据同步设置

ACTION_NETWORK_OPERATOR_SETTINGS 可用网络搜索

ACTION_DATA_ROAMING_SETTINGS 移动网络设置

ACTION_INTERNAL_STORAGE_SETTINGS 手机存储设置
```
{{< /expand >}}


### 调用系统打开文件
```lua

function OpenFile(path)

import "android.webkit.MimeTypeMap"

import "android.content.Intent"

import "android.net.Uri"

import "java.io.File"

FileName=tostring(File(path).Name)

ExtensionName=FileName:match("%.(.+)")

Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)

if Mime then

intent = Intent()

intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)

intent.setAction(Intent.ACTION_VIEW);

intent.setDataAndType(Uri.fromFile(File(path)), Mime);

activity.startActivity(intent)

return true

else

return false

end

end

OpenFile(文件路径)
```


### 调用图库
```lua

import "android.content.Intent"

local intent= Intent(Intent.ACTION_PICK)

intent.setType("image/*")

this.startActivityForResult(intent, 1)

-------

--回调

function onActivityResult(requestCode,resultCode,intent)

if intent then

local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)

cursor.moveToFirst()

import "android.provider.MediaStore"

local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)

fileSrc = cursor.getString(idx)

bit=nil

--fileSrc回调路径路径

import "android.graphics.BitmapFactory"

bit =BitmapFactory.decodeFile(fileSrc)

-- iv.setImageBitmap(bit)

end

end--nirenr
```

### 调用文件管理器选择文件

```lua

function ChooseFile()

import "android.content.Intent"

import "android.net.Uri"

import "java.net.URLDecoder"

import "java.io.File"

intent = Intent(Intent.ACTION_GET_CONTENT)

intent.setType("*/");

intent.addCategory(Intent.CATEGORY_OPENABLE)

activity.startActivityForResult(intent,1);

function onActivityResult(requestCode,resultCode,data)

if resultCode == Activity.RESULT_OK then

local str = data.getData().toString()

local decodeStr = URLDecoder.decode(str,"UTF-8")

print(decodeStr)

end

end

end

ChooseFile()

```

### 分享文件
```
function Sharing(path)

import "android.webkit.MimeTypeMap"

import "android.content.Intent"

import "android.net.Uri"

import "java.io.File"

FileName=tostring(File(path).Name)

ExtensionName=FileName:match("%.(.+)")

Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)

intent = Intent()

intent.setAction(Intent.ACTION_SEND)

intent.setType(Mime)

file = File(path)

uri = Uri.fromFile(file)

intent.putExtra(Intent.EXTRA_STREAM,uri)

intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)

activity.startActivity(Intent.createChooser(intent, "分享到:"))

end

Sharing(文件路径)

```

-------------

### 调用通信



#### 发送短信

```lua

import "android.net.Uri"

import "android.content.Intent"

uri = Uri.parse("smsto:10010")

intent = Intent(Intent.ACTION_SENDTO, uri)

intent.putExtra("sms_body","cxll")

intent.setAction("android.intent.action.VIEW")

activity.startActivity(intent)

```

#### 发送彩信
```lua

import "android.net.Uri"

import "android.content.Intent"

uri=Uri.parse("file:///sdcard/a.png") --图片路径

intent= Intent();

intent.setAction(Intent.ACTION_SEND);

intent.putExtra("address",mobile) --邮件地址

intent.putExtra("sms_body",content) --邮件内容

intent.putExtra(Intent.EXTRA_STREAM,uri)

intent.setType("image/png") --设置类型

this.startActivity(intent)
```

#### 拨打电话
```lua
import "android.net.Uri"

import "android.content.Intent"

uri = Uri.parse("tel:10010")

intent = Intent(Intent.ACTION_CALL, uri)

intent.setAction("android.intent.action.VIEW")

activity.startActivity(intent)

```

## 调用应用商店搜索应用
 ```lua

import "android.content.Intent"

import "android.net.Uri"

intent = Intent("android.intent.action.VIEW")

intent .setData(Uri.parse( "market://details?id="..activity.getPackageName()))

this.startActivity(intent)
 ```


## 设备信息


## 获取系统SDK，Android版本及设备型号
 ```lua

device_model = Build.MODEL --设备型号

version_sdk = Build.VERSION.SDK --设备SDK版本

version_release = Build.VERSION.RELEASE --设备的系统版本
 ```


## 获取设备标识码
 ```lua

import "android.provider.Settings$Secure"

android_id = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
 ```

## 获取IMEI
 ```lua

import "android.content.Context"

imei=activity.getSystemService(Context.TELEPHONY_SERVICE).getDeviceId()
 ```

## 精准获取屏幕尺寸
 ```lua

function getScreenPhysicalSize(ctx)

import "android.util.DisplayMetrics"

dm = DisplayMetrics();

ctx.getWindowManager().getDefaultDisplay().getMetrics(dm);

diagonalPixels = Math.sqrt(Math.pow(dm.widthPixels, 2) + Math.pow(dm.heightPixels, 2));

return diagonalPixels / (160 * dm.density);

end

print(getScreenPhysicalSize(activity))
 ```



## 获取手机存储空间
 ```lua

--获取手机内置剩余存储空间

function GetSurplusSpace()

fs = StatFs(Environment.getDataDirectory().getPath())

return Formatter.formatFileSize(activity, (fs.getAvailableBytes()))

end

--获取手机内置存储总空间

function GetTotalSpace()

path = Environment.getExternalStorageDirectory()

stat = StatFs(path.getPath())

blockSize = stat.getBlockSize()

totalBlocks = stat.getBlockCount()

return Formatter.formatFileSize(activity, blockSize * totalBlocks)

end
 ```

## 获取手机内置存储路径
 ```lua

Environment.getExternalStorageDirectory().toString()
 ```

## 获取已安装程序的包名、版本号、最后更新时间、图标、应用名称
 ```lua

function GetAppInfo(包名)

import "android.content.pm.PackageManager"

local pm = activity.getPackageManager();

local 图标 = pm.getApplicationInfo(tostring(包名),0)

local 图标 = 图标.loadIcon(pm);

local pkg = activity.getPackageManager().getPackageInfo(包名, 0);

local 应用名称 = pkg.applicationInfo.loadLabel(activity.getPackageManager())

local 版本号 = activity.getPackageManager().getPackageInfo(包名, 0).versionName

local 最后更新时间 = activity.getPackageManager().getPackageInfo(包名, 0).lastUpdateTime

local cal = Calendar.getInstance();

cal.setTimeInMillis(最后更新时间);

local 最后更新时间 = cal.getTime().toLocaleString()

return 包名,版本号,最后更新时间,图标,应用名称

end
 ```

## 获取指定安装包的包名,图标,应用名
 ```lua

import "android.content.pm.PackageManager"

import "android.content.pm.ApplicationInfo"

function GetApkInfo(archiveFilePath)

pm = activity.getPackageManager()

info = pm.getPackageArchiveInfo(archiveFilePath, PackageManager.GET_ACTIVITIES);

if info ~= nil then

appInfo = info.applicationInfo;

appName = tostring(pm.getApplicationLabel(appInfo))

packageName = appInfo.packageName; --安装包名称

version=info.versionName; --版本信息

icon = pm.getApplicationIcon(appInfo);--图标

end

return packageName,version,icon

end
 ```

## 获取某程序是否安装
 ```lua

if pcall(function() activity.getPackageManager().getPackageInfo("包名",0) end) then

print("已安装")

else

print("未安装")

end
 ```
## 获取IMEI号
 ```lua

import "android.content.*"

--导入包

imei=activity.getSystemService(Context.TELEPHONY_SERVICE).getDeviceId();

print(imei)

--别忘了添加权限"READ_PHONE_STATE"
 ```



## 获取运营商名称
 ```lua

import "android.content.Context"

运营商名称 = this.getSystemService(Context.TELEPHONY_SERVICE).getNetworkOperatorName()

print(运营商名称)

--添加权限 READ_PHONE_STATE
 ```




## 获取本地时间
 ```lua

--格式的时间

os.date("%Y-%m-%d %H:%M:%S")

--本地时间总和

os.clock()
 ```
