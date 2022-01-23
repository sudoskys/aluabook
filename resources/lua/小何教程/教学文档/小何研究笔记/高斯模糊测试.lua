import "android.renderscript.Element"
import "android.renderscript.Allocation"
import "android.renderscript.RenderScript"
import "android.graphics.Bitmap"
import "android.renderscript.ScriptIntrinsicBlur"
import "android.graphics.Matrix"
import 'android.graphics.drawable.BitmapDrawable'

function 高斯模糊(id,tp,radius1,radius2)
  function blur( context, bitmap, blurRadius)
    renderScript = RenderScript.create(context);
    blurScript = ScriptIntrinsicBlur.create(renderScript, Element.U8_4(renderScript));
    inAllocation = Allocation.createFromBitmap(renderScript, bitmap);
    outputBitmap = bitmap;
    outAllocation = Allocation.createTyped(renderScript, inAllocation.getType());
    blurScript.setRadius(blurRadius);
    blurScript.setInput(inAllocation);
    blurScript.forEach(outAllocation);
    outAllocation.copyTo(outputBitmap);
    inAllocation.destroy();
    outAllocation.destroy();
    renderScript.destroy();
    blurScript.destroy();
    return outputBitmap;
  end
  function zoomBitmap(bitmap,scale)
    w = bitmap.getWidth();
    h = bitmap.getHeight();
    matrix = Matrix();
    matrix.postScale(scale, scale);
    bitmap = Bitmap.createBitmap(bitmap, 0, 0, w, h, matrix, true);
    return bitmap;
  end
  function blurAndZoom(context,bitmap,blurRadius,scale)
    return zoomBitmap(blur(context,zoomBitmap(bitmap, 1 / scale), blurRadius), scale);
  end
  id.setBackgroundDrawable(BitmapDrawable((blurAndZoom(activity,tp,radius1,radius2))))
end
--[[
高斯模糊(id,tp,radius1,radius2)
radius1 范围󿆡-25
radius2 范围󿆡-？(据图片而定太大报错)
]]

--调用例子
img=ImageView(activity)
activity.setContentView(img)

高斯模糊(img,loadbitmap("https://image.uisdc.com/wp-content/uploads/2019/06/uisdc-banner-20190614-2.jpg"),4,2)
--此代码来自mlua手册，稍微改动便于使用。如有侵权请联系我，会立刻删除。