--需导入�����X请自行将运行助手拆包，在libs文件夹里
--POST提交文件，除注释外都是固定模板，复制粘贴即可
import 'com.kn.okhttp.*'
import 'okhttp3.*'
mediaType = MediaType.parse("text/x-markdown; charset=utf-8");
okHttpClient = OkHttpClient();
file = File(activity.getLuaDir()..'/init.lua');--提交的文件
request = Request.Builder()
        .url("https://api.github.com/markdown/raw")--URL
        .post(RequestBody.create(mediaType, file))
        .build();
okHttpClient.newCall(request).enqueue(Callback {
    onFailure = function(call, e) --失败
        print(e)
    end,

    onResponse = function(call,response) --成功
        print(response.headers())
        print(response.body().string())
    end
});