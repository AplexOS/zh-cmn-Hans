# Source Code Repack

本文介绍如何使用`tar`在Linux Shell下进行Android源代码打包过程。

## 过程

* 执行Shell命令`cd`跳转到Android源代码目录，输出如下：
```shell
    myzr@myzr:~$ pwd
    /home/myzr
    myzr@myzr:~$ cd myandroid/
    myzr@myzr:~/myandroid$ ls
    abi       dalvik       frameworks  libnativehelper  pdk        system
    bionic    development  gdk         Makefile         prebuilts  
    bootable  device       hardware    ndk              README     
    build     docs         kernel_imx  out              repo  
    cts       external     libcore     packages         sdk
    myzr@myzr:~/myandroid$ 
```
* 执行Shell命令`make clean`，之前的编译内容，其工作主要是删除`out`目录，输出如下：
```shell
    myzr@myzr:~/myandroid$ make clean
    ============================================
    PLATFORM_VERSION_CODENAME=REL
    PLATFORM_VERSION=4.2.2
    TARGET_PRODUCT=full
    TARGET_BUILD_VARIANT=eng
    TARGET_BUILD_TYPE=release
    TARGET_BUILD_APPS=
    TARGET_ARCH=arm
    TARGET_ARCH_VARIANT=armv7-a
    HOST_ARCH=x86
    HOST_OS=linux
    HOST_OS_EXTRA=Linux-3.2.0-29-generic-x86_64-with-Ubuntu-12.04-precise
    HOST_BUILD_TYPE=release
    BUILD_ID=JDQ39
    OUT_DIR=out
    ============================================
    Entire build directory removed.
    myzr@myzr:~/myandroid$ 
```
* 执行Shell命令`tar jcvf Android_Source_Code.tar.bz2 *`，tar的用法请参考[wikipedia Tar](https://zh.wikipedia.org/zh-hans/Tar)，输出如下：
```shell
    myzr@myzr:~/myandroid$ tar jcvf Android_Source_Code.tar.bz2 *
    abi/
    abi/cpp/
    abi/cpp/include/
    abi/cpp/include/cxxabi.h
    abi/cpp/include/new
    abi/cpp/include/typeinfo
    ...  [省略输出内容]
    myzr@myzr:~/myandroid$ ls
    abi                          dalvik       gdk              ndk        sdk
    Android_Source_Code.tar.bz2  development  hardware         packages   system
    bionic                       device       kernel_imx       pdk        
    bootable                     docs         libcore          prebuilts  
    build                        external     libnativehelper  README     
    cts                          frameworks   Makefile         repo
    myzr@myzr:~/myandroid$ 
```
* `Android_Source_Code.tar.bz2`就是源代码tar包，拷贝出来，发给你想要发给的人就可以了，一般开发者都知道`.tar.bz2`是什么文件，也知道怎么解压出里面的源代码。

 
