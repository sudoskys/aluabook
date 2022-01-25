function 加载协议()

local mess=[[
条款和条件
下载或使用该应用程序，此条款将自动适用于您——因此，请确保在使用该应用程序之前仔细阅读这些条款。您不得以任何方式复制或修改该应用程序、应用程序的任何部分及我的商标。您无权尝试提取应用程序的源代码，也不应尝试将应用程序翻译成其他语言或制作派生版本。该应用程序本身以及与之相关的所有商标、版权、数据库权利和其他知识产权，仍属于luoying.

luoying致力于确保该应用程序尽可能有用和高效。因此，我保留随时对应用程序进行更改或对其服务收费的权利。如果没有向您明确说明您支付的费用，我永远不会向您收取应用程序或其服务费用。

BiliFanViewer存储并处理您提供给我的个人数据，以便提供我的服务。确保您的手机和对应用程序的访问安全是您的责任。因此，我建议您不要给您的手机越狱或root您的手机，这是删除软件限制和设备官方操作系统所施加的限制的过程。它可能会使您的手机容易受到恶意软件/病毒/恶意程序的攻击，从而损害您手机的安全功能，并且可能意味着BiliFanViewer无法正常运行或根本无法运行。

您应该意识到，luoying在某些情况下不承担任何责任。应用程序的某些功能要求应用程序具有活动的internet连接。连接可以是Wi-Fi，也可以由您的移动网络提供商提供，但如果您无法访问Wi-Fi，并且您没有任何剩余的数据空间，则luoying无法对应用程序无法完全正常工作承担责任。

如果您在Wi-Fi区域外使用该应用程序，您应该记住，您与移动网络提供商的协议条款仍然适用。因此，您的移动提供商可能会向您收取访问应用程序时连接期间的数据成本或其他第三方费用。在使用该应用程序时，您将承担任何此类费用，包括漫游数据费用，前提是您在不关闭数据漫游的情况下在您的母国（即地区或国家）之外使用该应用程序。如果您不是正在使用应用程序的设备的付款人，请注意，我假设您已收到付款人使用该应用程序的许可。

同样，luoying也不能总是对你使用应用程序的方式负责，也就是说，你需要确保你的设备保持充电状态——如果电池用完了，你不能打开它来使用服务，luoying不能承担责任。

关于luoying对您使用该应用程序的责任，当您使用该应用程序时，请务必记住，尽管我努力确保它在任何时候都是更新和正确运行的，但我依赖第三方向我提供信息，以便我可以向您提供信息。luoying对于您因完全依赖应用程序的此功能而遭受的任何直接或间接损失，概不负责。

在某个时候，我可能希望更新应用程序。应用程序的需求可能会发生变化，并且如果您想继续使用该应用程序，则需要下载更新。 luoying不保证应用程序将始终更新，使其与您相关和或与您设备上安装的版本可以使用。但是，您保证在提供给您时始终接受该应用程序的更新。我也可能停止提供该应用程序，并且可以在不通知您终止的情况下随时终止其使用。除非我另行告知，否则在任何终止后，（a）这些条款授予您的权利和许可将终止；（b）您必须停止使用该应用程序，并且（如果需要）将其从设备中删除。

本条款和条件的变更

我可能会不时更新我的条款和条件。因此，建议您定期查看此页以了解更改。如有任何更改，我会在本页公布新的条款和条件。

这些条款和条件自2021-02-25起生效。

联系我们

如果您对我的隐私政策有任何疑问或建议，请随时通过xiaow3493@gmail.com 与我联系。


此条款和条件页面是由 应用隐私政策生成器 生成的。
]]

AlertDialog.Builder(this)
.setTitle("条款声明")
.setMessage(mess)
.setPositiveButton("同意",{onClick=function()
putData("set","rule","true")
end})
.setNegativeButton("拒绝",{onClick=function()
os.exit()
end})
.setCancelable(false)
.show();

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
