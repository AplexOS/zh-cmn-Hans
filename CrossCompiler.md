# 系统交叉编译说明

## 一、环境搭建

* 执行如下命令进行安装相关软件以及下载相关代码
````shell
   sudo apt-get update
   sudo apt-get install git
````
* 创建相关目录，以备使用：
````shell
   cd ~
   mkdir image aplex
   cd aplex
````
* 下载交叉编译器，并放入虚拟机的家目录下的 aplex 目录，并配置环境变量：
    * 交叉编译器下载地址为：
  	* [CROSS_COMPILER](https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/arm-linux-gnueabihf/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz)
    * 下载完之后放入虚拟机, 并解压。
    * 假设，你放在虚拟机的家目录, 执行如下操作
    ```shell
      cd ~  &&  tar -xvf  gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
    ```
    * 将其加入环境变量，在 ~/.bashrc 的最后面，加入如下环境变量
    ```sh
      # vim ~/.bashrc
      export PATH=$PATH:~/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/
      export ARCH=arm
      export CROSS_COMPILE=arm-linux-gnueabihf-
    ```
    * 重启虚拟机，使环境变量生效。
    * 输入 `arm-linux-gnueabihf-gcc -v` ，看是否出现版本信息，如果有，表示配置环境变量成功。

## 二、Uboot, Kernel, Filesystem 下载
* Uboot2016.05 下载
```shell
  cd ~/aplex
  mkdir u-boot2016.05 && cd u-boot2016.05
  git init  && git pull https://github.com/AplexOS/U-Boot  CMI_AT151-Linux-Uboot-v2016.05:master
```
* Kernel4.4.12 下载
```shell
  cd ~/aplex && mkdir kernel4.4.12 && cd kernel4.4.12
  git init && git pull https://github.com/AplexOS/Linux-Kernel  CMI_AT151-Linux-Kernel-v4.4.12:master
```

* Filesystem 的下载
  *  文件系统的下载需要在 root 用户下执行, 有时候需要预设一个 root 密码, 命令如下:
  ```shell
    sudo passwd root
    # 下面输入三次 root 密码
  ```
  * 执行如下命令：
  ```shell
    cd ~/aplex && mkdir filesystem && cd filesystem
    su
    # su 是升级为 root 用户的命令
    git init &&  git pull https://github.com/AplexOS/Filesystem  CMI_AT151_LINUX4.4.12_ROOTFS:master
    exit
    # exit 是退出 root 用户的命令
  ```

## 三、U-boot， kernel 的编译，ubi.img 文件镜像的生成
*  U-boot2016.05 的交叉编译
```shell
  cd ~/aplex/u-boot2016.05/
  make -j2 O=out  am335x_cmi_at151_defconfig all
  #  编译万的镜像为 out 目录下的 MLO u-boot.img
  cp  out/MLO out/u-boot.img ~/image -rf
  # mkimage 是生成 uImge 的工具
```
* Kernel 4.4.12 的交叉编译
```shell
  cd ~/aplex/kernel4.4.12
  make am335x_cmi_at151_defconfig  && make all -j4
  cp arch/arm/boot/zImage ~/image/ -rf
  cp arch/arm/boot/dts/am335x-cmi_at151.dtb  ~/image/ -rf
  # 将生成的 UImage 也放到 ~/image 里面
```
* ubi.img 的生成
```shell
  sudo apt-get install mtd-utils
  cd ~/aplex/filesystem/
  sudo chmod 777 mkubiimg.sh  ubinize.cfg
  ./mkubiimg.sh
  # ubi.img 放在了 ~/image 目录下
```
## 四，生成 SD.img ， 直接对 SD 进行烧录系统
* 所有的镜像，目前都已经放置在 ~/iamge 里面， 请参考：
  [MKSDimg](MkSDimg.md)
