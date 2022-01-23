--需导入�����X请自行将运行助手拆包，在libs文件夹里
--异步GET请求，除注释外都是固定模板，复制粘贴即可
import 'com.kn.okhttp.*'
import 'okhttp3.*'
url = 'http://dh.hfybbs.vip'--请求URL
okHttpClient = OkHttpClient()
request = Request.Builder()
.url(url)
.get()
.build()
call = okHttpClient.newCall(request)
call.enqueue(Callback{
  onFailure = function(call,e)--请求失败
    print(e)
  end,

  onResponse = function(call,response)--请求成功
    print(response.body().string())
  end
  })