# SBC_7109_455 User's Guide

## 一、说明

* 准备一个 ubuntu14.04以上版本的虚拟机。
* 在普通用户下执行下面操作.
* 在此之前你要熟悉一部分 git 的操作，参考网上教程进行学习。

## 二、环境搭建

* 执行如下命令进行安装相关软件以及下载相关代码
```shell
    sudo apt-get update
    sudo apt-get install vim git
    sudo apt-get install   libc6:i386   libstdc++6:i386   libncurses5:i386   zlib1g:i386
```
* 在当前用户目录下创建aplex目录，所有所有操作内容均是在该目录下操作：
```shell
    cd ~
    mkdir image aplex
    cd aplex
```
* 下载交叉编译器，并放入虚拟机的家目录下的 aplex 目录，并配置环境变量：
  * 交叉编译器下载地址为：
	* [CROSS_COMPILER](https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2)
  * 下载完了将它放入虚拟机 ~/aplex 目录，并解压:
	```shell
        cd  ~/aplex
        tar -xvf  gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
	```
  * 配置交叉编译器路径：
    ```shell
      aplex@Aplex:~/aplex$ cat ~/.bashrc
      [...省略前面无关内容]
      export PATH=~/aplex/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin:$PATH
      export ARCH=arm
      export CROSS_COMPILE=arm-linux-gnueabihf-
      aplex@Aplex:~$
    ```
  * 测试交叉编译器是否正常：
    ```shell
      aplex@Aplex:~/aplex$ source ~/.bashrc
      aplex@Aplex:~/aplex$ arm             # <---------- 这里按两次Tab键看效果
      arm2hpdl                        arm-linux-gnueabihf-gcov-tool
      arm-linux-gnueabihf-addr2line   arm-linux-gnueabihf-gdb
      arm-linux-gnueabihf-ar          arm-linux-gnueabihf-gfortran
      arm-linux-gnueabihf-as          arm-linux-gnueabihf-gprof
      arm-linux-gnueabihf-c++         arm-linux-gnueabihf-ld
      arm-linux-gnueabihf-c++filt     arm-linux-gnueabihf-ld.bfd
      arm-linux-gnueabihf-cpp         arm-linux-gnueabihf-nm
      arm-linux-gnueabihf-elfedit     arm-linux-gnueabihf-objcopy
      arm-linux-gnueabihf-g++         arm-linux-gnueabihf-objdump
      arm-linux-gnueabihf-gcc-5.3.1   arm-linux-gnueabihf-readelf
      arm-linux-gnueabihf-gcc-ar      arm-linux-gnueabihf-size
      arm-linux-gnueabihf-gcc-nm      arm-linux-gnueabihf-strings
      arm-linux-gnueabihf-gcc-ranlib  arm-linux-gnueabihf-strip
      arm-linux-gnueabihf-gcov

      aplex@Aplex:~/aplex$ arm
    ```

## 三、u-boot, kernel, rootfs  下载：
  * u-boot2011.09 源码下载：
  ```shell
    cd ~/aplex
    mkdir u-boot2011.09 && cd u-boot2011.09
    git init
    git pull https://github.com/AplexOS/U-Boot  SBC-7109S-455-Linux-Uboot-v2011.09:master
  ```
  * kernel4.4.12 源码下载：
  ```shell
    cd ~/aplex/
    mkdir kernel3.2.0 && cd kernel3.2.0
    git init
    git pull https://github.com/AplexOS/Linux-Kernel   SBC-7109S-455-Linux-Kernel-v3.2.0:master
  ```
  * rootfs 源文件下载：
  ```shell
	  cd ~/aplex
	  mkdir filesytem && cd filesytem
  ```
  ```shell
	  # 下面这一段必须升级到root 用户下操作，原因是因为 rootfs 的权限问题。
	  # 升级到 root 用户的命令是 su
	  su
	  git init
    git pull https://github.com/AplexOS/Filesystem   SBC_7109S_455_LINUX3.2.0_QT4.8.5_ROOTFS:master
	  # 下载完了之后退出 root 用户，命令是 exit。
	  exit
  ```

## 四、源代码的编译，ubi 文件系统的生成：
  * u-boot2011.09 编译：
  ```shell
    cd ~/aplex/u-boot2011.09/
    make O=out ok335x
    cp out/MLO  out/u-boot.img   ~/image/  -rf
    sudo cp out/tools/mkimage /bin/  -rf
    # mkimage 是生成 Uimage 的工具
    sync
  ```
  * kernel3.2.0 编译：
  ```shell
    cd ~/aplex/kernel3.2.0  
    make sbc7109_defconfig
    make uImage -j4
    cp arch/arm/boot/uImage ~/image -rf
  ```
  * ubi 文件系统的生成：
  ```shell
	  cd  ~/aplex/filesytem/
	  sudo apt-get install mtd-util
  ```

## 五、通过下面的方法，制作 SD 卡：
  *  [SDMakeimg](MakeSDimg.md)
