---
weight: 1
bookFlatSection: true
title: "03-02 Defer关键字"
---
# Defer关键字

------------------

{{< hint info >}}
**From MLUA**
{{< /hint >}}


>延时执行，还有自动回收，可以在error时执行
>
>--@ninenr语录

``````lua
function test()

print(1)

print(2)

print(3)

print(4)

end

test()
``````

运行这个函数，可以看到由上至下打印出1234

``````lua
function test()

defer print(1)

defer print(2)

print(3)

defer print(4)

end

test()--运行这个函数，可以看到打印出了3421
``````

说明代码运行顺序是先运行无defer的，然后有defer的从下往上运行
