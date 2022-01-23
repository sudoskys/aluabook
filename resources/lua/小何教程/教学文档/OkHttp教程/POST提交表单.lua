--需导入�����X请自行将运行助手拆包，在libs文件夹里
--POST提交表单，除注释外都是固定模板，复制粘贴即可
--该测试网址已挂，自己寻找网址测试
import 'com.kn.okhttp.*'
import 'okhttp3.*'
okHttpClient = OkHttpClient();
requestBody = FormBody.Builder()
        .add("search", "Jurassic Park")--提交的表单
        .build();
request = Request.Builder()
        .url("https://en.wikipedia.org/w/index.php")--URL
        .post(requestBody)
        .build();

okHttpClient.newCall(request).enqueue(Callback {
    onFailure = function(call, e) --失败
        print(e);
    end,

    onResponse = function(call, response) --成功
        print(response.headers())
        print(response.body().string())
    end
});