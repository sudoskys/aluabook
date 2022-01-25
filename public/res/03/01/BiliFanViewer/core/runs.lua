

function Refresh()
  sr.setRefreshing(true)
  检查目录()
  activity.newTask(function(upDirFile,upDirFiles)
    require "import"
    import "java.io.*"
    -- print(activity.getGlobalData()["iscount"])
    fl=luajava.astable(upDirFile.listFiles())
    table.sort(fl,function(a,b)
      return string.upper(a.Name)<string.upper(b.Name)
    end)
    -- if pcall(function()------------------------
    datas={}
    function 边框圆角(边宽度,边框色,背景色,圆角度)
      import "android.graphics.drawable.GradientDrawable"
      drawable = GradientDrawable()
      drawable.setShape(GradientDrawable.RECTANGLE)
      drawable.setStroke(边宽度,tonumber(边框色))
      drawable.setColor(tonumber(背景色))
      drawable.setCornerRadius(圆角度)
      return drawable
    end
    import "android.graphics.drawable.GradientDrawable"
    function 渐变(left_jb,right_jb,圆角)
      drawable = GradientDrawable(GradientDrawable.Orientation.TR_BL,{
        right_jb,
        left_jb,
      });
      drawable.setShape(GradientDrawable.RECTANGLE)
      drawable.setCornerRadii({圆角,圆角,圆角,圆角,圆角,圆角,圆角,圆角})
      return drawable
    end

    for index,content in ipairs(fl) do

      if content.isDirectory() then

       else

        if activity.getGlobalData()["iscount"]=="true" then
         else
          路径=(fl[index])
          内容=io.open(tostring(路径)):read("*a")
          table.insert(datas,{
            idnumber=content.getName(),
            path=路径,--(fl[index].Name),
            昵称=内容:match("#名称#(.-)#名称#"),
            粉丝数=内容:match("#粉丝#(.-)#粉丝#"),
            签名=内容:match("#签名#(.-)#签名#"),
            头像=loadbitmap(内容:match("#头像#(.-)#头像#")),
            --  totalsize="大小："..getFolderSize(tostring(content),true),
            -- apkNumber="APK数："..getDirNumber(content,"apk"),
            --卡片={BackgroundDrawable=边框圆角(4,0xFFF8C3CD,0xefffffff,22)},
            卡片={BackgroundDrawable=渐变(0xFFF8C3CD,0xFFF596AA,20)},
          })
          --print(dump(datas))
        end
      end
    end
    ------------------------
    --  end) then
    --  else
    --  print("不可预料的错误!")
    --  end------------------------
    return datas
  end
  ,function(datas)
    _G.datas=datas
    载入条.setVisibility(View.GONE)
    if adp then
      luajava.clear(adp)
    end
    adp=LuaAdapter(activity,datas,item)
    listView.Adapter=adp

    sr.setRefreshing(false)
  end).execute({upDirFile})
end






function 加入项目()
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
      text="输入哔哩哔哩UID";
    };
    {
      EditText;
      hint="填写目标";
      InputType="number",--设置只可输入数字
      singleLine=true;--设置单行输入
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="edit";
    };
  };

  AlertDialog.Builder(this)
  .setTitle("添加项目")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      local some=(edit.Text)
      请求数据(some,upDirFiles)
      Refresh()
  end})
  .setNegativeButton("取消",nil)
  .show()
end





function 检查目录()
  if pcall(function()
      import "java.io.*"
      fl=luajava.astable(upDirFile.listFiles())
      local POS={}
      if (dump(fl))==(dump(POS)) then
        print("暂无观测项目")
        没有项目.setVisibility(View.VISIBLE)
        载入条.setVisibility(View.GONE)
        点击刷新.onClick=function()
          载入数据()
        end
       else
        没有项目.setVisibility(View.GONE)
      end
    end) then
   else
    print("检查错误  :(")
  end
end

function 请求粉丝(URLfans,URLperson)
  cjson=require ("cjson")
  Http.get(URLfans,nil,"utf8",header,function(code,content,cookie,header)
    if(code==200 and content)then
      json=cjson.decode(content);
      if json["code"]==0 then
        json_data = json["data"];
        json_follow = json_data["follower"];
        提示("通信成功"..code)
        local fanss="#粉丝#"..json_follow.."#粉丝#  \n"
        activity.getGlobalData()["首段"]=fanss
       else
        print("通信频繁，可能被风控系统锁定"..json["code"])
        return json_follow
      end
     else
      提示("通信失败"..code)
    end
    请求up信息(URLperson)
  end)
end

function 请求up信息(URLperson)
  cjson=require ("cjson")
  if URLperson==nil then print("请求中途遇到了空值错误，指向不明地址")else
    Http.get(URLperson,nil,"utf8",header,function(code,content,cookie,header)
      if(code==200 and content)then
        json=cjson.decode(content);
        if json["code"]==0 then
          json_data = json["data"];
          json_name = json_data["name"];
          json_face = json_data["face"];
          json_sign = tostring(json_data["sign"]);
          提示("通信成功"..code)
          local name="#名称#"..json_name.."#名称# \n"
          local head="#头像#"..json_face.."#头像#  \n"
          local signal="#签名#"..json_sign.."#签名#  \n"
          activity.getGlobalData()["尾段"]=name..head..signal
         else
          print("通信频繁，可能被风控系统锁定"..json["code"])
        end
       else
        提示("通信失败"..code)
      end
      return json_name,json_face,json_sign
    end)
  end
end

function 请求数据(id,Filess)
  ids=id
  Filesss=Filess
  cjson=require ("cjson")
  if ids==nil then else
    --拼接请求链接
    URLfans="https://"..home.."/x/"..fans.."?vmid="..ids.."&jsonp=jsonp"
    URLperson="https://"..home.."/x/"..person.."?mid="..ids.."&jsonp=jsonp"
    -- json_follow=请求粉丝(URLfans)
    请求粉丝(URLfans,URLperson)
    task(1000,function()
      head=activity.getGlobalData()["首段"]
      body=activity.getGlobalData()["尾段"]
      if(head==nil or body==nil)then;print("链接超时")else
        --请求up信息(URLperson)
        --json_name,json_face,json_sign=请求up信息(URLperson)
        文件信息=head..body
        --   print(文件信息)
        写入文件(Filesss..ids,文件信息)
        Refresh()
      end
    end)
  end
end