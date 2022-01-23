--需导入�����X请自行将运行助手拆包，在libs文件夹里
--POST提交字符串，除注释外都是固定模板，复制粘贴即可
import 'com.kn.okhttp.*'
import 'okhttp3.*'
mediaType = MediaType.parse('text/x-markdown; charset=utf-8')
requestBody = 'I am Jdqm'--提交字符串
request = Request.Builder()
.url('https://api.github.com/markdown/raw')--请求URL
.post(RequestBody.create(mediaType,requestBody))
.build()
okHttpClient = OkHttpClient()
okHttpClient.newCall(request).enqueue(Callback{
  onFailure = function(call,e)--失败请求
    print(e)
  end,

  onResponse = function(call,response)--请求成功
    headers = response.headers()
    print(headers)--展示返回头部
    print(response.body().string())--展示返回内容
  end
})