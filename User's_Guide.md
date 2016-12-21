# SBC-7112S-Linux3.0.35-Qt4.8.5 User's Guide

## 一、说明

在阅读本文之前，请确保您已经阅读过[《SBC-7112S-Linux3.0.35-Qt4.8.5 Quick Start Guide》](Quick_Start_Guide.md)

如果您还没有硬件主板或者对应的开发BSP包，请跟我们的业务人员联系，他们将会向您提供相关硬件、软件资源。

本文涉及到的虚拟机操作，均是站在以下条件下进行操作：

* 采用VMware搭建的Ubuntu 12.04虚拟机；
* 账户名：aplex；
* 密码：aplex；
* 以下执行的命令都是在VMware Ubuntu 12.04虚拟机中执行；

如下是实际搭建开发环境步骤：

## 二、环境搭建、配置交叉编译器

* 使用VMware安装：Ubuntu 12.04 64位系统。  
如果您没有Ubuntu 12.04镜像，请使用BSP包中`board-support/VMware-Workstation/ubuntu-12.04-desktop-amd64.iso`镜像。
* 安装软件包，若果出现出错，请执行`sudo apt-get update`再继续：
```shell
    sudo apt-get update
    sudo apt-get install rpm 
    sudo apt-get install m4 
    sudo apt-get install bison 
    sudo apt-get install patch 
    sudo apt-get install build-essential 
    sudo apt-get install zlib1g 
    sudo apt-get install zlib1g-dev 
    sudo apt-get install ncurses-dev 
    sudo apt-get install texinfo 
    sudo apt-get install liblzo2-dev 
    sudo apt-get install uuid-dev 
    sudo apt-get install gettext 
    sudo apt-get install libglib2.0-dev
    sudo apt-get install tree
    sudo apt-get install ia32-libs      # 由于是64位系统的原因
    sudo apt-get install libc6-dev-i386 # 由于是64位系统的原因
```
* 在aplex用户目录下创建aplex目录，所有所有操作内容均是在该目录下操作：
 * `mkdir aplex`;
 * `cd aplex`;
* 创建编译器存放目录，并拷贝、解压编译器包，配置编译器路径：
 * `mkdir -p linux-devkit/compiler`;
 * 将BSP包中`linux-devkit/compiler`中的编译器放入上面虚拟机`linux-devkit/compiler`的路径中,并解压：
```shell
    aplex@aplex:~/aplex$ ls linux-devkit/compiler/
    gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12.tar.bz2
    aplex@aplex:~/aplex$ tar xvf gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12.tar.bz2
    ...[省略解压输出信息]
    aplex@aplex:~/aplex$ ls linux-devkit/compiler/
    gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12
    gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12.tar.bz2
    aplex@aplex:~/aplex$ 
```
 * 配置交叉编译器路径：
```shell
    aplex@aplex:~/aplex$ cat ~/.bashrc
    ...[省略前面无关内容]

    export CROSS_COMPILE=arm-fsl-linux-gnueabi-
    export ARCH=arm

    export PATH=$PATH:/home/aplex/aplex/linux-devkit/compiler/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin
    aplex@aplex:~/aplex$ 
```
* 测试交叉编译器是否正常：
```shell
    aplex@aplex:~/aplex$ source ~/.bashrc 
    aplex@aplex:~/aplex$ arm             # <---------- 这里按两次Tab键看效果
    arm2hpdl                             arm-linux-gdbtui
    arm-fsl-linux-gnueabi-addr2line      arm-linux-gprof
    arm-fsl-linux-gnueabi-ar             arm-linux-ld
    arm-fsl-linux-gnueabi-as             arm-linux-ld.bfd
    arm-fsl-linux-gnueabi-c++            arm-linux-ldd
    arm-fsl-linux-gnueabi-cc             arm-linux-nm
    arm-fsl-linux-gnueabi-c++filt        arm-linux-objcopy
    arm-fsl-linux-gnueabi-cpp            arm-linux-objdump
    arm-fsl-linux-gnueabi-ct-ng.config   arm-linux-populate
    arm-fsl-linux-gnueabi-elfedit        arm-linux-ranlib
    arm-fsl-linux-gnueabi-g++            arm-linux-readelf
    arm-fsl-linux-gnueabi-gcc            arm-linux-run
    arm-fsl-linux-gnueabi-gcc-4.6.2      arm-linux-size
    arm-fsl-linux-gnueabi-gcov           arm-linux-strings
    arm-fsl-linux-gnueabi-gdb            arm-linux-strip
    arm-fsl-linux-gnueabi-gdbtui         arm-none-linux-gnueabi-addr2line
    arm-fsl-linux-gnueabi-gprof          arm-none-linux-gnueabi-ar
    arm-fsl-linux-gnueabi-ld             arm-none-linux-gnueabi-as
    arm-fsl-linux-gnueabi-ld.bfd         arm-none-linux-gnueabi-c++
    arm-fsl-linux-gnueabi-ldd            arm-none-linux-gnueabi-c++filt
    arm-fsl-linux-gnueabi-nm             arm-none-linux-gnueabi-cpp
    arm-fsl-linux-gnueabi-objcopy        arm-none-linux-gnueabi-ct-ng.config
    arm-fsl-linux-gnueabi-objdump        arm-none-linux-gnueabi-elfedit
    arm-fsl-linux-gnueabi-populate       arm-none-linux-gnueabi-g++
    arm-fsl-linux-gnueabi-ranlib         arm-none-linux-gnueabi-gcc
    arm-fsl-linux-gnueabi-readelf        arm-none-linux-gnueabi-gcc-4.6.2
    arm-fsl-linux-gnueabi-run            arm-none-linux-gnueabi-gcov
    arm-fsl-linux-gnueabi-size           arm-none-linux-gnueabi-gdb
    arm-fsl-linux-gnueabi-strings        arm-none-linux-gnueabi-gdbtui
    arm-fsl-linux-gnueabi-strip          arm-none-linux-gnueabi-gprof
    arm-linux-addr2line                  arm-none-linux-gnueabi-ld
    arm-linux-ar                         arm-none-linux-gnueabi-ld.bfd
    arm-linux-as                         arm-none-linux-gnueabi-ldd
    arm-linux-c++                        arm-none-linux-gnueabi-nm
    arm-linux-c++filt                    arm-none-linux-gnueabi-objcopy
    arm-linux-cpp                        arm-none-linux-gnueabi-objdump
    arm-linux-ct-ng.config               arm-none-linux-gnueabi-populate
    arm-linux-elfedit                    arm-none-linux-gnueabi-ranlib
    arm-linux-g++                        arm-none-linux-gnueabi-readelf
    arm-linux-gcc                        arm-none-linux-gnueabi-run
    arm-linux-gcc-4.6.2                  arm-none-linux-gnueabi-size
    arm-linux-gcov                       arm-none-linux-gnueabi-strings
    arm-linux-gdb                        arm-none-linux-gnueabi-strip
    aplex@aplex:~/aplex$ arm
```
* 文件夹结构如下：
```shell
    aplex@aplex:~/aplex$ tree -L 3
    .
    └── linux-devkit
        └── compiler
            ├── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12
            └── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12.tar.bz2

    5 directories, 1 file
    aplex@aplex:~/aplex$ 
```

## 三、编译U-boot

* 虚拟机中创建`board-support/u-boot-source-code`目录：
```shell
    aplex@aplex:~/aplex$ ls
    board-support  linux-devkit
    aplex@aplex:~/aplex$ tree -L 3
    .
    ├── board-support
    │   └── u-boot-source-code
    └── linux-devkit
        └── compiler
            ├── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12
            └── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12.tar.bz2

    8 directories, 3 files
    aplex@aplex:~/aplex$ 
```
* 将BSP包中`board-support/u-boot-source-code`目录下的内核拷贝进虚拟机`board-support/u-boot-source-code`中，并解压tar包，目录情况如下：
```
    aplex@aplex:~/aplex$ tree -L 3
    .
    ├── board-support
    │   └── u-boot-source-code
    │       ├── linux-uboot
    │       └── linux-uboot.tar.gz
    └── linux-devkit
        └── compiler
            ├── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12
            └── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12.tar.bz2

    8 directories, 3 files
    aplex@aplex:~/aplex$ 
```
* 编译U-Boot：
 * `cd board-support/u-boot-source-code/linux-uboot`;
 * `make distclean`;
 * `make mx6dl_sabresd_android_config`;
 * `make`
 * 

## 四、编译Linux Kernel

* 虚拟机中创建`board-support/linux-kernel-source-code`目录：
```shell
    aplex@aplex:~/aplex$ ls
    board-support  linux-devkit
    aplex@aplex:~/aplex$ tree -L 3
    .
    ├── board-support
    │   ├── linux-kernel-source-code
    │   └── u-boot-source-code
    │       ├── linux-uboot
    │       └── linux-uboot.tar.gz
    └── linux-devkit
        └── compiler
            ├── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12
            └── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12.tar.bz2

    8 directories, 3 files
    aplex@aplex:~/aplex$ 
```
* 将BSP包中`board-support/linux-kernel-source-code`目录下的内核拷贝进虚拟机`board-support/linux-kernel-source-code`中，并解压tar包：
```
    aplex@aplex:~/aplex$ ls
    board-support  linux-devkit
    aplex@aplex:~/aplex$ tree -L 3
    .
    ├── board-support
    │   ├── linux-kernel-source-code
    │   │   ├── linux_kernel
    │   │   └── linux_kernel.tar.gz
    │   └── u-boot-source-code
    │       ├── linux-uboot
    │       └── linux-uboot.tar.gz
    └── linux-devkit
        └── compiler
            ├── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12
            └── gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12.tar.bz2

    6 directories, 2 files
    aplex@aplex:~/aplex$ 
```
* 

## 五、Qt库编译

## 六、SDK Demo

## 七、如何使用我们的VMware Workstation 

### 7.1 登录信息：
 username: aplex
 passwd: aplex
