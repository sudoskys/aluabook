require "import"
import "android.app.*"
import "android.support.v7.widget.*"
import "android.support.design.widget.*"
import "android.support.v4.widget.*"
import "android.widget.*"
import "layout"
---导入基础包完成
import "android.os.Environment"
import "java.io.File"
import "com.androlua.LuaAdapter"

--导入文件处理包
import "android.view.View"

--导入视图
--布局动画管理
import "android.view.animation.LayoutAnimationController"
import "android.view.animation.AnimationUtils"

--主题
import "com.androlua.R";activity.setTheme(R.style.一斥染)

--字符串资源
import"capsule.value.str"

--导入内核包
import "core.runs";import "core.rule";import "core.hotup";import "core.cores";检测更新("https://wds.ecsxs.com/206390.html",nil,nil)

--初始页面
activity.setContentView(loadlayout(layout))
activity.setTitle('Supported by AndroLua+')

--主布局
activity.ActionBar.hide()--隐藏标题栏
import "capsule.value.color";import "capsule.layout.now";activity.setContentView(loadlayout(now))
title.setText("BiliFans")
overstrik(title)


--UI加载
overstrik(addsth_text)
Ripple(addsth,0xffF8C3CD)--;波纹(addsth,0xffF8C3CD)
addsth.onClick=function()加入项目()end

--协议加载
if getData("set","rule")=="true" then
else
加载协议()
end


--列表加载
import"capsule.layout.item"
adp=LuaAdapter(activity,datas,item)
listView.Adapter=adp
--adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1,String(datas))
animation = AnimationUtils.loadAnimation(activity,android.R.anim.slide_in_left)
lac = LayoutAnimationController(animation)
lac.setOrder(LayoutAnimationController.ORDER_NORMAL)
lac.setDelay(0.7)--单位是秒
--listView.setAdapter(adp)
listView.setLayoutAnimation(lac)
--项目被长按
listView.onItemLongClick=function(id,v,zero,one)
  local mpath=(v.Tag.path.text)
  AlertDialog.Builder(this)
  .setTitle("删除？")
  .setMessage("将此项删除？")
  .setPositiveButton("是的",{onClick=function()
      os.remove(mpath)
      Refresh()
  end})
  .setNegativeButton("我点错了",nil)
  .show();
  return true
end
listView.onItemClick=function(id,v,zero,one)
  local ids=(v.Tag.idnumber.text)
  AlertDialog.Builder(this)
  .setTitle("更新数据")
  .setMessage("手动更新粉丝数据？")
  .setPositiveButton("是的",{onClick=function()
      请求数据(ids,upDirFiles)
  end})
  .setNegativeButton("取消",nil)
  .show();
end

--定义路径
bilibili=Environment.getExternalStorageDirectory().toString().."/bilifans"
upDirFile=File(bilibili.."/配置文件")
upDirFiles=bilibili.."/配置文件/"
if not(upDirFile).exists()then;upDirFile.mkdirs()end

--刷新
sr.setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener{onRefresh=function()Refresh()end})
sr.setColorSchemeColors({Primaryx});
--回调
function onResume()Refresh()end
