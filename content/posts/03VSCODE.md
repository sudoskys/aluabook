
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


Lua-App编程上机的三个方案
三种，不是三步！！

> 原作sudoskys,同步于lua.dianas.cyou
> 

##  1.敲到键盘：Termux搭建code-server,实机调试
-------------

> 本篇教程可以让你：拥有一个随身Vscode（python环境），多机协同体验，（映射或反代后远程编写体验），可运行python脚本额外体验，与不受限制的LUA应用编写体验。

PS：你最好有一定的linux使用经验......

### 所需项目

#### Termux

>项目地址 https://gitee.com/mo2/linux

- 下载安装termux
GIThub镜像站
https://ghproxy.com/
https://git.yumenaka.net/
APP源
https://f-droid.org/repository/browse/?fdid=com.termux
https://github.com/termux/termux-app


- [直链](https://drive.sakura-bbs.cn/api/v3/file/source/34998/com.termux_118.apk?sign=m8OT3cuEy2m7KVqg8U7BXd229aoN2o9Yd7n7dfvZ5vk%3D%3A0)(22年0201):



- 输入```termux-setup-storage```开启文件访问权限。

- 使用tmoe项目快速搭建debian(推荐)或其他linux环境（请选择proot） （参考https://haohe.fun/2021/04/tmoe-linux%EF%BC%9A%E5%9C%A8android-%E5%92%8Cwindows10%E4%B8%8A%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-gnu-linux%E5%AE%B9%E5%99%A8/）


**具体操作**

```bash
bash -c "$(curl -fsSL https://gitee.com/mo2/linux/raw/2/2)"
```

耐心等待安装完毕，请勿熄屏！！！！！！！（要授权什么的）

```

其中，具体选择中，可以创建新用户作为ROOT。（推荐）
这个用户以后使用 su 命令来登陆。

其中，运行proot容器我使用KDE,比较像WIN.容易操作。

其中，一定要看清楚说明信息呃

```

安装完毕请完全重新启动APP。
输入debian启动最近的容器，终端输入```neofetch```查看系统信息。
接着输入```novnc```开启局域网VNC链接，（请确认您安装novnc,tmoe已经为您预装）。

打开局域网地址（终端输出信息），然后链接。就可以体验卡卡卡卡卡的桌面。

>
>PS：命令执行都可以使用Ctrl +键盘敲击 C 来中断操作
>


---

#### CODE-server（VScode服务端）

**官方安装教程**
https://github.com/coder/code-server/blob/main/docs/termux.md#installation

**快捷安装教程**

**前要**
由于我们到VSCODE的链接不是很稳定，在线安装请全局全球化....！


**安装NVM**（可选，大概，我也不知道）
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```


##### 问题处理

{{< hint warning >}}

**运行安装命令报错**
由于termux环境特殊，所以请执行以下操作。

**版本不兼容**

这里补充：最新的4.0.X 对termux有不可名状问题。
详见issuses https://github.com/coder/code-server/issues/4804

所以我们回退版本。
命令参数详见：https://zhuanlan.zhihu.com/p/375220401

{{< /hint >}}


所以请使用以下命令安装Code-server！
- 检查
```bash
curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run

```

- 安装目标

```bash

curl -fsSL https://code-server.dev/install.sh | sh -s -- --version=3.12.0
```

{{< hint info >}}
**不支持启动服务**

```bash
sudo systemctl enable --now code-server@$USER
```
报错如下
``````

System has not been booted with systemd as init system (PID 1). Can't operate. Failed to connect to 

``````

原因是Termux好像不支持，挂后台就行....
{{< /hint >}}


**安装完毕的配置**

可以链接vnc（推荐），打开文件管理器的（显示隐藏文件选项）
打开 **~/.config/code-server/config.yaml**
也可以使用vim呃
```
**vim   ~/.config/code-server/config.yaml**
```

具体配置
-   --port 9999指定端口运行，可以修改为80端口，这样就访问的时候就不需要输入端口号
-   --host 0.0.0.0 默认是127.0.0.1，只能本地访问，无法外网访问，所以得改成0.0.0.0，才能各个浏览器都能访问


结束......


服务器端（termux不用看）
https://segmentfault.com/a/1190000022267386
https://blog.csdn.net/day_to_die/article/details/105990565
https://cloud.tencent.com/developer/article/1902378


## 2.模拟器搭载开发工具
-------------
具体看这位的博客
https://bk.yyge.net/?post=128

或者自己下载模拟器安装开发工具即可.....


## 3.专业工具:使用Android studio + 安卓模拟器

---------------

### 所需项目

#### 安卓模拟器

#### Android Studio 安装

#### 一堆SDK

#### Androlua 环境支持
```
https://github.com/xiao00kang/AndroLua_Project_Template

```

这个方案我之前用过，可以用。
具体安装教程网上大把，这里不再赘述。
请 bing.com
