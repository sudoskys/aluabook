--需导入�����X请自行将运行助手拆包，在libs文件夹里
--sm.ms上传，除注释外都是固定模板，复制粘贴即可
import 'com.kn.okhttp.*'
import 'okhttp3.*'
--调用选择图库
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
    fileSrc = cursor.getString(idx)--返回路径
    filename = fileSrc:match('.+%/(.+)')--截取名字

    requestBody = MultipartBody.Builder()
    .setType(MultipartBody.FORM)
    .addFormDataPart('smfile',filename,RequestBody.create(MediaType.parse('multipart/form-data'),File(fileSrc)))--对应表单
    .build()
    request = Request.Builder()
    .header('User-Agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36')
    .url('https://sm.ms/api/upload')--URL
    .post(requestBody)
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
  end
end--nirenr