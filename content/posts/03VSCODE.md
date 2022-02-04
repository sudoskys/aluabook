
---
author: "sudoksys"
date: 2022-02-1
linktitle: VSCODE
menu:
  main:
    parent: tutorials
next: /tutorials/github-pages-blog
prev: /tutorials/automated-deployments
title: Lua-App编程上机的三个方案
weight: 10

---



## 一🏁大佬助力：VScode APP

https://www.coolapk.com/apk/com.nightmare.code

### 补充：局域网

如果需要局域网其他设备访问，请自行修改IP。

打开 ~/.config/code-server/config.yaml
--host 0.0.0.0 默认是127.0.0.1，只能本地访问，改成0.0.0.0即可.

## 二 🌠 自己动手：Termux搭建code-server

🍞本方案可以让你：

- 拥有一个随身Vscode（python环境）
  -多机协同体验，映射或反代后可以远程编写
  -python环境

### 准备

PS：你最好有一定的linux使用经验......

#### ✨Termux

> 项目地址  https://gitee.com/mo2/linux

🍞下载

- 直链
  https://drive.sakura-bbs.cn/api/v3/file/source/34998/com.termux_118.apk?sign=m8OT3cuEy2m7KVqg8U7BXd229aoN2o9Yd7n7dfvZ5vk%3D%3A0
  
- 其他渠道
GIThub镜像站
https://ghproxy.com/
https://git.yumenaka.net/

APP源
https://f-droid.org/repository/browse/?fdid=com.termux
https://github.com/termux/termux-app

🍞安装完毕，输入```termux-setup-storage```，开启文件访问权限。

- 使用tmoe项目快速搭建debian(推荐)或其他linux环境（请选择proot） （参考https://haohe.fun/2021/04/tmoe-linux%EF%BC%9A%E5%9C%A8android-%E5%92%8Cwindows10%E4%B8%8A%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-gnu-linux%E5%AE%B9%E5%99%A8/）

🍞输入
```shell
bash -c "$(curl -fsSL(https://gitee.com/mo2/linux/raw/2/2))"

```

耐心等待安装完毕，请勿熄屏！（需要授权）

💡具体选择中，可以创建新用户作为ROOT。（推荐）

💡这个用户以后使用 su 命令来登陆。

💡运行proot容器我使用KDE,比较像WIN.容易操作。

💡一定要看清楚说明信息呃

安装完毕请完全重新启动APP。

🍞输入debian启动最近的容器，终端输入 neofetch 查看系统信息。

🍞输入 novnc 开启局域网VNC链接，（请确认您安装novnc,tmoe已经为您预装）。

🍞打开局域网地址（终端输出信息），然后链接。就可以体验卡卡卡卡卡的桌面。

💡命令执行都可以使用Ctrl +键盘敲击 C 来中断操作

### ✨CODE-server（VScode服务端）

🍞安装

参考官方安装教程
https://github.com/coder/code-server/blob/main/docs/termux.md#installation

🍎安装教程

💡由于我们到VSCODE的链接不是很稳定，在线安装请全局全球化....！

🍞安装NVM（可选，大概，我也不知道）

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

💡问题处理

由于termux环境特殊，有些操作会报错

🚧版本不兼容
这里补充：最新的4.0.X 对termux有不可名状问题。
详见issuses https://github.com/coder/code-server/issues/4804 ，所以我们回退版本。
命令参数来自：https://zhuanlan.zhihu.com/p/375220401
所以请使用以下命令安装Code-server！🌈

🍞安装CODE-SERVER

curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run

curl -fsSL https://code-server.dev/install.sh | sh -s -- --version=3.12.0

🚧不支持启动服务
sudo systemctl enable --now code-server@$USER

这段报错

``````
System has not been booted with systemd as init system (PID 1). Can't operate. Failed to connect to
``````

原因是Termux不支持，挂后台就可以....

🍞安装完毕配置设置

可以链接vnc（推荐），打开文件管理器的（显示隐藏文件选项）
打开 ~/.config/code-server/config.yaml
也可以使用vim呃
```shell
vim   ~/.config/code-server/config.yaml
```


- --port 9999指定端口运行，可以修改为80端口，这样就访问的时候就不需要输入端口号
- --host 0.0.0.0 默认是127.0.0.1，只能本地访问，无法外网访问，所以得改成0.0.0.0，才能各个浏览器都能访问

🚧服务器端反向代理请看（termux不用看）
https://segmentfault.com/a/1190000022267386
https://blog.csdn.net/day_to_die/article/details/105990565
https://cloud.tencent.com/developer/article/1902378

## 三💫 模拟器上机：搭载开发工具

具体看这位的博客
https://bk.yyge.net/?post=128

或者自己下载模拟器安装开发工具即可.....

## 四🎯 完全上机:使用Android studio + 安卓模拟器


💡所需项目

✨ 安卓模拟器

✨ Android Studio 安装

✨ 一堆SDK

✨Androlua 环境支持
https://github.com/xiao00kang/AndroLua_Project_Template

这个方案我之前用过，可以用。
具体安装教程网上大把，这里不再赘述。
请 bing.com

💡luaApp工程请直接点击手机上按钮运行。方案二安装后自带python，python终端输出还是正常的！文件保存的冲突自己解决一下🙇
