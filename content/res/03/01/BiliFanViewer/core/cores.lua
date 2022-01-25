function overstrik(ID)
import "android.graphics.Paint"
ID.getPaint().setFakeBoldText(true)
end

function 波纹(id,颜色)

  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
end

--写入数据函数
function putData(name,key,value)
  this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
  return true
end
function getData(name,key)--验证
  local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
  return data
end


function 提示(text,color)
  text=tostring(text)
  if color==nil then
    color="#CC4E93D8"
  end
  color=tostring(color)
  Toastbody={
    LinearLayout,
    layout_width="100%w";
    gravity="center";
    layout_height="fill";
    background=color;
    {
      TextView;
      gravity="center";
      text="空!";
      id="Toast_TextView";
      textColor="#FFFDFDFD";
      textSize=="15sp";
      layout_width="110%w";
      layout_height="36dp";
    };
  }
  local Toastbody=Toast.makeText(activity,"内容",Toast.LENGTH_SHORT).setView(loadlayout(Toastbody))
  --LENGTH_SHORT     2s
  --LENGTH_LONG      3.5s
  --Gravity.BOTTOM   底部
  --Gravity.CENTER   中部
  --Gravity.TOP      顶部
  Toastbody.setGravity(Gravity.BOTTOM,0,0)
  Toast_TextView.Text=tostring(text)
  Toastbody.show()
end


function Ripple(id,color,t)
import "android.content.res.ColorStateList";
  local ripple
  if t=="circle" or not(t) then
    if not(RippleCircular) then
      RippleCircular=activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
    end
    ripple=RippleCircular
   elseif t=="square" then
    if not(RippleSquare) then
      RippleSquare=activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
    end
    ripple=RippleSquare
  end

  local drawable=activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color}))
  if id then
    id.setBackground(drawable)
   else
    return drawable
  end

end




function 写入文件(路径,内容)
  import "java.io.File"
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end



function 检测更新(URL,PURL,headerua)
  import 'android.text.SpannableString'
  import 'android.text.style.ForegroundColorSpan'
  import 'android.text.Spannable'
  header={
    ['User-Agent'] = headerua
  }
  if header==nil then
    header = {
      ['User-Agent'] = 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36'
    }
  end
  function 处理网页源码(content)
    content=tostring(content)
    --处理获取的内容
    content = content:gsub('<br>', '') or content
    content = content:gsub('<div>', '') or content
    content = content:gsub('</div>', '') or content
    content = content:gsub('amp;', '') or content
    content = content:gsub('&nbsp;', '') or content
    content = content:gsub('<br>', '\n') or content
    --   content=content:gsub("<","") or content;
    --    content=content:gsub("/","") or content;
    --    content=content:gsub(">","") or content;
    content = content:gsub('<p>', '\n') or content
    content = content:gsub('</p>', '\n') or content
    return content
  end
  function 处理更新信息(content)
    packinfo =
    this.getPackageManager().getPackageInfo(
    this.getPackageName(),
    ((32552732 / 2 / 2 - 8183) / 10000 - 6 - 231) / 9
    )
    当前版本 = tostring(packinfo.versionName) --版本信息
    --当前版本=tonumber(activity.getPackageManager().getPackageInfo(包名, 0).versionName)
    更新版本=tostring(content:match("【升级至】(.-)【升级至】"))
    更新说明=tostring(content:match("【介绍】(.-)【介绍】"))
    更新链接=tostring(content:match("【链接】(.-)【链接】"))
    强制状态=tostring(content:match("【是否强制】(.-)【是否强制】"))
    return 包名,当前版本,更新版本,更新说明,更新链接,强制状态
  end
  function 展示更新(更新版本,当前版本,更新说明,更新链接,强制状态)
    if 更新版本 > 当前版本 then
      at=AlertDialog.Builder(this)
      at.setTitle("有新版本更新  "..更新版本)
      at.setMessage(更新说明)
              if 强制状态=="是" then
    --设置禁用返回和外部
    at.setCancelable(false)
  end
      at.setPositiveButton("前往更新",{onClick=function(v)
       if pcall(function()
          import "android.content.Intent"
          import "android.net.Uri"
          url=更新链接
          viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
          activity.startActivity(viewIntent)
              end) then
   else
   提示(("执行失败...."),"#B2EE567D")
   end
          if 强制状态=="是" then
            os.exit()
          end
        end})
      at.setNegativeButton("取消",{onClick=function(v)
          if 强制状态=="是" then
            os.exit()
          end
        end})
      at.show()
    end--结束对话框
  end
  Http.get(URL,nil,"utf8",header,function(code, content)
    if code==200 then
      content=处理网页源码(content)
      --包名=activity.getPackageName()
      处理更新信息(content)
      展示更新(更新版本,当前版本,更新说明,更新链接,强制状态)
    else
      提示(("检测更新失败"..code),"#B2EE567D")
      Http.get(PURL,nil,"utf8",header,function(code, content)
        if code==200 then
          content=处理网页源码(content)
          --包名=activity.getPackageName()
          处理更新信息(content)
          展示更新(更新版本,当前版本,更新说明,更新链接,强制状态)
        else
          提示(("检测备用更新失败"..code),"#B2EE567D")
        end
      end)
      --备用地址
    end
  end)
end

